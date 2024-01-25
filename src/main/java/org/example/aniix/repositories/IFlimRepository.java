package org.example.aniix.repositories;

import org.example.aniix.entities.Flim;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface IFlimRepository extends JpaRepository<Flim,Long> {
    List<Flim> findTop5ByOrderByUploadDateDesc();
    List<Flim> findTop10ByOrderByUploadDateDesc();
    List<Flim> findAllByOrderByUploadDateDesc();

}
