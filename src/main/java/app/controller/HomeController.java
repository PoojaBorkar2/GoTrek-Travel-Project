package app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping(value = {"/", "/home"})
    public String viewLandingPage() {
        // This must perfectly match the name of your file in WEB-INF/views/
        return "home";
    }

    //About page
    @GetMapping("/about")
    public String viewAboutPage() {
        return "about";
    }


    //About page mapping remains above...

    @SuppressWarnings("SpellCheckingInspection")
    @GetMapping("/tourpackage")
    public String viewPackagesPage() {
        return "tourpackage";
    }

    @GetMapping("/info")
    public String viewTouristInfoPage() {
        return "info";
    }

    @GetMapping("/blog")
    public String viewBlogPage() {
        // This will look for your blog.jsp file inside WEB-INF/views/
        return "blog";
    }

    @GetMapping("/gallery")
    public String viewGalleryPage() {
        return "gallery";
    }
    @GetMapping("/contact")
    public String viewContactPage() {
        return "contact";
    }
}