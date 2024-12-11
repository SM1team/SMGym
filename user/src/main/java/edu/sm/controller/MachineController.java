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
import java.util.stream.Collectors;

@Controller
@Slf4j
public class MachineController {

    @Autowired
    private MachineService machineService;

    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/floor")
    public String main(Model model) throws Exception {
        List<MachineDto> machines = machineService.get(); // 모든 기계 상태 가져오기

        // machine_no가 있는 기구들만 필터링
        List<MachineDto> machinesWithMachineNo = machines.stream()
                .filter(machine -> machine.getMachineNo() > 0) // machine_no가 0보다 큰 것들만 필터링
                .collect(Collectors.toList());

        model.addAttribute("machines", machines); // 모델에 기계 상태 추가
        model.addAttribute("top", "floor/top");
        model.addAttribute("center", "floor/center");
        return "index"; // index.jsp 반환
    }


    @PostMapping("/machine/toggle")
    public String toggleMachineStatus(Model model ,int machineNo) {
        // 상태 변경 처리
        try {
            machineService.toggleMachineStatus(machineNo);
            log.info("Machine {} status toggled successfully", machineNo);
        } catch (Exception e) {
            log.error("Error while toggling machine status", e);
        }
        model.addAttribute("top", "floor/top");
        model.addAttribute("center", "floor/center");
        return "index"; // index.jsp 반환

    }

    @GetMapping("/machine/details")
    @ResponseBody
    public MachineDto getMachineDetails(@RequestParam("machineNo") Integer machineNo) throws Exception {
        log.info("디테일 컨트롤러 들어옴");

        log.info("머신 번호:", machineNo);
        // DB에서 machineNo로 머신 정보 조회
        MachineDto machine = null;
        try {
            machine = machineService.getMachineDetails(machineNo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return machine; // JSON 형태로 자동 반환됨
    }

}