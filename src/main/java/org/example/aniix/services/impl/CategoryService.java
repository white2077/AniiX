package org.example.aniix.services.impl;

import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.entities.Category;
import org.example.aniix.repositories.ICategoryRepository;
import org.example.aniix.services.ICategoryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;

@Service
public class CategoryService implements ICategoryService {
    @Autowired
    private ICategoryRepository repository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<CategoryDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,CategoryDTO.class))
                .toList();
    }

    @Override
    public CategoryDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), CategoryDTO.class);
    }

    @Override
    public CategoryDTO insert(CategoryDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Category.class)), CategoryDTO.class
                );
    }


    @Override
    public void update(CategoryDTO dto) {
        repository.save(modelMapper.map(dto,Category.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }
}
