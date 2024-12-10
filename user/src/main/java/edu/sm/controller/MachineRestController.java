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

//    // POST 요청에서 JSON 데이터를 받도록 수정
//    @PostMapping("/machine/toggle/{machineNo}")
//    public ResponseEntity<Boolean> toggleMachineStatus(@PathVariable int machineNo, @RequestBody MachineDto machineDto) {
//        try {
//            log.info("Received MachineDto: {}", machineDto);  // JSON 내용 로그로 출력
//            boolean newStatus = machineService.toggleMachineStatus(machineNo);
//            return ResponseEntity.ok(newStatus);  // boolean 값을 그대로 반환
//        } catch (Exception e) {
//            log.error("Error occurred while toggling machine status: ", e);
//            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
//        }
//    }

//
}

