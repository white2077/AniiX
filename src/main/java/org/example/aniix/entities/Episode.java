package org.example.aniix.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Episode {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private int episode;
    @Column(columnDefinition = "nvarchar(2000)")
    private String linkFlim;
    private Timestamp uploadDate;
    private boolean status;

    @ManyToOne
    private Season season;
}
