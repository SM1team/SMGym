package edu.sm.controller;


import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ProductService;
import edu.sm.app.service.TrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/trainer")
@RequiredArgsConstructor
@Slf4j
public class TrainerController {

    private final ProductService productService;
    private final TrainerService trainerService;
    private final CustService custService;  // 고객 서비스 추가 (필요한 경우)
    String dir = "trainer/";

    @RequestMapping("profile1")
    public String profile1(Model model) throws Exception {
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "profile1");

        return "index";
    }

    @RequestMapping("profile2")
    public String profile2(Model model) throws Exception {
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "profile2");

        return "index";
    }

    @RequestMapping("profile3")
    public String profile3(Model model) throws Exception {
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "profile3");

        return "index";
    }

}



