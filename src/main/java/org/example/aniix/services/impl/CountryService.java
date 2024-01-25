package org.example.aniix.services.impl;

import org.example.aniix.dtos.CountryDTO;
import org.example.aniix.entities.Country;
import org.example.aniix.repositories.ICountryRespository;
import org.example.aniix.services.ICountryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
public class CountryService implements ICountryService {
    @Autowired
    private ICountryRespository repository;
    @Autowired
    private ModelMapper modelMapper;
    @Override
    public List<CountryDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,CountryDTO.class))
                .toList();
    }

    @Override
    public CountryDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), CountryDTO.class);
    }

    @Override
    public CountryDTO insert(CountryDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Country.class)), CountryDTO.class
                );
    }

    @Override
    public void update(CountryDTO dto) {
        repository.save(modelMapper.map(dto,Country.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }

    @Override
    public List<CountryDTO> getAllById(Set<Long> ids) {
        return null;
    }

    @Override
    public List<CountryDTO> Paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }
}
