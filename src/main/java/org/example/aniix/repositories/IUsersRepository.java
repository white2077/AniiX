package org.example.aniix.repositories;

import lombok.NonNull;
import org.example.aniix.entities.Users;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface IUsersRepository extends JpaRepository<Users,Long> {
    public Optional<Users> findByUsername(String username);
    public Optional<Users> findByEmail(@NonNull String email);
}
