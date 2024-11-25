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


    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID:" + id);
        log.info("PWD:" + pwd);

        CustDto custDto = custService.get(id);
        session.setAttribute("loginid", custDto);
        return "index";
    }
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

        @RequestMapping("/registerimpl")
        public String registerimpl (Model model,
                CustDto custDto,
                HttpSession session) throws DuplicateKeyException, Exception {
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함
            log.info("registerimpl 까지옴");
            try {
//            custDto.setCustPwd(passwordEncoder.encode(custDto.getCustPwd()));//Dto에서 입력된 pwd를 encode로 변환해서
                custService.add(custDto);//다시 db에 집어 넣는다.

            } catch (DuplicateKeyException e) {
//            throw new Exception("ER0001");//사용자에게 ER0001라는 내용의 메세지를 보냄.
                throw e;//예외 발생하면 떤지겠다.

            } catch (Exception e) {
                throw e;
            }

            session.setAttribute("loginid", custDto);
            //loginid라는 이름으로 객체를 끄집어내서 id,pwd,name등을 사용가능.
            model.addAttribute("top", dir + "top");
            model.addAttribute("center", "registerok");

            return "index";
        }

    @RequestMapping("/reservationimpl")
    public String reservationimpl(Model model,
                                  CustDto custDto,
                                  @RequestParam("custName") String custName,
                                  @RequestParam("custPhone") String custPhone,
                                  @RequestParam("reservationContent") String reservationContent,
                                  @RequestParam("reservationDate") String reservationDate,
                                  HttpSession session) throws Exception {
        log.info("reservation 까지옴");

        try {
            // 날짜와 시간을 결합하여 Date 객체로 변환
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"); // ISO 8601 형식
            java.util.Date utilDate = sdf.parse(reservationDate); // reservationDate를 java.util.Date로 변환

            // java.util.Date를 java.sql.Date로 변환
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime()); // getTime()을 사용하여 변환

            // session에서 로그인된 사용자 정보 가져오기
            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
            if (loggedInUser == null) {
                throw new Exception("로그인된 사용자가 없습니다.");
            }

            String custId = loggedInUser.getCustId(); // CustDto에서 사용자 ID를 가져옴

            // ReservationDto 객체 생성
            ReservationDto reservationDto = new ReservationDto();
            reservationDto.setCustName(custName);
            reservationDto.setCustPhone(custPhone);
            reservationDto.setReservationContent(reservationContent);
            reservationDto.setReservationDate(sqlDate); // 변환된 java.sql.Date를 설정
            reservationDto.setCustId(custId); // 로그인된 사용자 ID 설정

            // DB에 예약 추가
            reservationService.add(reservationDto);

        } catch (ParseException e) {
            throw new Exception("날짜 형식이 잘못되었습니다.", e);
        }

        model.addAttribute("reservationSuccess", true);

        model.addAttribute("top", qdir + "top");
        model.addAttribute("center", qdir + "reservation");

        return "index"; // 예약 후 index 페이지로 리턴
    }





}