package org.example.aniix.dtos;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.*;

import java.sql.Timestamp;
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class EpisodeDTO {
    private Long id;
    private String linkFlim;
    private Boolean status;
    private Timestamp uploadDate;
    @JsonIgnore
    private SeasonDTO season;
    private Timestamp updateDate;
}
