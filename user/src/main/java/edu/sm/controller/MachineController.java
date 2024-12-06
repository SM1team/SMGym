package edu.sm.controller;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;

@Controller
@Slf4j
public class MachineController {

    @Autowired
    private MachineService machineService;

    @RequestMapping("/floor")
    public String showFloor(Model model) throws Exception {

        List<MachineDto> machines = machineService.get(); // 모든 기계 상태 가져오기 (MachineDto 객체 리스트)
        // machines 리스트를 콘솔에 출력
        for (MachineDto machine : machines) {
            // MachineDto 객체의 필드 출력
            System.out.println("Machine No: " + machine.getMachineNo() +
                    ", Name: " + machine.getMachineName() +
                    ", Time: " + machine.getMachineTime() +
                    ", Status: " + (machine.isMachineStatus() ? "On" : "Off"));
        }

        // 기계 상태를 모델에 추가
        model.addAttribute("machines", machines);
        model.addAttribute("top",  "floor/" + "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "floor/" + "center"); // 회원가입 페이지 제목 추가
        return "index"; // index.jsp 반환
    }





}
