package org.example.aniix.services;

import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.dtos.UploadFlimDTO;
import org.example.aniix.dtos.UploadSeasonDTO;

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

}
