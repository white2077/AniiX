package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Set;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UploadFlimDTO {
    private Long id;
    private String description;
    private String name;
    private int releaseYear;
    private Boolean status;
    private Boolean type;
    private Timestamp uploadDate;
    private String thumbnail;
    private Set<CategoryDTO> categories;
    private CountryDTO country;
    private Set<TagDTO> tags;
}
