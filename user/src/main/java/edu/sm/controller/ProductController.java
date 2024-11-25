package edu.sm.controller;


import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.service.CustService;
import edu.sm.app.service.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
@Slf4j
public class ProductController {


    private final ProductService productService;
    private final CustService custService;
    String dir = "shop/";

    @RequestMapping("")
    public String shop(Model model) throws Exception {
        List<ProductDto> list = productService.get();

        model.addAttribute("productlist", list);
        model.addAttribute("top", dir + "top"); // 상단 템플릿이 shop/top.jsp로 설정되어 있어야 합니다.
        model.addAttribute("center", dir + "center"); // 중앙 템플릿이 shop/center.jsp로 설정되어 있어야 합니다.

        return "index"; // index.jsp 파일이 올바른 위치에 있는지 확인하세요.
    }


    // 컨트롤러에서 로그인된 사용자 정보 조회
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("productNo") int productNo,HttpSession session) throws Exception {
        ProductDto productDto = productService.get(productNo);
        model.addAttribute("product", productDto);
        CustDto custDto = (CustDto) session.getAttribute("loginid");
        if (custDto != null) {
            model.addAttribute("cust", custDto);
            // 로그인된 사용자 정보를 모델에 추가
            // 고객 정보 로그 출력
            log.info("로그인된 고객 정보: ");
            log.info("회원 ID: {}", custDto.getCustId());
            log.info("회원 이름: {}", custDto.getCustName());
            log.info("회원 나이: {}", custDto.getCustAge());
            log.info("회원 전화번호: {}", custDto.getCustPhone());
            log.info("회원 성별: {}", custDto.getCustGender());
            log.info("회원 거주지: {}", custDto.getCustAddress());
        } else {
            log.info("로그인된 고객 정보가 없습니다.");

        }

        model.addAttribute("top", dir + "top"); // 상단 템플릿이 shop/top.jsp로 설정되어 있어야 합니다.
        model.addAttribute("center", dir + "detail"); // 중앙 템플릿 경로
        return "index";

    }
}
