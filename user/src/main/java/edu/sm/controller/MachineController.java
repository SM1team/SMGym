package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.MachineService;
import jakarta.servlet.http.HttpSession;
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
//
//    // 로그인된 사용자 확인 메서드
//    private CustDto getLoggedInUser(HttpSession session, Model model) {
//        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
//        if (loggedInUser == null) {
//            model.addAttribute("error", "로그인이 필요합니다.");
//        }
//        return loggedInUser;
//    }
//
    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/floor")
    public String main(Model model) throws Exception {
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
        model.addAttribute("top", "floor/top");
        model.addAttribute("center", "floor/center");

        return "index"; // index.jsp 반환
    }


}
