package edu.sm.app.repository;

import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TrainerRepository extends SMRepository<Integer, TrainerDto> {
    List<TrainerDto> getTrainerIds();
}
