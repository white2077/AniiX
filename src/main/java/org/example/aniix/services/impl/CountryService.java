package org.example.aniix.services.impl;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CountryDTO;
import org.example.aniix.entities.Country;
import org.example.aniix.entities.Flim;
import org.example.aniix.repositories.ICountryRespository;
import org.example.aniix.repositories.IFlimRepository;
import org.example.aniix.services.ICountryService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
@AllArgsConstructor
public class CountryService implements ICountryService {
    private ICountryRespository repository;
    private ModelMapper modelMapper;
    private IFlimRepository flimRepository;

    public List<CountryDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category, CountryDTO.class))
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
        Country country = repository.findById(dto.getId()).orElseThrow();
        country.setName(dto.getName());
        repository.save(country);
    }

    @Override
    public void delete(Long id) {
        Country country = repository.findById(id).orElseThrow(() -> new NoSuchElementException("Country not not found"));
        List<Flim> flims = country.getFlims();
        flims.forEach(flim -> {
            flim.setCountry(null);
        });
        flimRepository.saveAll(flims);
        repository.deleteById(id);
    }

    @Override
    public List<CountryDTO> getAllById(Set<Long> ids) {
        return null;
    }

    @Override
    public List<CountryDTO> paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }
}
