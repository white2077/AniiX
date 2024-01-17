package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class EpisodeDTO {
    private Long id;
    private Integer episode;
    private String linkFlim;
    private Boolean status;
    private Timestamp uploadDate;
    private SeasonDTO season;
}
