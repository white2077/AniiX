package org.example.aniix.controller;

import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IEpisodeService;
import org.example.aniix.services.IFlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/flim")
public class FlimController {
    @Autowired
    private IFlimService flimService;
    @Autowired
    private IEpisodeService episodeService;
    @Autowired
    private ICategoryService categoryService;
    @GetMapping("/{id}")
    public String movieDetails(Model model, @PathVariable("id") Long id) {
        model.addAttribute("flim", flimService.getById(id));
        return "/FlimDetails/TVShow.jsp";
    }

    @GetMapping("/{flimId}/watch/{episodeId}")
    public String wacthFlim(@PathVariable("flimId") Long flimId, @PathVariable("episodeId") Long episodeId, Model model) {
        model.addAttribute("flim", flimService.getById(flimId));
        model.addAttribute("episode", episodeService.getById(episodeId));
        return "FlimDetails/watching.jsp";
    }

    @GetMapping("/all-flim/page/{page}")
    public String allFlims(Model model, @PathVariable("page") int page) {
        model.addAttribute("category", "All film");
        int totalPage = flimService.getTotalPage(10);
        if (page<=totalPage){
            Pageable pageable = PageRequest.of(page - 1, 10);
            model.addAttribute("flims", flimService.paging(pageable));
            model.addAttribute("allPage", flimService.getTotalPage(10));
            model.addAttribute("currentPage", page);
            model.addAttribute("pagingType", true);
        return "CategoryDetails/CategoryDetails.jsp";
        }
        return "NotFound";
    }

    @GetMapping("/category/{id}/{page}")
    public String flimByCategory(Model model, @PathVariable("id") Long id, @PathVariable("page") int page) {
        model.addAttribute("category", categoryService.getById(id).getName());
        model.addAttribute("flims", flimService.pagingFlimsByCategoryId(id, PageRequest.of(page - 1, 10)));
        model.addAttribute("currentPage", page);
        model.addAttribute("pagingType",true);
        model.addAttribute("allPage", flimService.getPagingFlimsByCategoryIdToalPage(10, id));
        return "CategoryDetails/CategoryDetails.jsp";
    }

    @ModelAttribute("allCategory")
    public List<CategoryDTO> getAllCategory() {
        return categoryService.getAll();
    }

    @GetMapping("/searching")
    public String SearchingFilm(Model model, @RequestParam("keyword") String keyword, @RequestParam("page") int page) {
        model.addAttribute("category", "Searching for: " + keyword);
        model.addAttribute("flims", flimService.pagingSearchingFilms(keyword, PageRequest.of(page-1, 10)));
        model.addAttribute("currentPage", page);
        model.addAttribute("keyword",keyword);
        model.addAttribute("pagingType",false);
        model.addAttribute("allPage", flimService.getPagingSearchingFilmsTotalPage(10, keyword));
        return "CategoryDetails/CategoryDetails.jsp";
    }
}
