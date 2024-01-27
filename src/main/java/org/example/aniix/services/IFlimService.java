package org.example.aniix.services;

import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.dtos.UploadFlimDTO;
import org.example.aniix.dtos.UploadSeasonDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IFlimService extends ICrudService<FlimDTO,Long> {
    List<FlimDTO> getAllByCategoryId(Long id);
    UploadFlimDTO upload(UploadFlimDTO uploadFlimDTO);
    UploadFlimDTO getFlimForUpload(Long id);
    UploadFlimDTO addSeason(UploadSeasonDTO uploadSeasonDTO);
    FlimDTO getBySeasonId(Long id);

    List<FlimDTO> getTop5Newest();
    List<FlimDTO> getTop10Newest();
    List<FlimDTO> getAllNewest();
    List<FlimDTO> pagingFlimsByCategoryId(Long id,Pageable pageable);
    int getPagingFlimsByCategoryIdToalPage(int amount,Long id);
    List<FlimDTO> pagingSearchingFilms(String keyword,Pageable pageable);
    int getPagingSearchingFilmsTotalPage(int amount,String keyword);


}
