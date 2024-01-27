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
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
        System.out.println(flimService.getBySeasonId(aLong)
        );
    }

    @Test
    void testPaging() {
//        flimService.paging(PageRequest.of(0,10)).forEach(System.out::println);
        System.out.println(flimService.getTotalPage(10)
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
        flimRepository.findAllFlimsByCategoryId(1L, PageRequest.of(0, 10)).getContent().forEach(flim -> System.out.println(flim.getName()));
    }

    @Test
    void pagingFlimByCategoryService() {
        flimService.pagingFlimsByCategoryId(1L, PageRequest.of(0, 10)).forEach(System.out::println);
        System.out.println(flimService.getPagingFlimsByCategoryIdToalPage(10, 1L));
    }

    @Test
    void searchRepository() {
        flimRepository.findAllFlimsByNameLikeKeyword("Ya", PageRequest.of(0, 10)).forEach(flim -> System.out.println(flim.getName()));
    }

    @Test
    void testCallApi() {
        final String API_KEY = "https://services.giaohangtietkiem.vn/services/shipment/fee?pick_province=Ph%C3%BA%20Th%E1%BB%8D&pick_district=H%E1%BA%A1%20H%C3%B2a&pick_ward=Y%C3%AAn%20K%E1%BB%B3&pick_address=Khu%2014&province=H%C3%A0%20N%E1%BB%99i&district=Ho%C3%A0i%20%C4%90%E1%BB%A9c&ward=B%E1%BA%AFc%20Lai%20X%C3%A1&address=S%E1%BB%91%2059&weight=14200&value=180000";
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("token", "4221053c5f3662c434d094a9fc3c2f95c2193845");
        HttpEntity<String> requestEntity = new HttpEntity<>(headers);
        ResponseEntity<String> responseEntity = restTemplate.exchange(API_KEY, HttpMethod.GET, requestEntity, String.class);
        System.out.println(responseEntity.getBody());
    }
}
