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
public class MachineDto {
    private int machineNo;
    private String machineName;
    private int machineSeat;
    private Date machineTime;
    private int machineCount;
    private int placeNo;
}