package edu.sm.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
@RequestMapping("/pay")
public class PaymentController {

    private final IamportClient iamportClient;


    public PaymentController() {
        this.iamportClient = new IamportClient("6178544642102448",
                "CyhPLOBsAMQCguuhiUjYuD3d1ABO85mVM9t3Fq67JTlKIKcgeInMqh9MqnWWYHHjrRD60Vle4UALHzSn");
    }

    /**
     * 결제 검증 엔드포인트
     */
    @ResponseBody
    @GetMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }


}
