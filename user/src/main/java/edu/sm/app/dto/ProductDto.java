package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private int productNo;
    private int trainerGender;
    private String trainerId;
    private String productName;
    private int productPrice;
    private String productImg;
    private int placeNo;
}