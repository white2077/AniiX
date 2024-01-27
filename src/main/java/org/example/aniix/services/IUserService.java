package org.example.aniix.services;

import org.example.aniix.dtos.UsersDTO;

public interface IUserService extends ICrudService<UsersDTO,Long>{
    public void addFavouriteFilm(String username,Long filmId);
    public UsersDTO getByUserName(String username);
}
