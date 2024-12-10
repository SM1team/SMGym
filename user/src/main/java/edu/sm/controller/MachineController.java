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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

        model.addAttribute("machines", machinesWithMachineNo); // 모델에 기계 상태 추가
        model.addAttribute("top", "floor/top");
        model.addAttribute("center", "floor/center");
        return "index"; // index.jsp 반환
    }

    // 기계 상태 토글 처리 (활성화 / 비활성화)
    @PostMapping("/machine/toggle")
    public String toggleMachineStatus(@RequestParam("machineNo") int machineNo) {
        // 상태 변경 처리
        try {
            machineService.toggleMachineStatus(machineNo); // 기계 상태 변경
            log.info("Machine {} status toggled successfully", machineNo);
        } catch (Exception e) {
            log.error("Error while toggling machine status", e);
        }

        // 상태 업데이트 후 /floor로 리다이렉트
        return "redirect:/floor";
    }

    // 기계 세부 정보 가져오기 (JSON 형태로 반환)
    @GetMapping("/machine/details")
    @ResponseBody
    public MachineDto getMachineDetails(@RequestParam("machineNo") Integer machineNo) throws Exception {
        // DB에서 machineNo로 머신 정보 조회
        MachineDto machine = null;
        try {
            machine = machineService.getMachineDetails(machineNo); // 기계 세부 정보 조회
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return machine; // JSON 형태로 자동 반환됨
    }

    @GetMapping("/machine/status")
    @ResponseBody
    public Map<String, Boolean> getMachineStatus(@RequestParam("machineNo") int machineNo) throws Exception {
        // DB에서 해당 기계의 상태를 가져오는 로직
        boolean currentStatus = false;
        try {
            currentStatus = machineService.getMachineStatus(machineNo);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        // 상태 반환
        Map<String, Boolean> response = new HashMap<>();
        response.put("status", currentStatus);  // 상태값 'true' 또는 'false'
        return response;
    }
}