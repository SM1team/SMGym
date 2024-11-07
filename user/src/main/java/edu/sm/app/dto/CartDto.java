package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CartDto {
    private int cartNo;
    private String custId;
    private int productNo;
    private int cartPrice;
    private int cartAmount;
    private String productName;
}