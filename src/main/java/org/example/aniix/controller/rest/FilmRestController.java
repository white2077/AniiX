package org.example.aniix.controller.rest;

import lombok.AllArgsConstructor;
import org.example.aniix.services.IFlimService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("api/v1.film-api/film")
public class FilmRestController {
    private IFlimService flimService;
    @GetMapping("/category/{id}")
    ResponseEntity<?> filmByCategoryId(@PathVariable("id") Long id){
        return ResponseEntity.ok(flimService.getAllByCategoryId(id));
    }
}
