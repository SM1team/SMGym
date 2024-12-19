package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.MachineDto;
import edu.sm.app.service.CustCheckService;
import edu.sm.app.service.MachineService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class MainController {

    @Value("${app.key.wkey}")
    String wkey;

    @Value("${app.key.wkey2}")
    String wkey2;

    @Autowired
    private MachineService machineService;
    @Autowired
    private CustCheckService custCheckService;
    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/")
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

        return "index"; // index.jsp 반환
    }

    // 로그인 페이지 엔드포인트
    @RequestMapping("/login")
    public String showLoginPage(Model model) {
        log.info("Navigating to Login Page");
        model.addAttribute("top", "login/" + "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "login/" + "center"); // 회원가입 페이지 제목 추가
        return "index"; // login.jsp의 경로
    }

    // 회원가입 페이지 엔드포인트
    @RequestMapping("/register")
    public String showSignUpPage(Model model) {
        log.info("Register Page success");
        model.addAttribute("top", "register/" + "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "register/" + "center"); // 회원가입 페이지 제목 추가
        return "index"; // signup.jsp의 경로
    }



    @RequestMapping("/webcam")
    public String webcam(Model model) {
        model.addAttribute("top", "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "webcam"); // 회원가입 페이지 제목 추가
        return "index"; // login.jsp의 경로
    }

    @RequestMapping("/webcam2")
    public String webcam2(Model model) {
        model.addAttribute("top", "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "webcam2"); // 회원가입 페이지 제목 추가
        return "index"; // login.jsp의 경로
    }

    @RequestMapping("/mycheck")
    public String mycheck(Model model) {
        model.addAttribute("top", "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", "mycheck/"+"center"); // 회원가입 페이지 제목 추가
        return "index"; // login.jsp의 경로
    }

    @GetMapping("/monthlyAttendance")
    @ResponseBody
    public List<Map<String, Object>> getMonthlyAttendance(@RequestParam("custId") String custId,HttpSession httpSession) throws Exception {
        CustDto loggedInUser = (CustDto) httpSession.getAttribute("loginid");
        if (loggedInUser == null) {
            throw new Exception("로그인된 사용자가 없습니다.");
        }
        return custCheckService.getMonthlyAttendance(custId);
    }




}
