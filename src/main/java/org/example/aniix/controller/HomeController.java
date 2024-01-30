package org.example.aniix.controller;

import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IFlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping
public class HomeController {
    @Autowired
    private IFlimService flimService;
    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("top5Newest",flimService.getTop5Newest());
        model.addAttribute("flimList",flimService.getTop10Newest());
        return "web/pages/home/Home.jsp";
    }
}
