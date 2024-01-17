package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.aniix.entities.Category;

import javax.persistence.Column;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlimDTO {
    private Long id;
    private String description;
    private String name;
    private int releaseYear;
    private Boolean status;
    private Boolean type;
    private Timestamp uploadDate;
    private String thumbnail;
    private Set<CategoryDTO> categories;
}
