package org.example.aniix.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Set;

public interface ICrudService <T,K>{
    public List<T> getAll();
    public T getById(K id);
    public T insert(T dto);
    public void update (T dto);
    public void delete(K id);
    public List<T> getAllById(Set<K> ids);
    public List<T> Paging(Pageable pageable);
    public int getTotalPage(int amount);
}
