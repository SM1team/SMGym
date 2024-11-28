package edu.sm.app.repository;


import edu.sm.app.dto.TrainerCheckDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@Mapper
public interface TrainerCheckRepository extends SMRepository<String, TrainerCheckDto> {

    void save(TrainerCheckDto trainerCheckDto); //출석기록 저장.

    Optional<TrainerCheckDto> findLatestCheckInByTrainerId(String trainerId); //특정 고객id로 가장 최신 출석기록 검색

    void update(TrainerCheckDto trainerCheckDto);

    void updateCheckEndTime(TrainerCheckDto trainerCheckDto);

}
