package edu.sm.app.service;

import edu.sm.app.dto.AttendanceRateDto;
import edu.sm.app.dto.CustCheckDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustCheckRepository;
import edu.sm.util.QRCodeGenerator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
@Slf4j
public class CustCheckService implements SMService<String, CustCheckDto> {

    final CustCheckRepository custCheckRepository;

    @Override
    public void add(CustCheckDto custCheckDto) throws Exception {
        custCheckRepository.insert(custCheckDto);
    }

    @Override
    public void modify(CustCheckDto custCheckDto) throws Exception {
        custCheckRepository.update(custCheckDto);
    }

    @Override
    public void del(String s) throws Exception {
        custCheckRepository.delete(s);
    }

    @Override
    public CustCheckDto get(String s) throws Exception {
        return custCheckRepository.selectOne(s);
    }

    @Override
    public List<CustCheckDto> get() throws Exception {
        return custCheckRepository.select();
    }

    //QR생성
    public String generateQRCode(String custId) {
        try {
            // QR 코드에 담을 내용 (여기서는 회원 ID)
            String data = "https://127.0.0.1:85/check?custId=" + custId;

            // QR 코드 생성
            byte[] qrImageBytes = QRCodeGenerator.generateQRCodeImage(data);

            // Base64로 인코딩하여 반환
            return "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(qrImageBytes);

        } catch (Exception e) {
            e.printStackTrace();
            return "Error generating QR code";
        }
    }

    public void saveAttendance(String custId, String checkStart) throws Exception {
        CustCheckDto custCheckDto = new CustCheckDto();
        custCheckDto.setCustId(custId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(checkStart); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        custCheckDto.setCheckStart(timestamp); // checkStart에 Timestamp 값 설정
        custCheckRepository.save(custCheckDto); // 레포지토리 호출
    }

    public void updateCheckEndTime(String custId, String checkEnd) throws Exception {
        CustCheckDto custCheckDto = new CustCheckDto();
        custCheckDto.setCustId(custId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(checkEnd); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        custCheckDto.setCheckEnd(timestamp); // checkStart에 Timestamp 값 설정
        custCheckRepository.updateCheckEndTime(custCheckDto); // 레포지토리 호출
    }

    public List<Map<String, Object>> getDailyVisitors() {
        return custCheckRepository.getDailyVisitors();
    }

    // 현재 출입 중인 회원 수를 가져오는 메서드
    public int getActiveMemberCount() {
        return custCheckRepository.getCurrentActiveMembers();
    }

    // 누적 방문자 수 조회
    public int getTotalVisitors() {
        return custCheckRepository.getTotalVisitors();
    }

    // 오늘 방문자 수 조회
    public int getVisitorsToday() {
        return custCheckRepository.getVisitorsToday();
    }

    public List<AttendanceRateDto> getAttendanceRate() {
        return custCheckRepository.getAttendanceRate();  // Repository에서 호출
    }

    public Map<String, Object> getVisitStatistics() {
        try {
            // Repository에서 Map으로 결과 받아오기
            Map<String, Long> stats = custCheckRepository.getVisitStatistics();
            log.debug("Stats from repository: {}", stats);

            // stats에서 키 값에 맞게 값 추출
            Long todayCount = stats.get("today_count");
            Long yesterdayCount = stats.get("yesterday_count");
            Long dayBeforeYesterdayCount = stats.get("daybeforeyesterday_count");

            log.debug("Extracted values: todayCount={}, yesterdayCount={}, dayBeforeYesterdayCount={}", todayCount, yesterdayCount, dayBeforeYesterdayCount);

            // null 체크 후 값을 설정
            todayCount = (todayCount != null) ? todayCount : 0;
            yesterdayCount = (yesterdayCount != null) ? yesterdayCount : 0;
            dayBeforeYesterdayCount = (dayBeforeYesterdayCount != null) ? dayBeforeYesterdayCount : 0;

            log.debug("After null check: Today: {}, Yesterday: {}, Day Before Yesterday: {}", todayCount, yesterdayCount, dayBeforeYesterdayCount);

            // 방문 성장률 계산
            double visitGrowthRate = (yesterdayCount == 0) ? 0 :
                    ((double) (todayCount - yesterdayCount) / yesterdayCount) * 100;

            // 이전 성장률 계산
            double previousGrowthRate = (dayBeforeYesterdayCount == 0) ? 0 :
                    ((double) (yesterdayCount - dayBeforeYesterdayCount) / dayBeforeYesterdayCount) * 100;

            // 성장률 차이 계산
            double rateDifference = visitGrowthRate - previousGrowthRate;

            log.debug("Calculated growth rate: {}, rate difference: {}", visitGrowthRate, rateDifference);

            // 결과를 Map으로 반환
            Map<String, Object> result = new HashMap<>();
            result.put("visitGrowthRate", visitGrowthRate);
            result.put("rateDifference", rateDifference);

            return result;
        } catch (Exception e) {
            log.error("An error occurred while processing visit statistics", e);
            throw e;  // 예외 재발생 (필요시)
        }

    }







}








