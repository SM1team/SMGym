package edu.sm.app.service;

import edu.sm.app.repository.PaymentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class PaymentService {
    private final PaymentRepository paymentRepository;

    public Map<String, Double> getMonthlySales() {
        List<Map<String, Object>> results = paymentRepository.getMonthlySales();
        Map<String, Double> monthlySales = new HashMap<>();

        for (Map<String, Object> result : results) {
            String month = (String) result.get("month");
            Double totalSales = ((Number) result.get("total_sales")).doubleValue();
            monthlySales.put(month, totalSales);
        }

        return monthlySales;
    }

    public Map<String, Double> getGenderSales() {
        List<Map<String, Object>> results = paymentRepository.getGenderSales();
        Map<String, Double> genderSales = new HashMap<>();

        for (Map<String, Object> result : results) {
            String gender = (String) result.get("gender");
            Double totalSales = ((Number) result.get("total_sales")).doubleValue();
            genderSales.put(gender, totalSales);
        }

        return genderSales;
    }


}
