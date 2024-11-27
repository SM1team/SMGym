package edu.sm.app.service;

import edu.sm.app.dto.PaymentDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.PaymentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PaymentService implements SMService<String, PaymentDto> {

    final PaymentRepository paymentRepository;

    @Override
    public void add(PaymentDto paymentDto) throws Exception {
        paymentRepository.insert(paymentDto);
    }

    @Override
    public void modify(PaymentDto paymentDto) throws Exception {
        paymentRepository.update(paymentDto);
    }

    @Override
    public void del(String s) throws Exception {
        paymentRepository.delete(s);
    }

    @Override
    public PaymentDto get(String s) throws Exception {
        return paymentRepository.selectOne(s);
    }

    @Override
    public List<PaymentDto> get() throws Exception {
        return paymentRepository.select();
    }

    public List<PaymentDto> getPaymentByCustId(String CustId) {
        return paymentRepository.getPaymentByCustId(CustId);
    }
}
