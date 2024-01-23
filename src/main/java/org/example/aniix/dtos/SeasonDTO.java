package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SeasonDTO {
    private Long id;
    private String seasonName;
    private Integer releaseYear;
    private Timestamp uploadDate;
    private Boolean status;
    private List<EpisodeDTO> episodes;
}
