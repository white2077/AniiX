package org.example.aniix;

import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.repositories.ICategoryRepository;
import org.example.aniix.services.ICategoryService;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AniiXApplicationTests {
    @Autowired ICategoryService categoryService;
    @Autowired
    ICategoryRepository repository;
    @Autowired
    ModelMapper modelMapper;
    @Test
    void contextLoads() {
    }

}
