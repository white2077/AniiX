package org.example.aniix.repositories;

import org.example.aniix.entities.Category;
import org.example.aniix.entities.Flim;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface IFlimRepository extends JpaRepository<Flim,Long> {
}
