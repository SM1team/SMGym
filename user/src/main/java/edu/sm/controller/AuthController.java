package com.yourpackage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

    @GetMapping("/login-signup")
    public String showLoginSignupPage(Model model) {
        model.addAttribute("pageTitle", "로그인 및 회원가입");
        return "login_signup"; // JSP 파일 이름 (login_signup.jsp)
    }
}
