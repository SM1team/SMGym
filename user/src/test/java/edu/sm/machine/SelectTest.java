package edu.sm.machine;

import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectTest {
    @Autowired
    MachineService machineService;

    @Test
    void contextLoads() {
        try {
            machineService.get();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
