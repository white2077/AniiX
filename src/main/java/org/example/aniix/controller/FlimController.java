package org.example.aniix.controller;

import org.example.aniix.services.IEpisodeService;
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
    @Autowired
    private IEpisodeService episodeService;
    @GetMapping("/{id}")
    public String movieDetails(Model model , @PathVariable("id")Long id){
        model.addAttribute("flim",flimService.getById(id));
        return "/FlimDetails/TVShow.jsp";
    }
    @GetMapping("/{flimId}/watch/{episodeId}")
    public String wacthFlim(@PathVariable("flimId")Long flimId,@PathVariable("episodeId")Long episodeId,Model model){
        model.addAttribute("flim",flimService.getById(flimId));
        model.addAttribute("episode",episodeService.getById(episodeId));
        return "FlimDetails/watching.jsp";
    }
}
