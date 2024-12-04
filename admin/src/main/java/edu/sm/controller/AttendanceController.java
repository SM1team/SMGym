package edu.sm.controller;

import edu.sm.app.dto.AttendanceRateDto;
import edu.sm.app.dto.TrainerCheckDto;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.TrainerCheckService;
import edu.sm.app.service.TrainerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequiredArgsConstructor
public class AttendanceController {

    private final CustCheckService custCheckService;
    private final TrainerCheckService trainerCheckService;

    @GetMapping("/")  // 기본 URL, 즉 첫 페이지를 호출할 때
    public String getAttendanceRatePage(Model model) {
        List<AttendanceRateDto> members = custCheckService.getAttendanceRate();  // 출석률 데이터 조회

        List<Map<String, Object>> attendanceList = trainerCheckService.getTodayAttendance();



        // 현재 달 정보 추가
        LocalDate now = LocalDate.now();
        String currentMonth = now.format(DateTimeFormatter.ofPattern("yyyy-MM"));  // 예: 2024-12

        model.addAttribute("members", members);  // JSP에 members 데이터 전달
        model.addAttribute("trainers", attendanceList);

        model.addAttribute("currentMonth", currentMonth);  // 현재 달 정보 전달
        return "index";  // index.jsp로 이동
    }
}

