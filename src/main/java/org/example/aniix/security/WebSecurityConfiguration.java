package org.example.aniix.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
    @Autowired
    UserDetailsService userDetailsService;

    @Bean
    AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService);
        daoAuthenticationProvider.setPasswordEncoder(new BCryptPasswordEncoder());
        return daoAuthenticationProvider;
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable().authorizeHttpRequests().anyRequest().permitAll();
        http.csrf()
                .disable()
                .authorizeHttpRequests()
                .antMatchers("/login", "/logout", "/")
                .permitAll()
                .antMatchers("/admin/**")
                .permitAll()
//                .hasAuthority("ADMIN")
                .antMatchers("/user/**")
                .permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .successHandler(customAuthenticationSuccseshandler())
                .failureForwardUrl("/login")
//                .failureHandler(customAuthenticationFailure())
                .permitAll()
                .and()
                .logout().logoutSuccessUrl("/login")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .and()
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/");
    }

    @Bean
    CustomAuthenticationSuccseshandler customAuthenticationSuccseshandler() {
        return new CustomAuthenticationSuccseshandler();
    }

    @Bean
    CustomAuthenticationFailure customAuthenticationFailure() {
        return new CustomAuthenticationFailure();
    }
}
