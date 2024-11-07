package edu.sm.cust;

import edu.sm.app.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class DeleteCust {
	@Autowired
	CustService custService;
	String a = "id01";

	@Test
	void contextLoads() {

        try {
			custService.del(a);


        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

}