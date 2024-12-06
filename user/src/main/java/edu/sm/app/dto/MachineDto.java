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
public class MachineDto {
    private int machineNo;               // machine_no (PK, AI)
    private String machineName;          // machine_name (varchar(40))
    private Timestamp machineTime;       // machine_time (datetime)
    private boolean machineStatus;       // machine_status (tinyint -> true/false)


    // Getter for machineStatus
    public boolean getMachineStatus() {
        return machineStatus;
    }

    public boolean isMachineStatus() {
        return machineStatus;
    }


}
