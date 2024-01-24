package org.example.aniix.services.impl;

import org.example.aniix.dtos.EpisodeDTO;
import org.example.aniix.entities.Episode;
import org.example.aniix.repositories.IEpisodeRepository;
import org.example.aniix.services.IEpisodeService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

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
        dto.setStatus(true);
        dto.setUploadDate(Timestamp.valueOf(LocalDateTime.now()));
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Episode.class)), EpisodeDTO.class
                );
    }

    @Override
    public void update(EpisodeDTO dto) {
        dto.setUpdateDate(Timestamp.valueOf(LocalDateTime.now()));
        repository.save(modelMapper.map(dto,Episode.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }

    @Override
    public List<EpisodeDTO> getAllById(Set<Long> ids) {
        return null;
    }
}
