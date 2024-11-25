package edu.sm.controller;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import edu.sm.app.dto.ProductDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
public class PaymentController {

    private final IamportClient iamportClient;

    public PaymentController() {
        this.iamportClient = new IamportClient("6178544642102448",
                "CyhPLOBsAMQCguuhiUjYuD3d1ABO85mVM9t3Fq67JTlKIKcgeInMqh9MqnWWYHHjrRD60Vle4UALHzSn");
    }

    @ResponseBody
    @RequestMapping("/verify/{imp_uid}")
    public IamportResponse<Payment> paymentByImpUid(@PathVariable("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
        return iamportClient.paymentByImpUid(imp_uid);
    }


}