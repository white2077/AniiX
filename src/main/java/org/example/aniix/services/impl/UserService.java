package org.example.aniix.services.impl;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.ResUsersDTO;
import org.example.aniix.dtos.UsersDTO;
import org.example.aniix.entities.Flim;
import org.example.aniix.entities.Users;
import org.example.aniix.repositories.IFlimRepository;
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
@AllArgsConstructor
public class UserService implements IUserService {
    private IUsersRepository repository;
    private ModelMapper modelMapper;
    private IFlimRepository flimRepository;

    public List<UsersDTO> getAll() {
        return repository.findAll()
                .stream()
                .map(category -> modelMapper.map(category, UsersDTO.class))
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

    @Override
    public void addFavouriteFilm(String username, Long filmId) {
        Users user = repository.findByUsername(username).orElseThrow(
                () -> new NoSuchElementException("Not Found"));
        user.getFlims().add(flimRepository.findById(filmId).orElseThrow(() -> new NoSuchElementException("")));
        repository.save(user);
    }

    @Override
    public UsersDTO getByUserName(String username) {
        return modelMapper
                .map(repository.findByUsername(username)
                        .orElseThrow(() -> new NoSuchElementException("Not found")), UsersDTO.class);
    }

    @Override
    public List<ResUsersDTO> getAllListUsers() {
        return repository.findAll().stream().map(users -> modelMapper.map(users,ResUsersDTO.class)).toList();
    }
}
