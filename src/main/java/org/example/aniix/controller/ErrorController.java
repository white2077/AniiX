package org.example.aniix.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("error")
public class ErrorController {
    @GetMapping("access-denied")
    public String accessDenied(){
        return "error/403.jsp";
    }
}
