package org.example.aniix.controller.rest;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.CountryDTO;
import org.example.aniix.dtos.ResponeObject;
import org.example.aniix.services.ICountryService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.acls.model.AlreadyExistsException;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("api/v1/country")
@AllArgsConstructor
public class CountryRestController {
    private ICountryService countryService;
    @GetMapping("/all-country")
    public ResponseEntity<?> getAllCountry(){
        return ResponseEntity.ok(countryService.getAll());
    }
    @GetMapping("/country/{id}")
    public ResponseEntity<?> getCountryById(@PathVariable("id") Long id){
        return ResponseEntity.ok(countryService.getById(id));
    }
    @PostMapping("/add-country")
    public ResponseEntity<?> addCountry(@RequestBody CountryDTO countryDTO){
           CountryDTO dto = countryService.insert(countryDTO);
           return ResponseEntity.ok(new ResponeObject("OK","Insert user complete :)",dto));
    }
    @PutMapping("/update-country/{id}")
    public ResponseEntity<?> updateCountry(@PathVariable("id") Long id,@RequestBody CountryDTO countryDTO){
        countryDTO.setId(id);
        countryService.update(countryDTO);
        return ResponseEntity.ok(new ResponeObject("Done","Update complete",""));
    }
    @DeleteMapping("/delete-country/{id}")
    public ResponseEntity<?> deleteCountry(@PathVariable("id") Long id){
        countryService.delete(id);
        return ResponseEntity.ok(new ResponeObject("ok","delete complete",""));
    }
}
