package org.example.aniix.controller;

import org.example.aniix.services.IFlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/flim")
public class FlimController {
    @Autowired
    private IFlimService flimService;
    @GetMapping("/{id}")
    public String movieDetails(Model model , @PathVariable("id")Long id){
        model.addAttribute("flim",flimService.getById(id));
        return "/FlimDetails/TVShow.jsp";
    }
}
