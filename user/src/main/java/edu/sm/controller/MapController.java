package edu.sm.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequestMapping("/map")
public class MapController {

    String dir = "map/";

    @RequestMapping("/")
    public String map(Model model) {
        model.addAttribute("top", dir + "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", dir + "center"); // 회원가입 페이지 제목 추가
        return "index";
    }
    @RequestMapping("/map1")
    public String map1(Model model) {
        model.addAttribute("top", dir + "top"); // 회원가입 페이지 제목 추가
        model.addAttribute("center", dir + "center"); // 회원가입 페이지 제목 추가
        return "index";
    }

}
