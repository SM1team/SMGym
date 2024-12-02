package edu.sm.app.repository;

import edu.sm.app.dto.Search;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PaymentRepository {
    // 월별 매출 통계 데이터를 반환
    List<Map<String, Object>> getMonthlySales();

    // 성별 매출 통계 데이터 가져오기
    List<Map<String, Object>> getGenderSales();
}
