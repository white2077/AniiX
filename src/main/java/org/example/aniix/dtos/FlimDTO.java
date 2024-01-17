package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlimDTO {
    private Long id;
    private String description;
    private String name;
    private Boolean status;
    private Boolean type;
    private Timestamp uploadDate;
    private String thumbnail;
}
