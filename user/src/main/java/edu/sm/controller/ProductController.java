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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
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

        model.addAttribute("product", productDto);
        model.addAttribute("trainerList", trainerList);

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



    @GetMapping("/confirmation")
    public String showConfirmationPage(
            @RequestParam("orderNo") String orderNo,
            @RequestParam("productName") String productName,
            @RequestParam("productAmount") String productAmount,
            @RequestParam("buyerName") String buyerName,
            @RequestParam("buyerPhone") String buyerPhone,
            @RequestParam("buyerGender") String buyerGender,
            @RequestParam("buyerAge") String buyerAge,
            @RequestParam("buyerAddr") String buyerAddr,
            HttpSession session, Model model) {

        log.info("orderNo: {}", orderNo);
        log.info("productName: {}", productName);

        // OrdersDto 생성 및 데이터 설정
        OrdersDto ordersDto = new OrdersDto();
        ordersDto.setOrderNo(Integer.parseInt(orderNo));
        ordersDto.setProductName(productName);
        ordersDto.setProductPrice(new BigDecimal(productAmount.replace("₩", "").replace(",", "")));
        ordersDto.setCustId(((CustDto) session.getAttribute("loginid")).getCustId());
        ordersDto.setOrderDate(new Date());  // 현재 시간으로 주문 날짜 설정

        // 트레이너 정보가 필요하면 추가
        ordersDto.setTrainerId("1");  // 예시로 "1"로 설정
        ordersDto.setTrainerName("Trainer Name");  // 예시 트레이너 이름

        // 결제 정보 세션에 저장
        session.setAttribute("orderNo", orderNo);
        session.setAttribute("productName", productName);
        session.setAttribute("productAmount", productAmount);
        session.setAttribute("buyerName", buyerName);
        session.setAttribute("buyerPhone", buyerPhone);
        session.setAttribute("buyerGender", buyerGender);
        session.setAttribute("buyerAge", buyerAge);
        session.setAttribute("buyerAddr", buyerAddr);

        // DB에 저장 (서비스 사용)
        // 예시로 ordersService.save(ordersDto); 호출 가능 (서비스 메서드 추가 필요)

        model.addAttribute("order", ordersDto);  // 모델에 주문 정보 추가

        return "confirmation"; // confirmation.jsp 페이지로 포워딩
    }

}



