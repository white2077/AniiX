package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class ResUsersDTO {
    private String email;
    private String username;
    private Set<RoleDTO>roles;
}
