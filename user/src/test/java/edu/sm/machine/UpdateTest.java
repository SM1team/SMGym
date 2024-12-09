package edu.sm.machine;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
@Slf4j
class UpdateTest {

    @Autowired
    private MachineService machineService;

    @Test
    void toggleMachineStatusOnceTest() {
        try {
            // 기존 machineNo를 사용하여 수정할 데이터 준비
            int machineNo = 23;  // 수정할 machine_no

            // 현재 상태 조회
            MachineDto currentMachine = machineService.get(machineNo);
            assertNotNull(currentMachine, "Machine should not be null");
            boolean currentMachineStatus = currentMachine.getMachineStatus(); // 현재 상태 (boolean 값)
            log.info("Current status of machine {}: {}", machineNo, currentMachineStatus);

            // 상태를 반대로 변경
            boolean updatedMachineStatus = !currentMachineStatus; // 현재 상태 반전

            // Machine 상태 변경 (changeStatus 사용)
            machineService.changeStatus(machineNo, updatedMachineStatus); // 상태 변경
            log.info("Updated status of machine {} to: {}", machineNo, updatedMachineStatus);

            // 상태 변경 후 결과 확인
            MachineDto updatedMachine = machineService.get(machineNo);
            assertNotNull(updatedMachine, "Updated machine should not be null");
            assertEquals(updatedMachineStatus, updatedMachine.getMachineStatus(), "Machine status should be toggled correctly");

        } catch (Exception e) {
            throw new RuntimeException("Update test failed", e);
        }
    }
}
