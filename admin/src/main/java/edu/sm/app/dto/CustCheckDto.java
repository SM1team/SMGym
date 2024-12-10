package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustCheckDto {
    private int checkNo;
    private String custId;
    private Timestamp  checkStart;
    private Timestamp checkEnd;
}
