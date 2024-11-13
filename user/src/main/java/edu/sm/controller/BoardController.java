package edu.sm.controller;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    String dir = "board/";
    private final BoardService boardService;

//    // 게시판 목록을 페이징 처리하여 보여주는 메서드
//    @RequestMapping("/")
//    public String board(Model model,
//                        @RequestParam(value = "page", defaultValue = "1") int page,  // 기본 페이지 값은 1
//                        @RequestParam(value = "pageSize", defaultValue = "20") int pageSize) { // 기본 페이지 크기는 10
//
//        log.info("Board Page, page: {}, pageSize: {}", page, pageSize);
//
//        // 전체 게시물 수
//        int totalBoardCount = boardService.getTotalBoardCount();
//
//        // 페이징된 게시물 목록
//        List<BoardDto> boardList = boardService.getPagedBoards(page, pageSize);
//
//        // 페이지 정보 모델에 추가
//        model.addAttribute("boardList", boardList); // 게시물 목록
//        model.addAttribute("totalBoardCount", totalBoardCount); // 전체 게시물 수
//        model.addAttribute("page", page); // 현재 페이지
//        model.addAttribute("pageSize", pageSize); // 페이지 크기
//
//        // 공통 레이아웃 속성 추가
//        model.addAttribute("pageTitle", "게시판 목록"); // 페이지 제목
//        model.addAttribute("top", dir + "top"); // 상단 부분 (top.jsp)
//        model.addAttribute("center", dir + "center"); // 게시물 목록 (center.jsp)
//
//        return "index"; // index.jsp를 반환하여 top, center 포함
//    }

    // 게시물 상세보기 페이지
    @RequestMapping("/detail")
    public String detail(Model model, int noticeNo) {
        log.info("Board Detail Page");

        // 게시물 데이터 예시
        BoardDto board = null;
        try {
            board = boardService.get(noticeNo); // 실제 게시물 데이터를 DB에서 가져옴
        } catch (Exception e) {
            log.error("게시물 상세 조회 실패", e);
        }

        model.addAttribute("board", board); // 게시물 데이터 추가

        // 공통 레이아웃 속성 추가
        model.addAttribute("pageTitle", "게시물 상세보기"); // 페이지 제목
        model.addAttribute("top", dir + "top"); // 상단 부분 (top.jsp)
        model.addAttribute("center", dir + "boardDetail"); // 게시물 상세 (boardDetail.jsp)

        return "index"; // index.jsp를 반환하여 top, boardDetail 포함
    }
}
