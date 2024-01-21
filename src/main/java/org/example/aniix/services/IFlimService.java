package org.example.aniix.services;

import org.example.aniix.dtos.FlimDTO;
import org.example.aniix.dtos.UploadFlimDTO;

import java.util.List;

public interface IFlimService extends ICrudService<FlimDTO,Long> {
    List<FlimDTO> getAllByCategoryId(Long id);
    UploadFlimDTO upload(UploadFlimDTO uploadFlimDTO);
}
