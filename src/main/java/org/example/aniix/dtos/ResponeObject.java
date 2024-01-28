package org.example.aniix.dtos;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class ResponeObject {
    private String status;
    private String message;
    private Object data;
}
