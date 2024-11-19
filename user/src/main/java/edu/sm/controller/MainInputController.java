package edu.sm.controller;

import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ReservationService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {

    final CustService custService;
    final ReservationService reservationService;
    String dir = "register/";
    String qdir = "qna/";

    // 로그인 여부 확인 공통 메소드
    private CustDto checkLogin(HttpSession session) throws Exception {
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        if (loggedInUser == null) {
            throw new Exception("로그인된 사용자가 없습니다.");
        }
        return loggedInUser;
    }

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID: " + id);
        log.info("PWD: " + pwd);

        CustDto custDto = custService.get(id);
        if (custDto == null || !custDto.getCustPwd().equals(pwd)) {
            model.addAttribute("loginError", "아이디 또는 비밀번호가 틀렸습니다.");
            return "login"; // 로그인 실패 시 다시 login 페이지로 리턴
        }
        session.setAttribute("loginid", custDto);
        return "index"; // 로그인 성공 시 메인 페이지로 리턴
    }


    // 로그아웃 처리
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    // 회원가입 처리
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto,
                               HttpSession session) throws DuplicateKeyException, Exception {
        log.info("registerimpl 까지옴");

        try {
            custService.add(custDto); // 회원가입 처리
        } catch (DuplicateKeyException e) {
            throw e;
        }

        session.setAttribute("loginid", custDto); // 회원가입 후 로그인 처리
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", "registerok");

        return "index";
    }

    // 예약 처리
    @RequestMapping("/reservationimpl")
    public String reservationimpl(Model model,
                                  @RequestParam("custName") String custName,
                                  @RequestParam("custPhone") String custPhone,
                                  @RequestParam("reservationContent") String reservationContent,
                                  @RequestParam("reservationDate") String reservationDate,
                                  HttpSession session) throws Exception {
        log.info("reservation 까지옴");

        try {
            // 날짜 형식 처리
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            java.util.Date utilDate = sdf.parse(reservationDate);
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

            // 로그인한 사용자 확인
            CustDto loggedInUser = checkLogin(session); // 로그인 상태 확인
            String custId = loggedInUser.getCustId();

            // 예약 정보 설정
            ReservationDto reservationDto = new ReservationDto();
            reservationDto.setCustName(custName);
            reservationDto.setCustPhone(custPhone);
            reservationDto.setReservationContent(reservationContent);
            reservationDto.setReservationDate(sqlDate);
            reservationDto.setCustId(custId); // 로그인된 사용자 ID 설정

            reservationService.add(reservationDto); // 예약 처리

        } catch (ParseException e) {
            throw new Exception("날짜 형식이 잘못되었습니다.", e);
        }

        model.addAttribute("reservationSuccess", true);
        model.addAttribute("top", qdir + "top");
        model.addAttribute("center", qdir + "reservation");

        return "index"; // 예약 후 index 페이지로 리턴
    }
}
