package org.example.aniix.controller;

import lombok.AllArgsConstructor;
import org.example.aniix.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
public class UseController {
    @Autowired
    private IUserService userService;
    @PostMapping("/add-to-favourite-list")
    public String addToFavouriteList(@RequestParam("filmId") Long filmId,@RequestParam("username")String username){
        userService.addFavouriteFilm(username,filmId);
        return "redirect:/flim/"+filmId;
    }
    @GetMapping("{username}/favourite-list")
    public String listFavourite(Model model, @PathVariable("username")String username){
        model.addAttribute("category", username+" favourite list");
        model.addAttribute("flims",userService.getByUserName(username).getFlims());
        model.addAttribute("currentPage", 0);
        model.addAttribute("pagingType",true);
        model.addAttribute("allPage", 0);
        return "CategoryDetails/CategoryDetails.jsp";
    }
}
