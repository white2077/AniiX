package org.example.aniix.services.impl;

import org.example.aniix.entities.Users;
import org.example.aniix.repositories.IUsersRepository;
import org.example.aniix.security.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private IUsersRepository repository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users users = repository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Not found that user :)") );
        return new CustomUserDetails(users);
    }
}
