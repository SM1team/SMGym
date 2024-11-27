package edu.sm.controller;

import edu.sm.app.dto.CustDto;

import edu.sm.app.service.TrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/qr")
@Slf4j
public class QRController {

    private final TrainerService trainerService; // 출석/퇴실 처리 서비스
    @Autowired
    private HttpSession session;  // HttpSession 객체를 주입받음


    @RequestMapping("")
    public String qr(Model model) {//custcheck 화면을 보여준다.


        model.addAttribute("center", "qr/" + "center"); // 회원가입 페이지 제목 추가

        return "index";
    }

//    @GetMapping("/generateQRCode")
//    public String generateQRCode(HttpSession session, Model model) {
//        // 세션에서 로그인된 사용자 정보를 가져옵니다
//        CustDto loginUser = (CustDto) session.getAttribute("loginid");
//
//        if (loginUser == null) {
//            return "redirect:/login"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
//        }
//
//        // 로그인된 사용자의 custId를 가져옵니다
//        String custId = loginUser.getCustId();
//
//        // QR 코드 생성
//        String qrCodeBase64 = trainerService.generateQRCode(custId);
//
//        // 생성된 QR 코드를 모델에 전달
//        model.addAttribute("qrCodeImage", qrCodeBase64);
//
//        // top과 center 영역에 대한 설정
//        model.addAttribute("top", "qr/" + "top");
//        model.addAttribute("center", "qr/" + "custcheck");
//
//        // QR 코드를 표시할 index.jsp로 이동
//        return "index"; // index.jsp에서 top과 center를 활용하여 출력
//    }

}