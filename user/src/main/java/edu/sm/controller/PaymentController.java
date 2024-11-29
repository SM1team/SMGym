package edu.sm.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import edu.sm.app.dto.PaymentDto;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.service.PaymentService;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@Controller
@RequestMapping("/pay")
@RequiredArgsConstructor
@Slf4j
public class PaymentController {

    private IamportClient iamportClient;  // final로 선언
    private final PaymentService paymentService;  // 의존성 주입

    @Value("${iamport.apiKey}")
    private String apiKey;

    @Value("${iamport.apiSecret}")
    private String apiSecret;

    // IamportClient 초기화
    @PostConstruct
    public void initIamportClient() {
        this.iamportClient = new IamportClient(apiKey, apiSecret);
    }

    @ResponseBody
    @GetMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }

    @PostMapping("/complete")
    public String savePayment(
            @RequestParam String paymentId,
            @RequestParam String productName,
            @RequestParam BigDecimal productPrice,
            @RequestParam String custId,
            Model model
    ) throws Exception {
        PaymentDto paymentDto = new PaymentDto();
        paymentDto.setPaymentId(paymentId);
        paymentDto.setProductName(productName);
        paymentDto.setAmount(productPrice);
        paymentDto.setCustId(custId);
        paymentDto.setPaymentStatus("SUCCESS");

        paymentService.add(paymentDto); // DB에 저장

        model.addAttribute("payment", paymentDto);
        model.addAttribute("top", "pay/" + "top");

        return "redirect:/pay/complete?imp_uid=" + paymentId; // 이 부분 변경 필요
    }


    @GetMapping("/complete")
    public String showPaymentCompletePage(
            @RequestParam String payment_id,  // GET 요청으로 payment_id와 imp_uid를 받음
            @RequestParam String imp_uid,
            Model model) throws Exception {

        log.info("결제 완료 페이지 요청 - payment_id: {}, imp_uid: {}", payment_id, imp_uid);

        // 결제 정보 조회
        PaymentDto paymentDto = paymentService.get(payment_id);
        if (paymentDto == null) {
            // 결제 정보가 없으면 에러 페이지로 리다이렉트
            log.error("결제 정보가 없습니다. payment_id: {}, imp_uid: {}", payment_id, imp_uid);
            return "error";  // 결제 정보가 없을 경우 에러 처리 페이지로 리디렉션
        }

        // 결제 정보를 모델에 추가
        model.addAttribute("payment", paymentDto);

        // JSP 페이지 레이아웃 분리
        model.addAttribute("top", "pay/" + "top");  // 상단 레이아웃
        model.addAttribute("center", "pay/" + "payment-success");  // 결제 완료 페이지의 내용 부분

        // 결제 완료 페이지로 리턴
        return "index";  // "index.jsp"에서 "top"과 "center" 레이아웃을 포함하여 렌더링
    }

}
