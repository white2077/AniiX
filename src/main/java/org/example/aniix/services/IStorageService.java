package org.example.aniix.services;

import org.springframework.web.multipart.MultipartFile;

public interface IStorageService {
    public String storeFile(MultipartFile file);
    public void deleteByImageName(String name);
    public String uploadVideo(MultipartFile videoUp,String videoName);
    public void deleteVideo(String videoId);
}
