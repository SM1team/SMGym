package edu.sm.controller;

import edu.sm.app.dto.CustDto;

import edu.sm.app.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.SQLIntegrityConstraintViolationException;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {

    final CustService custService;
    final BCryptPasswordEncoder passwordEncoder;//이걸 가지고 암호화..


    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto,
                               HttpSession session) throws DuplicateKeyException,Exception{
//        회원가입을 하는동시에 사용자의 정보를 session에 담아서 동작을 시키기 위함
        log.info("Cust Info: " +custDto.toString());
        try{
            custDto.setCustPwd(passwordEncoder.encode(custDto.getCustPwd()));//Dto에서 입력된 pwd를 encode로 변환해서
            custService.add(custDto);//다시 db에 집어 넣는다.

        }catch (DuplicateKeyException e){
//            throw new Exception("ER0001");//사용자에게 ER0001라는 내용의 메세지를 보냄.
            throw e;//예외 발생하면 떤지겠다.

        }catch (Exception e){
            throw e;
        }

        session.setAttribute("loginid", custDto);
        //loginid라는 이름으로 객체를 끄집어내서 id,pwd,name등을 사용가능.
        model.addAttribute("center","registerok");

        return "index";
    }



}