package edu.sm.controller;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@Slf4j
public class MachineController {

    @Autowired
    private MachineService machineService;

    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/floor")
    public String main(Model model) throws Exception {
        List<MachineDto> machines = machineService.get(); // 모든 기계 상태 가져오기
        model.addAttribute("machines", machines);
        model.addAttribute("top", "floor/top");
        model.addAttribute("center", "floor/center");
        return "index"; // index.jsp 반환
    }

    @PostMapping("/machine/toggle")
    public String toggleMachineStatus(int machineNo) {
        // 상태 변경 처리
        try {
            machineService.toggleMachineStatus(machineNo);
            log.info("Machine {} status toggled successfully", machineNo);
        } catch (Exception e) {
            log.error("Error while toggling machine status", e);
        }

        // 상태 업데이트 후 /floor로 리다이렉트
        return "redirect:/floor";
    }

}