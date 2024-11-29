package edu.sm.app.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.Date;

@Data
public class OrdersDto {
    private int orderNo;          // 주문 번호
    private int productNo;        // 상품 번호
    private String productName;   // 상품 이름
    private String trainerId;     // 트레이너 ID
    private String trainerName;   // 트레이너 이름
    private String trainerGender; // 트레이너 성별
    private BigDecimal productPrice;  // 상품 가격
    private Date orderDate;       // 주문 날짜
    private String custId;        // 고객 ID
}
