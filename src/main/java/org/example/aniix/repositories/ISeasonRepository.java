package org.example.aniix.repositories;

import org.example.aniix.entities.Season;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ISeasonRepository extends JpaRepository<Season,Long> {
}
