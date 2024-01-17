package org.example.aniix.repositories;

import org.example.aniix.entities.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ITagRepository extends JpaRepository<Tag,Long> {
}
