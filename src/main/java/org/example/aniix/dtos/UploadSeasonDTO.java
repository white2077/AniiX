package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadSeasonDTO {
    private Long id;
    private String seasonName;
    private Integer releaseYear;
    private Timestamp uploadDate;
    private Boolean status;
    private UploadFlimDTO flim;
}
