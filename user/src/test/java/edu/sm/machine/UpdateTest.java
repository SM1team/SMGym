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
    void updateMachineTest() {
        try {
            // 기존 machineNo를 사용하여 조회하고, 수정할 데이터 준비
            int machineNo = 1;  // 수정할 machine_no
            String updatedMachineName = "Updated Machine Name";
            int updatedMachineStatus = 2;  // 예: 새로운 상태

            // MachineDto 객체를 만들어 업데이트할 데이터 설정
            MachineDto machineDto = new MachineDto();
            machineDto.setMachineNo(machineNo);
            machineDto.setMachineName(updatedMachineName);
            machineDto.setMachineStatus(updatedMachineStatus);

            // 업데이트 메서드 호출
            boolean updateResult = machineService.update(machineDto);

            // 업데이트 성공 여부 확인
            assertTrue(updateResult, "Machine should be updated successfully");

            // 업데이트 후 결과 확인 (선택적)
            MachineDto updatedMachine = machineService.getByMachineNo(machineNo);
            assertNotNull(updatedMachine, "Updated machine should not be null");
            assertEquals(updatedMachineName, updatedMachine.getMachineName(), "Machine name should be updated");
            assertEquals(updatedMachineStatus, updatedMachine.getMachineStatus(), "Machine status should be updated");

        } catch (Exception e) {
            throw new RuntimeException("Update test failed", e);
        }
    }
}
