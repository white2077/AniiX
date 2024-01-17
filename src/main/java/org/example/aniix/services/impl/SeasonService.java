package org.example.aniix.services.impl;

import org.example.aniix.dtos.SeasonDTO;
import org.example.aniix.entities.Season;
import org.example.aniix.repositories.ISeasonRepository;
import org.example.aniix.services.ISeasonService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
@Service
public class SeasonService implements ISeasonService {
    @Autowired
    private ISeasonRepository repository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<SeasonDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,SeasonDTO.class))
                .toList();
    }

    @Override
    public SeasonDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), SeasonDTO.class);
    }

    @Override
    public SeasonDTO insert(SeasonDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Season.class)), SeasonDTO.class
                );
    }

    @Override
    public void update(SeasonDTO dto) {
        repository.save(modelMapper.map(dto,Season.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }
}
