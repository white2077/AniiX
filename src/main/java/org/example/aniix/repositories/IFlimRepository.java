package org.example.aniix.repositories;

import org.example.aniix.entities.Category;
import org.example.aniix.entities.Flim;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Set;

public interface IFlimRepository extends JpaRepository<Flim,Long> {
    List<Flim> findTop5ByOrderByUploadDateDesc();
    List<Flim> findTop10ByOrderByUploadDateDesc();
    List<Flim> findAllByOrderByUploadDateDesc();
    Page<Flim> findAllByOrderByUploadDateDesc(Pageable pageable);
    @Query("SELECT f FROM Category c JOIN c.flimList f WHERE c.Id=:id ORDER BY f.uploadDate DESC")
    Page<Flim> findAllFlimsByCategoryId(@Param("id") Long id, Pageable pageable);
}
