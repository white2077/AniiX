package org.example.aniix.services.impl;

import org.example.aniix.dtos.RoleDTO;
import org.example.aniix.entities.Role;
import org.example.aniix.repositories.IRoleReposittory;
import org.example.aniix.services.IRoleService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
public class RoleService implements IRoleService {
    @Autowired
    private IRoleReposittory repository;
    @Autowired
    private ModelMapper modelMapper;
    public List<RoleDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,RoleDTO.class))
                .toList();
    }

    @Override
    public RoleDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), RoleDTO.class);
    }

    @Override
    public RoleDTO insert(RoleDTO dto) {
        return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Role.class)), RoleDTO.class
                );
    }

    @Override
    public void update(RoleDTO dto) {
        repository.save(modelMapper.map(dto, Role.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }

    @Override
    public List<RoleDTO> getAllById(Set<Long> ids) {
        return null;
    }

    @Override
    public List<RoleDTO> paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }
}
