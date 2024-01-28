package org.example.aniix.controller;

import lombok.AllArgsConstructor;
import org.example.aniix.dtos.ResponeObject;
import org.example.aniix.dtos.SeasonDTO;
import org.example.aniix.dtos.UploadSeasonDTO;
import org.example.aniix.services.IFlimService;
import org.example.aniix.services.ISeasonService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.NoSuchElementException;

@RestController
@RequestMapping("api/v1/season")
@AllArgsConstructor
public class SeasonRestController {
    private IFlimService flimService;
    private ISeasonService seasonService;
    @GetMapping("/{id}/all-season")
    public ResponseEntity<ResponeObject> getAllSeasonByFilmId(@PathVariable("id") Long id) {
        try {
            List<SeasonDTO> dtos = flimService.getById(id).getSeasons();
            return ResponseEntity.status(HttpStatus.OK).body(new ResponeObject("Complete", "get season by film complete", dtos));
        } catch (NoSuchElementException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(new ResponeObject("Fail", "Film not found", ""));
        }
    }

    @PostMapping("/{id}/add-season")
    public ResponseEntity<ResponeObject> addSeason(@PathVariable("id") Long id, @RequestBody UploadSeasonDTO uploadSeasonDTO) {
        uploadSeasonDTO.setFlim(flimService.getFlimForUpload(id));
        flimService.addSeason(uploadSeasonDTO);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponeObject("Complete", "add film season complete", uploadSeasonDTO));
    }
    @PatchMapping("update-season/{id}")
    public ResponseEntity<ResponeObject> updateSeason(@PathVariable("id") Long id, @RequestBody SeasonDTO seasonDTO) {
        seasonDTO.setId(id);
        seasonService.update(seasonDTO);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponeObject("Complete", "update film season complete", ""));
    }
    @DeleteMapping("update-season/{id}")
    public ResponseEntity<ResponeObject> updateSeason(@PathVariable("id") Long id) {
        seasonService.delete(id);
        return ResponseEntity.status(HttpStatus.OK).body(new ResponeObject("Complete", "delete film season complete", ""));
    }

}
