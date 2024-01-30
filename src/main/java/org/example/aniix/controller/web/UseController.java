package org.example.aniix.controller.web;

import org.example.aniix.dtos.UsersDTO;
import org.example.aniix.security.CustomUserDetails;
import org.example.aniix.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UseController {
    @Autowired
    private IUserService userService;

    @PostMapping("/add-to-favourite-list")
    public String addToFavouriteList(@RequestParam("filmId") Long filmId) {
        SecurityContext context =SecurityContextHolder.getContext();
        Authentication authentication = context.getAuthentication();
        userService.addFavouriteFilm(authentication.getName(), filmId);
        System.out.println(filmId);
        return "redirect:/flim/" + filmId;
    }

    @GetMapping("/favourite-list")
    public String listFavourite(Model model) {
        model.addAttribute("category", "Your favourite list");
        model.addAttribute("flims", userService.getByUserName(this.customUserDetails().getUsername()).getFlims());
        model.addAttribute("currentPage", 0);
        model.addAttribute("pagingType", true);
        model.addAttribute("allPage", 0);
        return "web/pages/category_details/CategoryDetails.jsp";
    }

    @DeleteMapping("/remove-film/{id}")
    public String removeFilmFromFavouriteList(@PathVariable("id") Long id) {
        UsersDTO usersDTO = userService.getByUserName(customUserDetails().getUsername());
        usersDTO.setFlims(usersDTO
                .getFlims()
                .stream()
                .filter(flimDTO -> !flimDTO.getId().equals(id))
                .collect(Collectors.toSet()));
        userService.update(usersDTO);
        return "redirect:/flim/" + id;
    }

    private CustomUserDetails customUserDetails() {
        SecurityContext context = SecurityContextHolder.getContext();
        return (CustomUserDetails) context.getAuthentication().getPrincipal();
    }
}
