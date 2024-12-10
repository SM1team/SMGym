package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceRateDto {
    private String custId;              // 고객 ID
    private int attendanceCount;        // 출석 일수
    private int totalDaysInMonth;       // 해당 월의 총 일수
    private double attendanceRate;      // 출석률
}
