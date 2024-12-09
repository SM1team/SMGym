package edu.sm.app.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class PaymentDto {
    private String paymentId;     // 결제 ID
    private String productName;
    private String custId;  // 변경
    private BigDecimal amount;    // 결제 금액
    private String paymentStatus; // 결제 상태
    private LocalDateTime createdAt; // 생성 시간
    private String trainerId; //트레이너 아이디
}
