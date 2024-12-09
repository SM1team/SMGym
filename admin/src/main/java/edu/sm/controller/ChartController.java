package edu.sm.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.CustService;
import edu.sm.app.service.PaymentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
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
    private final PaymentService paymentService;

    @GetMapping("/gender")
    public String getGenderChartData(Model model) throws JsonProcessingException {
        Map<String, Integer> genderCounts = custService.getGenderCounts();

        // 로그 출력
        log.info("Gender counts: {}", genderCounts);

        model.addAttribute("genderCounts", new ObjectMapper().writeValueAsString(genderCounts));
        model.addAttribute("center", "chart/gender");
        model.addAttribute("top", "chart/top");
        model.addAttribute("left", "chart/left");

        return "index";
    }



    @GetMapping("/sales")
    public String getSalesChartData(Model model) throws JsonProcessingException {
        // 월별 매출 통계 가져오기
        Map<String, Double> monthlySales = paymentService.getMonthlySales();
        log.info("Monthly sales: {}", monthlySales);

        // 성별 매출 통계 가져오기
        Map<String, Double> genderSales = paymentService.getGenderSales();
        log.info("Gender sales: {}", genderSales);

        // 나이대별 매출 통계 가져오기
        Map<String, Double> oldSales = paymentService.getOldSales();
        log.info("Old sales: {}", oldSales);

        // 데이터를 JSON 형식으로 변환하여 JSP에 전달
        ObjectMapper objectMapper = new ObjectMapper();
        model.addAttribute("monthlySales", objectMapper.writeValueAsString(monthlySales));
        model.addAttribute("genderSales", objectMapper.writeValueAsString(genderSales));
        model.addAttribute("oldSales", objectMapper.writeValueAsString(oldSales));

        // 화면에 필요한 레이아웃 데이터 추가
        model.addAttribute("center", "chart/sales");
        model.addAttribute("top", "chart/top");
        model.addAttribute("left", "chart/left");

        return "index";
    }

    @GetMapping("/visitor")
    public ResponseEntity<List<Map<String, Object>>> getDailyVisitors() {
        List<Map<String, Object>> dailyVisitors = custCheckService.getDailyVisitors();
        return ResponseEntity.ok(dailyVisitors); // JSON 형식으로 반환
    }

    @GetMapping("/monthly")
    public ResponseEntity<List<Map<String, Object>>> getMonthlyVisitors() {
        List<Map<String, Object>> stats = custCheckService.getMonthlyVisitorStats();
        return ResponseEntity.ok(stats);
    }



}
