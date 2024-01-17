package org.example.aniix.repositories;

import org.example.aniix.entities.Country;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ICountryRespository extends JpaRepository<Country,Long> {
}
