package edu.sm.app.repository;

import edu.sm.app.dto.PaymentDto;
import edu.sm.app.dto.ProductDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper

public interface PaymentRepository extends SMRepository<String, PaymentDto> {
    List<PaymentDto> getPaymentByCustId(String CustId);
}

