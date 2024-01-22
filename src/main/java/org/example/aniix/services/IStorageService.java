package org.example.aniix.services;

import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Path;
import java.util.stream.Stream;

public interface IStorageService {
    final String API_KEY = "1Z1F0ID3OMtuuiYw45UAvrBY5UbAhjoxnrQp0hKBKxJ";
    public String storeFile(MultipartFile file);
    public void deleteByImageName(String name);
    public String uploadVideo(MultipartFile videoUp);
}
