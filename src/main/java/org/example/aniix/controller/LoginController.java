package org.example.aniix.controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("")
public class LoginController {
    @GetMapping("/login")
    public String login(@RequestParam(name = "error", required = false) String error, Model model) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        if (!(auth instanceof AnonymousAuthenticationToken)) {
//            return "redirect:/";
//        }
        return "login/login.jsp";
    }
    @PostMapping("/login")
    public String loginFail(Model model){
        model.addAttribute("error","Invalid username or password");
        return "login/login.jsp";
    }

}
