package org.example.aniix.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Season {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Column(columnDefinition = "nvarchar(150)")
    private String seasonName;
    private Integer releaseYear;
    private Timestamp uploadDate;
    private Boolean status;
    @ManyToOne
    private Flim flim;
    @OneToMany(mappedBy = "season")
    private List<Episode> episodes;
}
