package org.example.aniix.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationSuccseshandler extends SimpleUrlAuthenticationSuccessHandler {
    @Override
    protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        String targetUrl = determineTargetUrl(authentication);
        if (response.isCommitted()) {
            return;
        }
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }

    protected String determineTargetUrl(Authentication authentication) {
        if (authentication.getAuthorities().stream().anyMatch(authority -> "ADMIN".equals(authority.getAuthority()))) {
            return "/admin/admin-page";
        } else if (authentication.getAuthorities().stream().anyMatch(authority -> "USER".equals(authority.getAuthority()))) {
            return "/";
        }
        return null;
    }
}
