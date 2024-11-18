package edu.sm.controller;

import edu.sm.app.dto.KakaoPayReadyResponse;
import edu.sm.app.dto.PaymentRequest;
import edu.sm.app.service.KakaoPayService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/payment")
public class KakaoPayController {

    private final KakaoPayService kakaoPayService;

    public KakaoPayController(KakaoPayService kakaoPayService) {
        this.kakaoPayService = kakaoPayService;
    }

    @PostMapping("/payment/prepare")
    @ResponseBody
    public Map<String, String> preparePayment(@RequestBody PaymentRequest paymentRequest) {
        try {
            // 결제 준비 요청을 카카오페이 서비스로 보내고 응답 받기
            KakaoPayReadyResponse kakaoPayResponse = kakaoPayService.initiatePayment(paymentRequest.getProductName(), paymentRequest.getProductPrice());

            // 카카오페이 응답에서 결제 페이지 URL을 반환
            Map<String, String> response = new HashMap<>();
            response.put("next_redirect_pc_url", kakaoPayResponse.getNext_redirect_pc_url());
            return response;
        } catch (Exception e) {
            e.printStackTrace();
            return new HashMap<>();
        }
    }

    @GetMapping("/success")
    public String paymentSuccess(@RequestParam String pg_token) {
        // pg_token을 사용하여 카카오 결제 승인 요청 처리
        return "결제가 성공적으로 완료되었습니다!";
    }

    @GetMapping("/cancel")
    public String paymentCancel() {
        return "결제가 취소되었습니다.";
    }

    @GetMapping("/fail")
    public String paymentFail() {
        return "결제가 실패하였습니다.";
    }

}
