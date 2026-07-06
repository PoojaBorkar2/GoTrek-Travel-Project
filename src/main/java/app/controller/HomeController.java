package app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

// The correct import for Tomcat 9 ecosystem environments:
import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping(value = {"/", "/home"})
    public String viewLandingPage() {
        return "home";
    }

    @GetMapping("/about")
    public String viewAboutPage()  {
        return "about";
    }

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

    // --- AUTHENTICATION MAPPINGS ---

    @GetMapping("/login")
    public String viewLoginPage() {
        return "login";
    }

    @GetMapping("/register")
    public String viewRegisterPage() {
        return "register";
    }

    @PostMapping("/login")
    public String handleLogin(@RequestParam("email") String email,
                              @RequestParam("password") String password,
                              HttpSession session,
                              Model model) {

        if ("admin@gotrek.com".equals(email) && "password123".equals(password)) {
            session.setAttribute("userEmail", email);
            session.setAttribute("username", "Explorer");
            return "redirect:/home";
        } else {
            model.addAttribute("errorMessage", "Invalid email credentials or password.");
            return "login";
        }
    }

    @PostMapping("/register")
    public String handleRegistration(@RequestParam("username") String username,
                                     @RequestParam("email") String email,
                                     @RequestParam("password") String password,
                                     RedirectAttributes redirectAttributes) {
        redirectAttributes.addAttribute("registered", "true");
        return "redirect:/login";
    }

    @GetMapping("/logout")
    public String handleLogout(HttpSession session) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/home";
    }
}