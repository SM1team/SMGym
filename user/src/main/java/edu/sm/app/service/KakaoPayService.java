package edu.sm.app.service;

import edu.sm.app.dto.KakaoPayReadyResponse;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class KakaoPayService {

    private static final String ADMIN_KEY = "DEV460BDE86A901EBECAACA5029B327D0D862B46"; // 실제 키로 교체
    private static final String KAKAO_PAY_READY_URL = "https://kapi.kakao.com/v1/payment/ready";  // 결제 준비 URL

    public KakaoPayReadyResponse initiatePayment(String productName, int totalAmount) {
        // 요청 파라미터 설정
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("cid", "TC0ONETIME"); // 테스트용 CID
        params.add("partner_order_id", "1001");  // 주문 ID
        params.add("partner_user_id", "user123");  // 사용자 ID
        params.add("item_name", productName);  // 상품 이름
        params.add("quantity", "1");  // 수량
        params.add("total_amount", String.valueOf(totalAmount));  // 총 금액
        params.add("vat_amount", "1000");  // 부가세
        params.add("tax_free_amount", "0");  // 면세 금액
        params.add("approval_url", "http://localhost:85/payment/success");  // 결제 승인 URL
        params.add("cancel_url", "http://localhost:85/payment/cancel");  // 결제 취소 URL
        params.add("fail_url", "http://localhost:85/payment/fail");  // 결제 실패 URL

        // HTTP 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "KakaoAK " + ADMIN_KEY);  // 관리자의 키 사용
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

        // HTTP 요청 생성
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

        // RestTemplate을 이용한 API 호출
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<KakaoPayReadyResponse> response;

        System.out.println("결제 요청 데이터: " + request.getBody());

        try {
            response = restTemplate.postForEntity(KAKAO_PAY_READY_URL, request, KakaoPayReadyResponse.class);
        } catch (Exception e) {
            throw new RuntimeException("카카오페이 결제 준비 중 오류 발생: " + e.getMessage(), e);
        }

        // 응답 상태 확인
        if (response.getStatusCode() != HttpStatus.OK) {
            throw new RuntimeException("카카오페이 결제 준비 실패: " + response.getStatusCode());
        }

        // 응답 반환
        KakaoPayReadyResponse responseBody = response.getBody();
        if (responseBody == null) {
            throw new RuntimeException("카카오페이 결제 준비 응답 데이터가 비어 있습니다.");
        }

        return responseBody;
    }

}
