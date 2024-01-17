package org.example.aniix.repositories;

import org.example.aniix.entities.Episode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface IEpisodeRepository extends JpaRepository<Episode,Long> {
}
