package edu.sm.cust;

import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class SelectOneCust {
	@Autowired
	CustService custService;

	String s = "id01";

	@Test
	void contextLoads() {


        try {
			CustDto custdto = custService.get(s);
			log.info(custdto.toString());

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}
