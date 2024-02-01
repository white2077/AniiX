package org.example.aniix.controller.rest;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CountryDTO;
import org.example.aniix.dtos.ResponeObject;
import org.example.aniix.dtos.UsersDTO;
import org.example.aniix.services.IUserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.acls.model.AlreadyExistsException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/users")
@AllArgsConstructor
public class UserRestController {
    private IUserService userService;
    @GetMapping("/all-user")
    public ResponseEntity<?> getAllUsers(){
        return ResponseEntity.status(HttpStatus.OK).body(new ResponeObject("Ok","Get all users complete",userService.getAllListUsers()));
    }
    @PostMapping("/add-user")
    public ResponseEntity<?>addUser(@RequestBody UsersDTO usersDTO){
        try {
            userService.insert(usersDTO);
            return ResponseEntity.ok(new ResponeObject("Ok","Insert user complete",usersDTO));
        }catch (AlreadyExistsException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).body(new ResponeObject("Fail",e.getMessage(),""));
        }
    }
}
