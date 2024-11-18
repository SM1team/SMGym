package edu.sm.controller;

import edu.sm.app.dto.KakaoPayReadyResponse;
import edu.sm.app.dto.PaymentRequest;
import edu.sm.app.service.KakaoPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/payment")
public class PaymentController {

    @Autowired
    private KakaoPayService kakaoPayService;

    // 결제 준비 API
    @PostMapping("/prepare")
    @ResponseBody
    public Map<String, String> preparePayment(@RequestBody PaymentRequest paymentRequest) {
        try {
            // 카카오페이 결제 준비 요청
            KakaoPayReadyResponse kakaoPayResponse = kakaoPayService.initiatePayment(paymentRequest.getProductName(), paymentRequest.getProductPrice());

            // 응답 맵에 리다이렉트 URL 추가
            Map<String, String> response = new HashMap<>();
            response.put("next_redirect_pc_url", kakaoPayResponse.getNext_redirect_pc_url());  // 결제 페이지 URL
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            Map<String, String> errorResponse = new HashMap<>();
            errorResponse.put("error", "결제 준비 실패");
            return errorResponse;
        }
    }
}
