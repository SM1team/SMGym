package edu.sm.controller;

import edu.sm.app.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/payment")
public class PaymentsController {

    private final PaymentService paymentService;

    @Autowired
    public PaymentsController(PaymentService paymentService) {
        this.paymentService = paymentService;
    }

    // 당일 매출을 반환하는 API
    @GetMapping("/todays-revenue")
    public Map<String, Object> getTodaysRevenue() {
        BigDecimal todayRevenue = paymentService.getTodaysRevenue();

        // 결과를 Map으로 반환
        Map<String, Object> response = new HashMap<>();
        response.put("todayRevenue", todayRevenue);
        return response;
    }
}



