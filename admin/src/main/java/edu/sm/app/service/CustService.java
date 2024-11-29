package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustService implements SMService<String, CustDto> {
    //인터페이스가 될 수 없다.
    //보통 controller가 호출하기 때문.
    //RequiredArgsConstructor를 써주면 CustService 객체가 생성될때 자동으로 custRepository 생성
    //RequiredArgsContructor를 사용하면, 필드를 final로..
    final CustRepository custRepository;

    @Override
    public void add(CustDto custDto) throws Exception {
        custRepository.insert(custDto);



    }

    @Override
    public void modify(CustDto custDto) throws Exception {
        custRepository.update(custDto);


    }

    @Override
    public void del(String s) throws Exception {
        custRepository.delete(s);

    }

    @Override
    public CustDto get(String s) throws Exception {
        return custRepository.selectOne(s);
    }

    @Override
    public List<CustDto> get() throws Exception {
        return custRepository.select();
    }

    public List<CustDto> findByName(String name) throws Exception {
        return custRepository.findByName(name);
    }

    public Page<CustDto> custfindpage(int pageNo, Search search) throws Exception {
        PageHelper.startPage(pageNo,4); //한 화면에 4개씩
        return custRepository.custfindpage(search);
    }

    public Map<String, Integer> getGenderCounts() {
        // Repository에서 데이터를 가져옴
        List<Map<String, Object>> results = custRepository.getGenderCounts();
        Map<String, Integer> genderCounts = new HashMap<>();

        // 결과가 비어있는지 확인
        if (results.isEmpty()) {
            System.out.println("No data found for gender counts");
        }

        for (Map<String, Object> result : results) {
            // Null 값 확인
            Object genderObj = result.get("cust_gender");
            Object countObj = result.get("count");

            if (genderObj == null || countObj == null) {
                System.out.println("Null value found in result: " + result);
                continue; // Null 값 건너뛰기
            }

            try {
                // Map의 값을 안전하게 변환
                int gender = ((Number) genderObj).intValue();
                int count = ((Number) countObj).intValue();

                // 성별 키 설정
                String genderKey = (gender == 1) ? "남성" : (gender == 2) ? "여성" : "기타";
                genderCounts.put(genderKey, count);
            } catch (Exception e) {
                System.err.println("Error parsing result: " + result);
                e.printStackTrace();
            }
        }

        // 결과 출력 확인
        System.out.println("Final genderCounts: " + genderCounts);

        return genderCounts;
    }




}
