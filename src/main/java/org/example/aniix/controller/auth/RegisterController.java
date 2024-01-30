package org.example.aniix.controller.auth;

import org.example.aniix.dtos.RoleDTO;
import org.example.aniix.dtos.UsersDTO;
import org.example.aniix.entities.Role;
import org.example.aniix.services.IRoleService;
import org.example.aniix.services.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping
public class RegisterController {
    @Autowired
    private IUserService userService;
    @Autowired
    private PasswordEncoder encoder;
    @Autowired
    private IRoleService roleService;
    @GetMapping("/register")
    public String register(){
        return "register/register.jsp";
    }
    @PostMapping("/create-account")
    public String createAccount(
            @RequestParam("username") String username,
            @RequestParam("password")String password,
            @RequestParam("email") String email, Model model)
    {
        try {
            Set<RoleDTO> roles = new HashSet<>(roleService.getAll());
            UsersDTO usersDTO = new UsersDTO();
            usersDTO.setRoles(roles
                    .stream()
                    .filter(roleDTO -> roleDTO.getRoleName().equals("USER"))
                    .collect(Collectors.toSet()));
            usersDTO.setUsername(username);
            usersDTO.setPassword(encoder.encode(password));
            usersDTO.setEmail(email);
            userService.insert(usersDTO);
            return "redirect:/login";
        }catch (Exception e){
            model = e.getMessage().contains("User") ?
                    model.addAttribute("userError", e.getMessage()) : model.addAttribute("emailError", e.getMessage());
            return "register/register.jsp";
        }
    }
}
