package org.example.aniix.controller.rest.web;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.services.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@RestController
@RequestMapping("api/v1/category-api")
@CrossOrigin
@AllArgsConstructor
public class CategoryRestController {
 private ICategoryService categoryService;
    @GetMapping("/get-all-category")
    ResponseEntity<?> getAllCategory(){
        ArrayList<CategoryDTO> categoryDTOS = new ArrayList<>(categoryService.getAll());
        Collections.reverse(categoryDTOS);
     return ResponseEntity.ok(categoryDTOS);
    }
    @PostMapping("/add-new-category")
    ResponseEntity<?> addCategory(@RequestBody CategoryDTO categoryDTO){
        return ResponseEntity.ok(categoryService.insert(categoryDTO));
    }
    @PutMapping("/update-category")
    public ResponseEntity<?> updateCategory(@RequestBody CategoryDTO categoryDTO){
        categoryService.update(categoryDTO);
        return ResponseEntity.ok("update category complete");
    }
    @DeleteMapping("/delete-category/{id}")
    public ResponseEntity<?> deleteCategory(@PathVariable("id")Long id){
        Map<String,String> responseMessage = new HashMap<>();
        responseMessage.put("message","delete complete");
        categoryService.delete(id);
        return ResponseEntity.ok(responseMessage);
    }
 }
