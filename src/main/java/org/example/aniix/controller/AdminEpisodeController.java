package org.example.aniix.controller;

import org.example.aniix.dtos.EpisodeDTO;
import org.example.aniix.dtos.SeasonDTO;
import org.example.aniix.services.IEpisodeService;
import org.example.aniix.services.IFlimService;
import org.example.aniix.services.ISeasonService;
import org.example.aniix.services.IStorageService;
import org.example.aniix.validators.EpisodeValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/add-episode/season")
public class AdminEpisodeController {
    @Autowired
    private IEpisodeService episodeService;
    @Autowired
    private ISeasonService iSeasonService;
    @Autowired
    private IFlimService flimService;
    @Autowired
    private IStorageService storageService;
    private EpisodeValidator episodeValidator;
    private Long seasonId;
    private SeasonDTO seasonDTO;

    @GetMapping("/{id}")
    public String addEpisodePage(
            @PathVariable("id") Long id, Model model) {
        seasonDTO=iSeasonService.getById(id);
        seasonId = id;
        model.addAttribute("title",seasonDTO.getSeasonName());
        episodeValidator = new EpisodeValidator();
        model.addAttribute("thumbnail",flimService.getBySeasonId(seasonId).getThumbnail());
        model.addAttribute("allEpisode",seasonDTO.getEpisodes());
        model.addAttribute("episode",episodeValidator);
        return "admin/AddEpisode.jsp";
    }
    @PostMapping("/add-episode")
    public String addEpisode(@Valid EpisodeValidator episodeValidator, BindingResult bindingResult){
        EpisodeDTO episodeDTO = new EpisodeDTO();
        episodeDTO.setLinkFlim(storageService.uploadVideo(episodeValidator.getEpisodeVideo()));
        episodeDTO.setSeason(seasonDTO);
        episodeService.insert(episodeDTO);
        System.out.println("Insert complete"+ episodeDTO);
        return "redirect:/admin/add-episode/season/"+seasonId;
    }
}
