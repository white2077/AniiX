package org.example.aniix.repositories;

import org.example.aniix.entities.Flim;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IFlimRepository extends JpaRepository<Flim,Long> {
}
