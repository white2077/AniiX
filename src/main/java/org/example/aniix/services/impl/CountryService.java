package org.example.aniix.services.impl;

import org.example.aniix.dtos.CountryDTO;
import org.example.aniix.services.ICountryService;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CountryService implements ICountryService {
    @Override
    public List<CountryDTO> getAll() {
        return null;
    }

    @Override
    public CountryDTO getById(Long id) {
        return null;
    }

    @Override
    public CountryDTO insert(CountryDTO dto) {
        return null;
    }

    @Override
    public void update(CountryDTO dto) {

    }

    @Override
    public void delete(Long id) {

    }
}
