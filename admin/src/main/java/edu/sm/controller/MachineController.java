package edu.sm.controller;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@Slf4j
public class MachineController {

    @Autowired
    private MachineService machineService;

    // HTML 반환 메서드
    @GetMapping("/machine/active-count")
    public String getActiveMachineCount(Model model) {
        int activeMachineCount = machineService.getActiveMachineCount();
        model.addAttribute("activeMachineCount", activeMachineCount);
        return "statistics"; // View 파일 이름 (e.g., statistics.html)
    }

    // JSON 데이터 반환 메서드
    @GetMapping("/api/machine/active-count")
    @ResponseBody
    public int getActiveMachineCountApi() {
        return machineService.getActiveMachineCount();
    }
}


