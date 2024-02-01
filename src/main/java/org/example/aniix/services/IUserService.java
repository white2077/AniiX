package org.example.aniix.services;

import org.example.aniix.dtos.ResUsersDTO;
import org.example.aniix.dtos.UsersDTO;

import java.util.List;

public interface IUserService extends ICrudService<UsersDTO,Long>{
    public void addFavouriteFilm(String username,Long filmId);
    public UsersDTO getByUserName(String username);
    public List<ResUsersDTO> getAllListUsers();
}
