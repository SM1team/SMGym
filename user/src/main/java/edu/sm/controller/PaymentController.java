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
            @RequestParam Integer productNo,
            @RequestParam BigDecimal productPrice,
            @RequestParam String customerId,
            Model model
    ) throws Exception {
        PaymentDto paymentDto = new PaymentDto();
        paymentDto.setPaymentId(paymentId);
        paymentDto.setProductNo(productNo);
        paymentDto.setAmount(productPrice);
        paymentDto.setCustomerId(customerId);
        paymentDto.setPaymentStatus("SUCCESS");

        paymentService.add(paymentDto);

        model.addAttribute("payment", paymentDto);
        return "redirect:/pay/complete?imp_uid=" + paymentId;
    }

    @GetMapping("/complete")
    public String showPaymentCompletePage(
            @RequestParam String payment_id,
            Model model
    ) throws Exception {
        List<PaymentDto> list = paymentService.getPaymentByPaymentId(payment_id);
        model.addAttribute("payment", list);
        return "payment-success";
    }
}
