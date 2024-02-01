package org.example.aniix.controller.rest;

import io.swagger.annotations.ApiResponse;
import lombok.AllArgsConstructor;
import org.example.aniix.dtos.ResponeObject;
import org.example.aniix.dtos.TagDTO;
import org.example.aniix.services.ITagService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/tags")
@AllArgsConstructor
public class TagRestController {
    private ITagService tagService;
    @GetMapping("/all-tags")
    public ResponseEntity<?> getAllTags() {
        return new ResponseEntity<>(new ResponeObject("Ok", "Get All Tags Complete", tagService.getAll()), HttpStatus.OK);
    }
    @PostMapping("/add-new-tag")
    public ResponseEntity<?> insertTag(@RequestBody TagDTO tagDTO){
        return ResponseEntity.ok(new ResponeObject("Ok","Add tag complete",""));
    }
}
