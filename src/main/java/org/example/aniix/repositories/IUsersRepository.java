package org.example.aniix.repositories;

import org.example.aniix.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface IUsersRepository extends JpaRepository<Users,Long> {
    public Optional<Users> findByUsername(String username);
}
