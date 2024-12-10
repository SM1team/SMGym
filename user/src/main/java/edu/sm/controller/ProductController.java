package edu.sm.controller;


import edu.sm.app.dto.*;
import edu.sm.app.service.CustService;

import edu.sm.app.service.ProductService;
import edu.sm.app.service.TrainerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    private final ProductService productService;
    private final TrainerService trainerService;
    private final CustService custService;  // 고객 서비스 추가 (필요한 경우)
    String dir = "shop/";

    @RequestMapping("")
    public String shop(Model model) throws Exception {
        List<ProductDto> list = productService.get();

        model.addAttribute("productlist", list);
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "center");

        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("productNo") int productNo, HttpSession session) throws Exception {
        ProductDto productDto = productService.get(productNo);
        List<TrainerDto> trainerList = trainerService.get();
        List<ProductDto> relatedProducts = productService.get();
        model.addAttribute("product", productDto);
        model.addAttribute("trainerList", trainerList);
        model.addAttribute("relatedProducts", relatedProducts);

        CustDto custDto = (CustDto) session.getAttribute("loginid");
        if (custDto != null) {
            model.addAttribute("cust", custDto);
            log.info("로그인된 고객 정보: {}", custDto);
        } else {
            log.info("로그인된 고객 정보가 없습니다.");
        }

        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "detail");
        return "index";
    }





}



