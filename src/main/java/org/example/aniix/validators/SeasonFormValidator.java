package org.example.aniix.validators;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SeasonFormValidator {
    @NotEmpty
    private String seasonName;
    private Integer releaseYear;
}
