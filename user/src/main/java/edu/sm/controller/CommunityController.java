package edu.sm.controller;

import edu.sm.app.dto.BoardDto; // BoardDto import
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.sql.Date;

@Controller
@Slf4j
public class CommunityController {

    // 커뮤니티 페이지 엔드포인트
    @RequestMapping("/board")
    public String showBoardPage(Model model) {

        log.info("Navigating to Board Page");

        model.addAttribute("pageTitle", "게시판"); // 페이지 제목
        model.addAttribute("top",  "top"); // 상단 부분
        model.addAttribute("center", "center"); // 게시물 목록

        return "index"; // index.jsp 반환
    }

    // 게시물 상세보기 페이지 엔드포인트
    @RequestMapping("/board/viewPost/{notice_no}")
    public String showPostDetails(@PathVariable int notice_no, Model model) {
        // 게시물 정보를 DB에서 가져와서 model에 추가
        // 예시로 임의 데이터 사용
        BoardDto boardDto = BoardDto.builder()
                .noticeNo(notice_no)
                .noticeTitle("Sample Title")
                .noticeContent("Sample Content")
                .custId("User1")
                .noticeDate(new Date(System.currentTimeMillis())) // 현재 날짜로 설정
                .boardImg("sample.jpg") // 이미지 추가 예시
                .build();

        model.addAttribute("board", boardDto); // BoardDto 객체 추가

        String dir = "board/";

        model.addAttribute("pageTitle", "게시물 상세보기");
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "viewPost");

        return "index";
    }
}
