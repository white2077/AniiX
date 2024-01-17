package org.example.aniix.services;

import java.util.List;

public interface ICrudService <T,K>{
    public List<T> getAll();
    public T getById(K id);
    public T insert(T dto);
    public void update (T dto);
    public void delete(K id);
}
