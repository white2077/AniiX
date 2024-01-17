package org.example.aniix.controller;

import org.example.aniix.services.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("api/v1/category-api")
public class CategoryRestController {
 @Autowired
 private ICategoryService categoryService;
    @GetMapping("/get-all-category")
    ResponseEntity<?> getAllCategory(){
     return ResponseEntity.ok(categoryService.getAll());
    }
 }
