
package edu.sm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chart")
@Slf4j
public class ChartController {

    @Autowired
    private CustService custService;
    @Autowired
    private CustCheckService custCheckService;


//    @RequestMapping("")
//    public String qr(Model model) {//custcheck 화면을 보여준다.
//
//
//        model.addAttribute("center", "qr/" + "center"); // 회원가입 페이지 제목 추가
//
//        return "index";
//    }

    @GetMapping("/gender")
    public String getGenderChartData(Model model) throws JsonProcessingException {
        Map<String, Integer> genderCounts = custService.getGenderCounts();

        // genderCounts 값 확인을 위한 로그 추가
        System.out.println("genderCounts: " + genderCounts);

        model.addAttribute("genderCounts", new ObjectMapper().writeValueAsString(genderCounts));
        model.addAttribute("center", "chart/gender");
        model.addAttribute("top", "chart/top");
        model.addAttribute("left", "chart/left");

        return "index";
    }

    @GetMapping("/visitor")
    public ResponseEntity<List<Map<String, Object>>> getDailyVisitors() {
        List<Map<String, Object>> dailyVisitors = custCheckService.getDailyVisitors();
        return ResponseEntity.ok(dailyVisitors); // JSON 형식으로 반환
    }



}