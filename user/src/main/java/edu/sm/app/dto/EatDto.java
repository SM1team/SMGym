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
public class EatDto {
    private int eatNo;
    private String eatName;
    private double eatCalorie;
    private double eatWeight;
    private Date eatDate;
    private String custId;
}