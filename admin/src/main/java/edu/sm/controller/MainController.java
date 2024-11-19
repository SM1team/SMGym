package edu.sm.controller;

import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.TrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainController {

    private final TrainerService trainerService;

    @Value("${app.url.server-url}")
    String serverUrl;

    @RequestMapping("/")
    public String main(Model model){
        model.addAttribute("charturl",serverUrl);
        model.addAttribute("serverurl",serverUrl);

        return "index";
    }
    @RequestMapping("/websocket")
    public String websocket(Model model ){
        model.addAttribute("serverurl",serverUrl);//얘가 중요한친구임. 여기에 127.0.0...넣으면 수시로 바꿀 수 없으니가 yml에 다로 빼놓음.

        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","websocket");
        return "index";
    }

    @RequestMapping("/chat")
    public String chat(Model model){
        model.addAttribute("serverurl",serverUrl);
        model.addAttribute("center","chat");
        return "index";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model , HttpSession httpSession){
        if(httpSession != null){
            httpSession.invalidate();
        }
        model.addAttribute("top","top");
        model.addAttribute("left","left");
        model.addAttribute("center","login");
        return "index";
    }


    @RequestMapping("/loginimpl")
    public String loginimpl(
            @RequestParam("id") String id,
            @RequestParam("pwd") String pwd,
            HttpSession Session) throws Exception {
        TrainerDto trainerDto = null;

        log.info("여기까지옴");


            trainerDto = trainerService.get(id);


        Session.setAttribute("loginid",trainerDto);
        log.info("loginid까지 됨.");

        return "redirect:/";
    }

}
