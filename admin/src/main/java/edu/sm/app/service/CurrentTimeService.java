// CurrentTimeService.java
package edu.sm.app.service;

import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

@Service
public class CurrentTimeService {

    // 현재 시간을 "HH:mm:ss" 형식으로 반환
    public String getCurrentTime() {
        LocalTime now = LocalTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        return now.format(formatter);
    }
}
