package edu.sm.controller;

public class MachineStatusRequest {
    private int machineNo;      // 머신 번호
    private boolean machineStatus;  // 머신 상태 (true: 켜짐, false: 꺼짐)

    // Getter 및 Setter
    public int getMachineNo() {
        return machineNo;
    }

    public void setMachineNo(int machineNo) {
        this.machineNo = machineNo;
    }

    public boolean isMachineStatus() {
        return machineStatus;
    }

    public void setMachineStatus(boolean machineStatus) {
        this.machineStatus = machineStatus;
    }
}
