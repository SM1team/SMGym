package edu.sm.controller;

import edu.sm.app.service.CustCheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;

@RestController
@RequestMapping("/checkin")
@RequiredArgsConstructor
public class CheckinController {

    private final CustCheckService custCheckService;

    @PostMapping
    public ResponseEntity<?> saveAttendance(@RequestBody Map<String, String> payload) {
        try {
            // JSON에서 custId와 scanTime 받기
            String custId = payload.get("custId");
            String scanTime = payload.get("scanTime");

            // 서비스 호출하여 출석 기록 저장
            custCheckService.saveAttendance(custId, scanTime);

            return ResponseEntity.ok().body(Map.of("message", "출석 기록이 성공적으로 저장되었습니다."));
        } catch (Exception e) {
            return ResponseEntity.status(500).body(Map.of("message", "출석 기록 저장에 실패했습니다.", "error", e.getMessage()));
        }
    }
}
