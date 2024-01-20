package org.example.aniix.controller;

import org.example.aniix.services.IFlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")

public class AdminController {
    @Autowired
    private IFlimService flimService;

    @GetMapping("/admin-page")
    public String adminPage(Model model){
        model.addAttribute("flim",flimService.getAll());
        return "admin/index.jsp";
    }
    @GetMapping("/add-new")
    public String addFlimPage(){
        return "admin/AddAnime.jsp";
    }
}
