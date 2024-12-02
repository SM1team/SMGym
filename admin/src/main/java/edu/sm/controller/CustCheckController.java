package edu.sm.controller;

import edu.sm.app.service.CustCheckService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/attendance")
@RequiredArgsConstructor
public class CustCheckController {


    @Autowired
    final CustCheckService custCheckService;

    @GetMapping("/active-member-count")
    public ResponseEntity<Integer> getActiveMemberCount() {
        int activeMembers = custCheckService.getActiveMemberCount();
        return ResponseEntity.ok(activeMembers);
    }

    @RequestMapping("/getDailyVisitors")
    @ResponseBody
    public List<Map<String, Object>> getDailyVisitors() {
        return custCheckService.getDailyVisitors(); // Mapper 호출
    }

    @GetMapping("/getTotalVisitors")
    public ResponseEntity<Integer> getTotalVisitors() {
        int totalVisitors = custCheckService.getTotalVisitors();
        return ResponseEntity.ok(totalVisitors);  // 반환된 값이 Integer여야 함
    }

    @GetMapping("/getVisitorsToday")
    public ResponseEntity<Integer> getVisitorsToday() {
        int visitorsToday = custCheckService.getVisitorsToday();
        return ResponseEntity.ok(visitorsToday);  // 반환된 값이 Integer여야 함
    }


}

