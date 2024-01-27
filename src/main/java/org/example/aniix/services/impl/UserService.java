package org.example.aniix.services.impl;

import org.example.aniix.dtos.UsersDTO;
import org.example.aniix.entities.Users;
import org.example.aniix.repositories.IUsersRepository;
import org.example.aniix.services.IUserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.acls.model.AlreadyExistsException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.NoSuchElementException;
import java.util.Set;

@Service
public class UserService implements IUserService {
    @Autowired
    private IUsersRepository repository;
    @Autowired
    private ModelMapper modelMapper;
    public List<UsersDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category,UsersDTO.class))
                .toList();
    }

    @Override
    public UsersDTO getById(Long id) {
        return modelMapper
                .map(repository.findById(id).orElseThrow(
                        () -> new NoSuchElementException("Not Found")
                ), UsersDTO.class);
    }

    @Override
    public UsersDTO insert(UsersDTO dto) {
        if (repository.findByUsername(dto.getUsername()).isPresent())
            throw new AlreadyExistsException("Username already exist");
        else if (repository.findByEmail(dto.getEmail()).isPresent())
            throw new AlreadyExistsException("Email already exist");
        else return modelMapper
                .map(
                        repository.save(modelMapper.map(dto, Users.class)), UsersDTO.class
                );
    }

    @Override
    public void update(UsersDTO dto) {
        repository.save(modelMapper.map(dto, Users.class));
    }

    @Override
    public void delete(Long id) {
        repository.findById(id);
    }

    @Override
    public List<UsersDTO> getAllById(Set<Long> ids) {
        return null;
    }

    @Override
    public List<UsersDTO> paging(Pageable pageable) {
        return null;
    }

    @Override
    public int getTotalPage(int amount) {
        return 0;
    }
}
