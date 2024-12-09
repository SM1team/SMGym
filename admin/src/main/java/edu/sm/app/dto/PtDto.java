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
public class PtDto {
    private int ptNo;
    private int productNo;
    private String trainerId;
    private String ptContent;
    private Date ptDate;
    private int ptCount;
    private String custId;
}