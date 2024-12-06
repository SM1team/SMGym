package edu.sm.controller;

import edu.sm.app.service.CurrentTimeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class CurrentTimeController {

    private final CurrentTimeService currentTimeService;

    @Autowired
    public CurrentTimeController(CurrentTimeService currentTimeService) {
        this.currentTimeService = currentTimeService;
    }

    // 현재 시간을 반환하는 API
    @GetMapping("/current-time")
    public String getCurrentTime() {
        return currentTimeService.getCurrentTime();
    }
}