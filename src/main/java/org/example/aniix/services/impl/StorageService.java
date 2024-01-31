package org.example.aniix.services.impl;

import org.apache.commons.io.FilenameUtils;
import org.example.aniix.services.IStorageService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Arrays;
import java.util.UUID;
import video.api.client.ApiVideoClient;
import video.api.client.api.ApiException;
import video.api.client.api.clients.VideosApi;
import video.api.client.api.models.Video;
import video.api.client.api.models.VideoCreationPayload;

@Service
public class StorageService implements IStorageService {
    private final String API_KEY = "1Z1F0ID3OMtuuiYw45UAvrBY5UbAhjoxnrQp0hKBKxJ";

    private final Path storageFolder = Path.of("upload");

    public StorageService() {
        try {
            Files.createDirectories(storageFolder);
        }catch (IOException e){
            throw new RuntimeException("Failed to create");
        }
    }

    private boolean isImageFile(MultipartFile file){
        String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
        return Arrays.asList("png","jpg","jpeg","bmp").contains(fileExtension.trim().toLowerCase());}

    @Override
    public String storeFile(MultipartFile file) {
        try {
            if (file.isEmpty()) throw new RuntimeException("Failed to store empty file");
            if (!isImageFile(file)) throw new RuntimeException("You can only upload image file");
            float fileMb = file.getSize()/1_000_000;

            if (fileMb>5.0f)
                throw new RuntimeException("File must be less than 5mb");

            String fileExtension = FilenameUtils.getExtension(file.getOriginalFilename());
            String generatedFileName = UUID.randomUUID().toString().replace("-","");
            generatedFileName = generatedFileName +"."+fileExtension;

            Path destinationFilePath = this.storageFolder.resolve(Paths.get(generatedFileName)).normalize().toAbsolutePath();

            if (!destinationFilePath.getParent().equals(this.storageFolder.toAbsolutePath()))
                throw new RuntimeException("Can not store file outside current directory");

            try(InputStream inputStream = file.getInputStream()){
                Files.copy(inputStream,destinationFilePath, StandardCopyOption.REPLACE_EXISTING);
            }
            return generatedFileName;
        }catch (IOException e){
            throw new RuntimeException("Can not store file ",e);
        }
    }

    @Override
    public void deleteByImageName(String name) {
        Path filePath = storageFolder.resolve(name);
        try {
            Files.delete(filePath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String uploadVideo(MultipartFile videoUp, String videoName) {
        ApiVideoClient apiVideoClient = new ApiVideoClient(API_KEY);
        try {
            File file = convert(videoUp);
            Video video = apiVideoClient.videos().create(new VideoCreationPayload().title(videoName+UUID.randomUUID().toString().replace("-","")));
            video = apiVideoClient.videos().upload(video.getVideoId(),file);
            deleteTempFile(file);
            return video.getVideoId();
        } catch (ApiException e) {
            System.err.println("Exception when calling AccountApi#get");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getMessage());
            System.err.println("Response headers: " + e.getResponseHeaders());
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteVideo(String videoId) {
        ApiVideoClient client = new ApiVideoClient(API_KEY);
        VideosApi apiInstance = client.videos();
        try {
            apiInstance.delete(videoId);
        } catch (ApiException e) {
            System.err.println("Exception when calling VideosApi#delete");
            System.err.println("Status code: " + e.getCode());
            System.err.println("Reason: " + e.getMessage());
            System.err.println("Response headers: " + e.getResponseHeaders());
            e.printStackTrace();
        }
    }

    private File convert(MultipartFile multipartFile) throws IOException {
        File tempFile = File.createTempFile("temp", "."+FilenameUtils.getExtension(multipartFile.getOriginalFilename()));
        multipartFile.transferTo(tempFile);
        return tempFile;
    }
    private void deleteTempFile(File file) {
        if (file != null && file.exists()) {
            file.delete();
        }
    }

}
