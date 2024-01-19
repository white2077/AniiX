package org.example.aniix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("")
public class LoginController {
    @GetMapping("/login")
    public String login(){
        return "login/login.jsp";
    }
//    @PostMapping("/login")
//    public String loging(@RequestParam("username") String username)
//    {
//        System.out.println(username);
//        return "home/Home.jsp";
//    }
    @GetMapping("/access-denied")
    public String accsesDenied(){
        return "Access Denied";
    }
}
