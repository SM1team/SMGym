package edu.sm.app.repository;

import edu.sm.app.dto.AttendanceRateDto;
import edu.sm.app.dto.CustCheckDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository
@Mapper
public interface CustCheckRepository extends SMRepository<String, CustCheckDto> {

    void save(CustCheckDto custCheckDto); //출석기록 저장.

    Optional<CustCheckDto> findLatestCheckInByCustId(String custId); //특정 고객id로 가장 최신 출석기록 검색

    void update(CustCheckDto custCheckDto);

    void updateCheckEndTime(CustCheckDto custCheckDto);

    List<Map<String, Object>> getDailyVisitors();

    // 오늘 출입 중인 회원 수를 가져오는 메서드 추가
    int getCurrentActiveMembers();

    // 누적 방문자 수 조회
    int getTotalVisitors();

    // 오늘 방문자 수 조회
    int getVisitorsToday();

    List<AttendanceRateDto> getAttendanceRate();

    Map<String, Long> getVisitStatistics();






}
