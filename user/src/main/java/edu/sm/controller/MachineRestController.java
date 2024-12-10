package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@Slf4j
public class MachineRestController {

    @Autowired
    private MachineService machineService;

    @GetMapping("/machine/status/{machineNo}")
    public boolean getMachineStatus(@PathVariable("machineNo") int machineNo) throws Exception {
        log.info("Fetching status for machineNo: {}", machineNo);
        return machineService.getMachineStatus(machineNo);
    }
}

