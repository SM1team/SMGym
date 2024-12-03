package edu.sm.controller;

import edu.sm.app.service.MachineService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {

    @Value("${app.key.wkey}")
    String wkey;

    @Value("${app.key.wkey2}")
    String wkey2;

    @Autowired
    private MachineService machineService;  // MachineService 의존성 주입

    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/")
    public String main(Model model) throws Exception {
        log.info("Start Main Page");

        model.addAttribute("machines", machineService.get());  // 기계 목록을 서비스 섹션에 전달

        return "index"; // index.jsp를 반환
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




}
