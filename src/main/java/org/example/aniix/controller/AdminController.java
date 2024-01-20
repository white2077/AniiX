package org.example.aniix.controller;

import org.example.aniix.dtos.UploadFlimDTO;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.ICountryService;
import org.example.aniix.services.IFlimService;
import org.example.aniix.services.ITagService;
import org.example.aniix.validator.FlimFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin")

public class AdminController {
    @Autowired
    private IFlimService flimService;
    @Autowired
    private ICountryService countryService;
    @Autowired
    private ITagService tagService;
    @Autowired
    private ICategoryService categoryService;
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.setDisallowedFields("categories");
        binder.setDisallowedFields("tags");
        binder.setDisallowedFields("country");
    }
    @GetMapping("/admin-page")
    public String adminPage(Model model){
        model.addAttribute("flim",flimService.getAll());
        return "admin/index.jsp";
    }
    @GetMapping("/add-new")
    public String addFlimPage(Model model){
        model.addAttribute("countryList",countryService.getAll());
        model.addAttribute("flim",new FlimFormValidator());
        model.addAttribute("tagsList",tagService.getAll());
        model.addAttribute("categories",categoryService.getAll());
        return "admin/AddAnime.jsp";
    }
    @GetMapping("/update-flim/{id}")
    public String updatePage(@PathVariable("id")Long id,Model model){
        model.addAttribute("countryList",countryService.getAll());
        model.addAttribute("flim",flimService.getById(id));
        model.addAttribute("tagsList",tagService.getAll());
        model.addAttribute("categories",categoryService.getAll());
        return "admin/AddAnime.jsp";
    }
    @PostMapping("/upload-flim")
    public String addAFlim(@Valid @ModelAttribute FlimFormValidator flimFormValidator, BindingResult bindingResult){
        System.out.println(bindingResult);
        System.out.println(flimFormValidator.toString());
        return "redirect:/admin/admin-page";
    }
}
