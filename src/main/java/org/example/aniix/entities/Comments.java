package org.example.aniix.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comments {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Column(columnDefinition = "nvarchar(2000)")
    private String comment;

    @OneToMany(mappedBy = "comments")
    private Set<Comments> reply;
    @ManyToOne
    private Comments comments;
    @ManyToOne
    private Users users;
    @ManyToOne
    private Flim flim;
}
