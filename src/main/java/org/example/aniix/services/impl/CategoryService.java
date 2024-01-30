package org.example.aniix.services.impl;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.dtos.TagDTO;
import org.example.aniix.entities.Category;
import org.example.aniix.entities.Flim;
import org.example.aniix.repositories.ICategoryRepository;
import org.example.aniix.repositories.IFlimRepository;
import org.example.aniix.services.ICategoryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.stream.Collectors;

@Service
@AllArgsConstructor
public class CategoryService implements ICategoryService {

    private ICategoryRepository repository;

    private ModelMapper modelMapper;
    private IFlimRepository flimRepository;
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
        Category category = repository.findById(id).orElseThrow();
        Set <Flim> flims = category.getFlimList();
        flims.forEach(flim -> flim.getCategories().remove(category));
        flimRepository.saveAll(flims);
        repository.deleteById(id);
    }

    @Override
    public List<CategoryDTO> getAllById(Set<Long> ids) {
        return repository.findAllById(ids)
                .stream()
                .map(category -> modelMapper.map(category, CategoryDTO.class))
                .toList();
    }

    @Override
    public List<CategoryDTO> paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }
}
