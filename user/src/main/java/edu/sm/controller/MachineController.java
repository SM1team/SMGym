package edu.sm.controller;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@Slf4j
public class MachineController {

    @Autowired
    private MachineService machineService;  // MachineService 의존성 주입

    /**
     * 머신 리스트 페이지 엔드포인트
     */
    @RequestMapping("/machines")
    public String showMachineList(Model model) throws Exception {
        log.info("Navigating to Machine List Page");
        // 모든 머신 데이터를 가져와서 model에 추가
        model.addAttribute("machines", machineService.get());
        return "index"; // machineList.jsp 반환
    }

    /**
     * 머신 상태 변경 엔드포인트
     */
    @RequestMapping(value = "/machine/status/{machineNo}", method = RequestMethod.POST)
    public String toggleMachineStatus(Model model, @PathVariable Integer machineNo) {
        log.info("Toggling status for machineNo: {}", machineNo);
        try {
            // 머신 상태 변경
            machineService.toggleMachineStatus(machineNo);
            model.addAttribute("message", "Machine status toggled successfully.");
        } catch (Exception e) {
            log.error("Error while toggling machine status", e);
            model.addAttribute("message", "Error toggling machine status.");
        }
        // 상태 변경 후 머신 리스트로 리다이렉트
        return "redirect:/machines";
    }
    /**
     * 머신 상세 페이지 엔드포인트
     * 특정 machineNo에 해당하는 머신 상세 정보 조회
     */
    @GetMapping("/machine/{machineNo}")
    public String showMachineDetails(@PathVariable Integer machineNo, Model model) {
        log.info("Fetching details for machineNo: {}", machineNo);
        try {
            // machineNo에 해당하는 머신 데이터 가져오기
            MachineDto machine = machineService.get(machineNo);
            model.addAttribute("machine", machine); // 모델에 머신 데이터 추가
            return "index"; // 머신 상세 정보를 처리할 때는 페이지 이동 없이 상태만 업데이트
        } catch (Exception e) {
            log.error("Error while fetching machine details", e);
            model.addAttribute("message", "Error fetching machine details.");
            return "error"; // 오류 페이지
        }
    }
}
