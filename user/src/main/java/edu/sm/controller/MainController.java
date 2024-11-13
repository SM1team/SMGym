package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {

    String dir = "register/";

    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/")
    public String main(Model model) {
        log.info("Start Main Page");
        return "index"; // index.jsp를 반환
    }

    // 로그인 페이지 엔드포인트
    @RequestMapping("/login")
    public String showLoginPage(Model model) {
        log.info("Navigating to Login Page");
        model.addAttribute("pageTitle", "Login"); // 로그인 페이지 제목 추가
        return "index"; // 로그인 페이지를 반환하기 위해 index.jsp를 사용
    }

    // 회원가입 페이지 엔드포인트
    @RequestMapping("/register")
    public String showSignUpPage(Model model) {
        log.info("Navigating to Register Page");
        model.addAttribute("top", dir + "top"); // 회원가입 상단 추가
        model.addAttribute("center", dir + "center"); // 회원가입 내용 추가
        return "index"; // index.jsp를 반환하여 회원가입 페이지를 표시
    }

    // 특정 위치로 이동하기 위한 엔드포인트
    @RequestMapping("/#location")
    public String navigateToLocation(Model model) {
        log.info("Navigating to location section");
        model.addAttribute("top", dir + "top"); // 회원가입 상단 추가
        model.addAttribute("center", dir + "center"); // 회원가입 내용 추가
        return "index"; // 페이지 내 특정 위치로 스크롤 이동을 위해 index.jsp 반환
    }
}
