package org.example.aniix.controller;

import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
public class ImageController {
    @GetMapping("/flim-image/{name}")
    public ResponseEntity<ByteArrayResource> getFlimImage(@PathVariable("name")String name){
        try {
         Path image = Path.of("upload",name);
            byte[] buffer = Files.readAllBytes(image);
            ByteArrayResource byteArrayResource = new ByteArrayResource(buffer);
            return ResponseEntity
                    .ok()
                    .contentLength(buffer.length)
                    .contentType(MediaType.parseMediaType("image/jpeg"))
                    .contentType(MediaType.parseMediaType("image/png"))
                    .contentType(MediaType.parseMediaType("image/jpg"))
                    .body(byteArrayResource);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
