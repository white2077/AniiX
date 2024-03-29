package org.example.aniix.services.impl;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.SeasonDTO;
import org.example.aniix.entities.Season;
import org.example.aniix.repositories.ISeasonRepository;
import org.example.aniix.services.ISeasonService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
@AllArgsConstructor

public class SeasonService implements ISeasonService {
    private ISeasonRepository repository;
    private ModelMapper modelMapper;
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
        Season season = repository.findById(dto.getId()).orElseThrow();
        season.setSeasonName(dto.getSeasonName());
        season.setReleaseYear(dto.getReleaseYear());
        repository.save(season);
    }

    @Override
    public void delete(Long id) {
        repository.deleteById(id);
    }

    @Override
    public List<SeasonDTO> getAllById(Set<Long> ids) {
        return null;
    }

    @Override
    public List<SeasonDTO> paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }

    @Override
    public void updateSeasonName(Long id, String name) {
        repository.updateName(id,name);
    }
}
