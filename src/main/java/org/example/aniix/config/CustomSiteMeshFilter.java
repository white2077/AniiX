package org.example.aniix.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {
    @Bean
    public FilterRegistrationBean<CustomSiteMeshFilter> siteMeshFilter() {
        FilterRegistrationBean<CustomSiteMeshFilter> filter = new FilterRegistrationBean<CustomSiteMeshFilter>();
        filter.setFilter(new CustomSiteMeshFilter());
        return filter;
    }
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        builder
                .setDecoratorPrefix("/WEB-INF/decorators/")
                .addDecoratorPath("/*", "web.jsp")
                .addDecoratorPath("","web.jsp")
                .addDecoratorPath("/admin/**","admin.jsp")
                .addExcludedPath("/login")
                .addExcludedPath("/register");
    }
}
