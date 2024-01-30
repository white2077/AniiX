package org.example.aniix.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class TagCategoryCountryController {
    @GetMapping("/tag-country-category/page")
    public String tagCountryCategoryPage(){
        return "admin/pages/category_country_tags/category_country_tag.jsp";
    }
}
