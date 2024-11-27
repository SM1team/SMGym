package edu.sm.app.dto;

import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
public class PaymentDto {
    private String paymentId;     // 결제 ID
    private Integer productNo;    // 상품 번호
    private String customerId;   // 고객 ID
    private BigDecimal amount;    // 결제 금액
    private String paymentStatus; // 결제 상태
    private LocalDateTime createdAt; // 생성 시간
}
