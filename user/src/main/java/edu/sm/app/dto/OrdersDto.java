package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrdersDto {
    private int orderNo;
    private String custId;
    private int productNo;
    private int orderPrice;
    private Date orderDate;
}