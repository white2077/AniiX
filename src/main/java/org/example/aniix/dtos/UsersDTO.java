package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.aniix.entities.Flim;
import org.hibernate.validator.constraints.UniqueElements;

import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsersDTO {
    private Long id;
    private String email;
    private String password;
    private String username;
    private Set<RoleDTO> roles;
    private Set<FlimDTO> flims;
}
