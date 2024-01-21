package org.example.aniix.validators;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class FlimFormValidator {
    private String description;
    @NotEmpty
    @Size(min = 2,message = "Nhieu hon 2 ky tu")
    private String name;
    @NotNull(message = "Nhập năm đi bạn ơi")
    private Integer releaseYear;
    private Long country;
    private MultipartFile thumbnail;
    @NotEmpty
    @NotEmpty(message = "Please pick categories")
    private Set<Long> categories;
    @NotEmpty(message = "Please pick tags")
    private Set<Long> tags;
}
