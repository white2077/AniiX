package org.example.aniix.controller.web;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CategoryDTO;
import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.services.ICategoryService;
import org.example.aniix.services.IFlimService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/category")
@AllArgsConstructor

public class CategoryDetailsController {
    private ICategoryService categoryService;
    private IFlimService flimService;
    @GetMapping("/{id}")
    public String category(Model model, @PathVariable("id") Long id){
        CategoryDTO categoryDTO = categoryService.getById(id);
        model.addAttribute("category",categoryDTO);
        List<FlimDTO> flimDTOS = flimService.getAllByCategoryId(id);
        model.addAttribute("flims",flimDTOS);
        return "web/pages/category_details/CategoryDetails.jsp";
    }
}
