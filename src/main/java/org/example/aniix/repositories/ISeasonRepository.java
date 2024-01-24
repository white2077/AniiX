package org.example.aniix.repositories;

import org.example.aniix.entities.Season;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

public interface ISeasonRepository extends JpaRepository<Season,Long> {
    @Modifying
    @Transactional
    @Query("UPDATE Season e SET e.seasonName =:name WHERE e.Id =:id")
    void updateName(@Param("id") Long id, @Param("name") String name);
}
