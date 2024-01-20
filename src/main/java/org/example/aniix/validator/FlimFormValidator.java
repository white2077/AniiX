package org.example.aniix.validator;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.sql.Timestamp;
import java.util.Set;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlimFormValidator {
    private String description;
    @NotEmpty
    @Size(min = 2,message = "dit me may")
    private String name;
    private int releaseYear;
    private Boolean status;
    private Boolean type;
    private Timestamp uploadDate;
    private String thumbnail;
    private Set<String> categories;
    private String country;
    private Set<String> tags;
}
