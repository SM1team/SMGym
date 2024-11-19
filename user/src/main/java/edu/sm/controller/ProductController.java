package edu.sm.controller;


import edu.sm.app.dto.ProductDto;
import edu.sm.app.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    private final ProductService productService;
    String dir = "shop/";

    @RequestMapping("")
    public String shop(Model model) throws Exception {
        List<ProductDto> list = productService.get();

        model.addAttribute("productlist", list);
        model.addAttribute("top", dir + "top"); // 상단 템플릿이 shop/top.jsp로 설정되어 있어야 합니다.
        model.addAttribute("center", dir + "center"); // 중앙 템플릿이 shop/center.jsp로 설정되어 있어야 합니다.

        return "index"; // index.jsp 파일이 올바른 위치에 있는지 확인하세요.
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("productNo") int productNo) throws Exception {
        ProductDto productDto = productService.get(productNo);
        model.addAttribute("product", productDto);
        model.addAttribute("top", dir + "top"); // 상단 템플릿이 shop/top.jsp로 설정되어 있어야 합니다.
        model.addAttribute("center", dir + "detail"); // 중앙 템플릿 경로
        return "index";
    }






}
