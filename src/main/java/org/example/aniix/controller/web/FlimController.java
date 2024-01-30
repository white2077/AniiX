package org.example.aniix.controller.web;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.security.CustomUserDetails;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IEpisodeService;
import org.example.aniix.services.IFlimService;
import org.example.aniix.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/flim")
@AllArgsConstructor

public class FlimController {
    private IFlimService flimService;
    private IEpisodeService episodeService;
    private ICategoryService categoryService;
    private IUserService userService;

    @GetMapping("/{id}")
    public String movieDetails(Model model, @PathVariable("id") Long id) {
        model.addAttribute("flim", flimService.getById(id));
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication.isAuthenticated()) {
                CustomUserDetails customUserDetails = (CustomUserDetails) authentication.getPrincipal();
                Set<FlimDTO> dtoList = userService.getByUserName(customUserDetails.getUsername()).getFlims();
                Set<FlimDTO> set = dtoList
                        .stream()
                        .filter(flimDTO -> flimDTO.getId().equals(id))
                        .collect(Collectors.toSet());
                model.addAttribute("checkFilm", set.isEmpty());
            }
        } catch (Exception e) {
            model.addAttribute("checkFilm", false);
        }
        return "web/pages/flim_detail/TVShow.jsp";
    }

    @GetMapping("/{flimId}/watch/{episodeId}")
    public String wacthFlim(@PathVariable("flimId") Long flimId, @PathVariable("episodeId") Long episodeId, Model model) {
        model.addAttribute("flim", flimService.getById(flimId));
        model.addAttribute("episode", episodeService.getById(episodeId));
        return "web/pages/flim_detail/watching.jsp";
    }

    @GetMapping("/all-flim/page/{page}")
    public String allFlims(Model model, @PathVariable("page") int page) {
        model.addAttribute("category", "All film");
        int totalPage = flimService.getTotalPage(10);
        Pageable pageable = PageRequest.of(page - 1, 10);
        model.addAttribute("flims", flimService.paging(pageable));
        model.addAttribute("allPage", flimService.getTotalPage(10));
        model.addAttribute("currentPage", page);
        model.addAttribute("pagingType", true);
        if (page > totalPage && totalPage>0) {
            return "redirect:/flim/all-flim/page/"+1;
        }
        return "web/pages/category_details/CategoryDetails.jsp";
    }

    @GetMapping("/category/{id}/{page}")
    public String flimByCategory(Model model, @PathVariable("id") Long id, @PathVariable("page") int page) {
        int totalPage = flimService.getPagingFlimsByCategoryIdToalPage(10, id);
        List<FlimDTO> flimDTOS = flimService.pagingFlimsByCategoryId(id, PageRequest.of(page - 1, 10));
        model.addAttribute("category", categoryService.getById(id).getName());
        model.addAttribute("flims",flimDTOS );
        model.addAttribute("currentPage", page);
        model.addAttribute("pagingType", true);
        model.addAttribute("allPage", totalPage);
            if (page > totalPage && totalPage>0) {
                return "redirect:/flim/category/"+id+"/"+1;
            }
                return "web/pages/category_details/CategoryDetails.jsp";
    }

    @ModelAttribute("allCategory")
    public List<CategoryDTO> getAllCategory() {
        return categoryService.getAll();
    }

    @GetMapping("/searching")
    public String SearchingFilm(Model model, @RequestParam("keyword") String keyword, @RequestParam("page") int page) {
        int totalPage = flimService.getPagingSearchingFilmsTotalPage(10, keyword);
        if (keyword.isEmpty())keyword=" ";
        model.addAttribute("category", "Searching for: " + keyword);
        model.addAttribute("flims", flimService.pagingSearchingFilms(keyword, PageRequest.of(page - 1, 10)));
        model.addAttribute("currentPage", page);
        model.addAttribute("keyword", keyword);
        model.addAttribute("pagingType", false);
        model.addAttribute("allPage", totalPage);
        if (page > totalPage && totalPage>0) {
            return "redirect:/flim/searching?keyword=" + keyword + "&page=1";
        }
            return "web/pages/category_details/CategoryDetails.jsp";
    }
}
