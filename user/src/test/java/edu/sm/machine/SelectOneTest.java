package edu.sm.machine;

import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOneTest {
    @Autowired
    MachineService machineService;

    @Test
    void contextLoads() {
        try {
            machineService.getMachineStatus(4);
            machineService.toggleMachineStatus(4);
            machineService.getMachineStatus(4);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
