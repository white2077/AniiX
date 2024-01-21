package org.example.aniix.services.impl;

import org.example.aniix.dtos.TagDTO;
import org.example.aniix.entities.Tag;
import org.example.aniix.repositories.ITagRepository;
import org.example.aniix.services.ITagService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
public class TagService implements ITagService {
    @Autowired
    private ITagRepository repository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<TagDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,TagDTO.class))
                .toList();
    }

    @Override
    public TagDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), TagDTO.class);
    }

    @Override
    public TagDTO insert(TagDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Tag.class)), TagDTO.class
                );
    }

    @Override
    public void update(TagDTO dto) {
        repository.save(modelMapper.map(dto,Tag.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }

    @Override
    public List<TagDTO> getAllById(Set<Long> ids) {
        return repository.findAllById(ids)
                .stream()
                .map(category -> modelMapper.map(category,TagDTO.class))
                .toList();
    }
}
