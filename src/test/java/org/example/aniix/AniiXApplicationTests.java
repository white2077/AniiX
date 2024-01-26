package org.example.aniix;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.repositories.ICategoryRepository;
import org.example.aniix.repositories.IFlimRepository;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IFlimService;
import org.example.aniix.services.ISeasonService;
import org.junit.jupiter.api.Test;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

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
    @Autowired
    ISeasonService service;

    @Test
    void contextLoads() {
        Long aLong = 1L;
        System.out.println(        flimService.getBySeasonId(aLong)
        );
    }

    @Test
    void testPaging() {
//        flimService.paging(PageRequest.of(0,10)).forEach(System.out::println);
        System.out.println(        flimService.getTotalPage(10)
        );
    }

    @Test
    void testSelectNewest() {
        flimRepository.findTop5ByOrderByUploadDateDesc().forEach(flim -> System.out.println(flim.getName()));
    }

    @Test
    void top10Newest() {

    }

    @Test
    void pagingFlimByCategory() {
        flimRepository.findAllFlimsByCategoryId(1L,PageRequest.of(0,10)).getContent().forEach(flim -> System.out.println(flim.getName()));
    }

    @Test
    void pagingFlimByCategoryService() {
        flimService.pagingFlimsByCategoryId(1L,PageRequest.of(0,10)).forEach(System.out::println);
        System.out.println(flimService.getPagingFlimsByCategoryIdToalPage(10,1L));
    }
}
