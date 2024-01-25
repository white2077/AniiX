package org.example.aniix.controller;

import org.example.aniix.dtos.*;
import org.example.aniix.services.*;
import org.example.aniix.validators.FlimFormValidator;
import org.example.aniix.validators.SeasonFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/admin")

public class AdminFlimController {
    @Autowired
    private IFlimService flimService;
    @Autowired
    private ICountryService countryService;
    @Autowired
    private ITagService tagService;
    @Autowired
    private ICategoryService categoryService;
    @Autowired
    private IStorageService storageService;
    @Autowired
    private ISeasonService seasonService;
    private UploadFlimDTO uploadFlimDTO;
    private FlimFormValidator flimFormValidator;
    private SeasonFormValidator seasonFormValidator;
    private UploadSeasonDTO uploadSeasonDTO;

    @ModelAttribute("categories")
    public List<CategoryDTO> categoryDTOS() {
        return categoryService.getAll();
    }

    @ModelAttribute("tagsList")
    public List<TagDTO> tagDTOS() {
        return tagService.getAll();
    }

    @ModelAttribute("countryList")
    public List<CountryDTO> countryDTOS() {
        return countryService.getAll();
    }



    @GetMapping("/add-new")
    public String addFlimPage(Model model) {
        model.addAttribute("uploadStatus", 1);
        model.addAttribute("title", "Add new");
        model.addAttribute("countryList", countryService.getAll());
        model.addAttribute("flim", new FlimFormValidator());
        model.addAttribute("tagsList", tagService.getAll());
        model.addAttribute("categories", categoryService.getAll());
        model.addAttribute("check", true);
        return "admin/UploadAnime.jsp";
    }

    @GetMapping("/update-flim/{id}")
    public String updatePage(@PathVariable("id") Long id, Model model) {
        uploadFlimDTO = flimService.getFlimForUpload(id);
        seasonFormValidator = new SeasonFormValidator();
        seasonFormValidator.setSeasonName(" Season "+(flimService.getById(id).getSeasons().size()+1)+": "+uploadFlimDTO.getName());
        model.addAttribute("flim", uploadFlimDTO);
        model.addAttribute("title", uploadFlimDTO.getName());
        model.addAttribute("season",seasonFormValidator);
        model.addAttribute("allSeason",flimService.getById(id).getSeasons());
        return "admin/UploadAnime.jsp";

    }

    @PostMapping("/upload-flim")
    public String addAFlim(
            @Valid
            @ModelAttribute FlimFormValidator flimFormValidator
            , BindingResult bindingResult, Model model,
            @RequestParam("country") Long country) {
        try {
            this.flimFormValidator = flimFormValidator;
            uploadFlimDTO = new UploadFlimDTO();
            flimService.upload(bindFlimData(flimFormValidator, country, uploadFlimDTO, true));
//            this.seasonFormValidator = new SeasonFormValidator();
            model.addAttribute("uploadStatus", 2);
//            model.addAttribute("season",this.seasonFormValidator);
            model.addAttribute("check", true);
        } catch (Exception e) {
            model.addAttribute("uploadStatus", 3);
            model.addAttribute("flim", this.flimFormValidator);
            model.addAttribute("check", true);
            if (bindingResult.hasErrors()) {
                System.out.println(bindingResult);
                return "/admin/UploadAnime.jsp";
            }
        }
        model.addAttribute("flim", new FlimFormValidator());
        return "admin/UploadAnime.jsp";
    }

    @PutMapping("/update-flim")
    public String updateFlim(Model model
            , @Valid FlimFormValidator flimFormValidator
            , BindingResult bindingResult
            , @RequestParam("thumbnail") MultipartFile thumbnail
            , @RequestParam("country") Long country) {
        model.addAttribute("check", false);
        try {
            if (!bindingResult.hasErrors()) {
                flimService.upload(bindFlimData(flimFormValidator, country, uploadFlimDTO, false));
                model.addAttribute("uploadStatus", 2);
                flimFormValidator = new FlimFormValidator();
            }
            else {
                model.addAttribute("uploadStatus", 3);
                return "redirect:/admin/update-flim/"+uploadFlimDTO.getId();
            }
        } catch (Exception e) {
            this.flimFormValidator = flimFormValidator;
            model.addAttribute("uploadStatus", 3);
            model.addAttribute("flim", this.flimFormValidator);
            return "/admin/UploadAnime.jsp";
        }
        return "redirect:/admin/admin-page";
    }

    @DeleteMapping("/delete-flim/{id}")
    public String deleteFlim(@PathVariable("id") Long id, @RequestParam("thumbnail") String thumbnail) {
        flimService.delete(id);
        if (!thumbnail.isEmpty()) storageService.deleteByImageName(thumbnail);

        return "redirect:/admin/admin-page";
    }
    @PostMapping("/add-season")
    public String addFlimSeason(
            @Valid SeasonFormValidator formValidator
            , BindingResult bindingResult){
        System.out.println(bindingResult);
        UploadSeasonDTO dto = new UploadSeasonDTO();
        dto.setFlim(uploadFlimDTO);
        dto.setSeasonName(formValidator.getSeasonName());
        dto.setStatus(true);
        dto.setUploadDate(Timestamp.valueOf(LocalDateTime.now()));
        dto.setReleaseYear(formValidator.getReleaseYear());
        flimService.addSeason(dto);
        return "redirect:/admin/update-flim/"+uploadFlimDTO.getId();
    }
    @PutMapping("/update-season/{id}")
    public String updateSeason(@PathVariable("id") Long id,@RequestParam("seasonName") String seasonName){
        seasonService.updateSeasonName(id,seasonName);
        return "redirect:/admin/update-flim/"+uploadFlimDTO.getId();
    }
    @DeleteMapping("/delete-season/{id}")
    public String deleteSeason(@PathVariable("id") Long id){
        seasonService.delete(id);
        return "redirect:/admin/update-flim/"+uploadFlimDTO.getId();
    }







    private UploadFlimDTO bindFlimData(
            FlimFormValidator flimFormValidator
            , Long country
            , UploadFlimDTO bind, boolean type) {
        Set<CategoryDTO> categoryDTOS = new HashSet<>(categoryService.getAllById(flimFormValidator.getCategories()));
        Set<TagDTO> tagDTOS = new HashSet<>(tagService.getAllById(flimFormValidator.getTags()));
        bind.setName(flimFormValidator.getName());
        bind.setReleaseYear(flimFormValidator.getReleaseYear());
        bind.setStatus(true);
        bind.setCountry(countryService.getById(country));
        bind.setType(true);
        bind.setDescription(flimFormValidator.getDescription());
        if (type) {
            bind.setThumbnail(storageService.storeFile(flimFormValidator.getThumbnail()));
        } else {
            if (flimFormValidator.getThumbnail().isEmpty()) {
                bind.setThumbnail(bind.getThumbnail());
            } else {
                storageService.deleteByImageName(bind.getThumbnail());
                bind.setThumbnail(storageService.storeFile(flimFormValidator.getThumbnail()));
            }
        }
        bind.setCategories(categoryDTOS);
        bind.setTags(tagDTOS);
        bind.setUploadDate(Timestamp.valueOf(LocalDateTime.now()));
        System.out.println(bind);
        return bind;
    }

}
