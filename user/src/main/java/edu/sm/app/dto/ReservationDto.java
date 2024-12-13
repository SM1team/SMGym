package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDto {
    private int reservationNo;
    private String custName;
    private String custPhone;
    private String reservationContent;
    private Timestamp reservationDate;
    private String reservationState;
    private String custId;
}