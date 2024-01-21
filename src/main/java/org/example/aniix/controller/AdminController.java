package org.example.aniix.controller;

import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.dtos.TagDTO;
import org.example.aniix.dtos.UploadFlimDTO;
import org.example.aniix.entities.Tag;
import org.example.aniix.services.*;
import org.example.aniix.validators.FlimFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

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
    @Autowired
    IStorageService storageService;

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
    public String addAFlim(
            @Valid
            @ModelAttribute FlimFormValidator flimFormValidator
            , BindingResult bindingResult,Model model,
            @RequestParam("country") Long country){
        Set<CategoryDTO> categoryDTOS = new HashSet<>(categoryService.getAllById(flimFormValidator.getCategories()));
        Set<TagDTO> tagDTOS = new HashSet<>(tagService.getAllById(flimFormValidator.getTags()));
        UploadFlimDTO uploadFlimDTO = new UploadFlimDTO();
        uploadFlimDTO.setName(flimFormValidator.getName());
        uploadFlimDTO.setReleaseYear(flimFormValidator.getReleaseYear());
        uploadFlimDTO.setStatus(true);
        uploadFlimDTO.setCountry(countryService.getById(country));
        uploadFlimDTO.setType(true);
        uploadFlimDTO.setDescription(flimFormValidator.getDescription());
        uploadFlimDTO.setThumbnail(storageService.storeFile(flimFormValidator.getThumbnail()));
        uploadFlimDTO.setCategories(categoryDTOS);
        uploadFlimDTO.setTags(tagDTOS);
        uploadFlimDTO.setUploadDate(Timestamp.valueOf(LocalDateTime.now()));
        System.out.println(uploadFlimDTO);
        flimService.upload(uploadFlimDTO);
        if (bindingResult.hasErrors()){
            model.addAttribute("countryList",countryService.getAll());
            model.addAttribute("flim",new FlimDTO());
            model.addAttribute("tagsList",tagService.getAll());
            model.addAttribute("categories",categoryService.getAll());
            return "admin/AddAnime.jsp";
        }
        return "redirect:/admin/add-new";
    }
}
