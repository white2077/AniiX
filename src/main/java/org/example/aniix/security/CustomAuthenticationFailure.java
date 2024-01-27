package org.example.aniix.security;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
    public class CustomAuthenticationFailure extends SimpleUrlAuthenticationFailureHandler {
    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        super.onAuthenticationFailure(request, response, exception);
        String errorMessage = "";
        if (exception.getMessage().equalsIgnoreCase("Bad credentials")) {
            errorMessage = "Invalid username or password";
        } else if (exception.getMessage().equalsIgnoreCase("User account is locked")) {
            errorMessage = "User account is locked";
        } else if (exception.getMessage().equalsIgnoreCase("User account has expired")) {
            errorMessage = "User account has expired";
        }
        request.getSession().setAttribute("errorMessage", errorMessage);
    }
    }