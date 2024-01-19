package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UsersDTO {
    private Long id;
    private String email;
    private String password;
    private String username;
    Set<RoleDTO> roles;
}
