package edu.sm.board;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.service.BoardService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest // Spring Boot 환경에서 테스트 실행
public class SelectTest {

    @Autowired
    private BoardService boardService; // 실제 BoardService를 주입받기 위해 @Autowired 사용

    @BeforeEach
    public void setUp() {
        // Test 환경 준비 작업이 필요하면 여기서 설정할 수 있습니다.
    }

    @Test
    public void testGetAllBoards() throws Exception {
        // When: 전체 게시물 데이터를 조회
        List<BoardDto> result = boardService.get(); // 페이징 없이 모든 게시물을 가져옵니다.

        // Then: 조회된 결과를 검증
        assertNotNull(result); // 결과가 null이 아니어야 함
        assertTrue(result.size() > 0); // 게시물이 하나 이상 있어야 함
        System.out.println("Total board count: " + result.size());

        // 게시물 목록을 테이블 형식으로 출력 (콘솔 출력 예시)
        System.out.println("notice_no | notice_title | notice_content | notice_date | cust_id | board_img");
        for (BoardDto board : result) {
            // 각 컬럼에 맞게 출력
            System.out.println(board.getNoticeNo() + " | " +
                    board.getNoticeTitle() + " | " +
                    board.getNoticeContent() + " | " +
                    board.getNoticeDate() + " | " +
                    board.getUserId() + " | " +
                    board.getImageUrl());
        }
    }
}
