package org.example.aniix.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.hibernate.validator.constraints.UniqueElements;

import javax.persistence.*;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Users {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Column(unique=true)
    @NonNull
    private String username;
    @NonNull
    private String password;
    @Column(unique=true)
    @NonNull
    private String email;

    @ManyToMany
    private Set<Flim> flims;
    @ManyToMany
    private Set<Role> roles;
}
