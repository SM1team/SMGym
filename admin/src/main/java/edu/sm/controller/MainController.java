package edu.sm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/")
    public String main(Model model) {
        return "index";
    }

    @RequestMapping("/websocket")
    public String websocket(Model model) {
        return "index";
    }

    @RequestMapping("/chat")
    public String chat(Model model) {
        return "index";
    }

//    @RequestMapping("/logout")
//    public String logout(HttpSession httpSession) {
//        return "index";
//    }
//
//    @RequestMapping("/loginimpl")
//    public String loginimpl(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession httpSession) {
//        return "redirect:/";
//    }
}
