package edu.sm.app.repository;

import edu.sm.app.dto.CustCheckDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
@Mapper
public interface CustCheckRepository extends SMRepository<String, CustCheckDto> {

    void save(CustCheckDto custCheckDto); //출석기록 저장.

    Optional<CustCheckDto> findLatestCheckInByCustId(String custId); //특정 고객id로 가장 최신 출석기록 검색

    void update(CustCheckDto custCheckDto);

}
