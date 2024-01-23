package org.example.aniix;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.repositories.ICategoryRepository;
import org.example.aniix.repositories.IFlimRepository;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IFlimService;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AniiXApplicationTests {
    @Autowired
    ICategoryService categoryService;
    @Autowired

    ICategoryRepository repository;
    @Autowired

    ModelMapper modelMapper;
    @Autowired

    IFlimRepository flimRepository;
    @Autowired
    IFlimService flimService;
    @Test
    void contextLoads() {
        Long aLong = 1L;
        System.out.println(        flimService.getBySeasonId(aLong)
        );
    }

}
