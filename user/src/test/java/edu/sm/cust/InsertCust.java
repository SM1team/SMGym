package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class InsertCust {
    
	@Autowired
	CustService custService;

    CustDto custDto = CustDto.builder().custId("id01").custPwd("pwd01").custName("인성").custAge(25).custGender(1).custPhone("01047072690").custAddress("부천시").trainerId(null).custPoint(0).build();
    CustDto custDto2 = CustDto.builder().custId("id02").custPwd("pwd02").custName("인성").build();
    CustDto custDto3 = CustDto.builder().custId("id03").custPwd("pwd03").custName("인성").build();
    CustDto custDto4 = CustDto.builder().custId("id04").custPwd("pwd04").custName("인성").build();
    CustDto custDto5 = CustDto.builder().custId("id05").custPwd("pwd05").custName("인성").build();
    CustDto custDto6 = CustDto.builder().custId("id06").custPwd("pwd06").custName("인성").build();
    CustDto custDto7 = CustDto.builder().custId("id07").custPwd("pwd07").custName("인성").build();
    CustDto custDto8 = CustDto.builder().custId("id08").custPwd("pwd08").custName("인성").build();
    CustDto custDto9 = CustDto.builder().custId("id09").custPwd("pwd09").custName("인성").build();



	@Test
	void contextLoads() {
        try {
            custService.add(custDto);



        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
