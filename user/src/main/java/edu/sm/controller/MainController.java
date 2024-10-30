package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class MainController {

    // 메인 페이지의 기본 엔드포인트
    @RequestMapping("/")
    public String main(Model model) {
        log.info("Start Main Page");
        return "index"; // index.jsp를 반환
    }

    // 서비스 섹션으로 이동
    @RequestMapping("/services")
    public String services(Model model) {
        log.info("Navigating to Services Section");
        return "index"; // 또는 'services'라는 별도의 JSP 페이지가 있다면 해당 페이지를 반환
    }

    // 포트폴리오 섹션으로 이동
    @RequestMapping("/portfolio")
    public String portfolio(Model model) {
        log.info("Navigating to Portfolio Section");
        return "index"; // 또는 'portfolio' JSP 페이지
    }

    // 어바웃 섹션으로 이동
    @RequestMapping("/about")
    public String about(Model model) {
        log.info("Navigating to About Section");
        return "index"; // 또는 'about' JSP 페이지
    }

    // 팀 섹션으로 이동
    @RequestMapping("/team")
    public String team(Model model) {
        log.info("Navigating to Team Section");
        return "index"; // 또는 'team' JSP 페이지
    }

    // 연락처 섹션으로 이동
    @RequestMapping("/contact")
    public String contact(Model model) {
        log.info("Navigating to Contact Section");
        return "index"; // 또는 'contact' JSP 페이지
    }
}
