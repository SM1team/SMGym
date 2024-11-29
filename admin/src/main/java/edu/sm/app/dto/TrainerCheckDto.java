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
public class TrainerCheckDto {
    private int tcheckNo;
    private String trainerId;
    private Timestamp  tcheckStart;
    private Timestamp tcheckEnd;
}
