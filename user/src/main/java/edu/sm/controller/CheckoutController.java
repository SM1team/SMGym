package edu.sm.controller;

import edu.sm.app.service.CustCheckService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

@RestController
@RequestMapping("/checkout")
@RequiredArgsConstructor
@Slf4j

public class CheckoutController {

    private final CustCheckService custCheckService;

    @PostMapping
    public ResponseEntity<?> updateCheckEndTime(@RequestBody Map<String, String> payload) {
        log.info("checkout들어왔다잉");
        try {
            // JSON에서 custId와 scanTime 받기
            String custId = payload.get("custId");
            String scanTime = payload.get("scanTime");

            // scanTime을 LocalDateTime으로 변환
            DateTimeFormatter formatter = DateTimeFormatter.ISO_DATE_TIME;
            LocalDateTime parsedScanTime = LocalDateTime.parse(scanTime, formatter);

            // LocalDateTime을 String으로 변환해서 전달 (만약 String으로 저장하려면)
            String formattedScanTime = parsedScanTime.format(formatter);

            // 서비스 호출하여 출석 기록 저장 (formattedScanTime을 String으로 전달)
            custCheckService.updateCheckEndTime(custId, formattedScanTime);

            return ResponseEntity.ok().body(Map.of("message", "퇴실기록이 성공적으로 저장되었습니다."));
        } catch (Exception e) {
            return ResponseEntity.status(500).body(Map.of("message", "퇴실기록이 저장에 실패했습니다.", "error", e.getMessage()));
        }
    }


}
