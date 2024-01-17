package org.example.aniix.services.impl;

import org.example.aniix.dtos.EpisodeDTO;
import org.example.aniix.dtos.SeasonDTO;
import org.example.aniix.entities.Episode;
import org.example.aniix.entities.Season;
import org.example.aniix.repositories.IEpisodeRepository;
import org.example.aniix.services.IEpisodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
@Service
public class EpisodeService implements IEpisodeService {
    @Autowired
    private IEpisodeRepository repository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<EpisodeDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,EpisodeDTO.class))
                .toList();
    }

    @Override
    public EpisodeDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), EpisodeDTO.class);
    }

    @Override
    public EpisodeDTO insert(EpisodeDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Episode.class)), EpisodeDTO.class
                );
    }

    @Override
    public void update(EpisodeDTO dto) {
        repository.save(modelMapper.map(dto,Episode.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }
}
