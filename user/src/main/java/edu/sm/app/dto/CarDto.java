package edu.sm.app.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CarDto {
    private Integer carId;         // 차량 ID
    private String carName;      // 모델 이름
    private String carColor;   // 제조사
    private LocalDateTime carDate;      // 발행년도 (DATETIME)
    private String carPrice;          // 가격
    private String carFuel;       // 연료 종류

}
