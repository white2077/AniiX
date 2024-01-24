package org.example.aniix.services;

import org.example.aniix.dtos.EpisodeDTO;
import org.example.aniix.dtos.SeasonDTO;

public interface ISeasonService extends ICrudService<SeasonDTO,Long>{
    public void updateSeasonName(Long id,String name);

}
