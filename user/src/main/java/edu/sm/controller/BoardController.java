package edu.sm.controller;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.service.BoardService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/board") // 클래스 레벨에서 /board를 설정
public class BoardController {

    private final BoardService boardService;
    private final String dir = "board/";

    // 파일 업로드 경로
    private final String uploadDir = "C:/path/to/upload/"; // 실제 업로드 경로로 수정 필요

    // 페이징 계산 공통 메서드
    private void addPagingAttributes(Model model, int page, int pageSize, int totalBoardCount) {
        int totalPages = (int) Math.ceil((double) totalBoardCount / pageSize);

        if (totalPages == 0) { // 게시물이 없는 경우
            page = 1;
        } else if (page > totalPages) { // 초과 요청
            page = totalPages;
        } else if (page < 1) { // 0 이하 요청
            page = 1;
        }

        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalBoardCount", totalBoardCount);
    }

    // 게시판 목록 페이지
    @RequestMapping
    public String showBoardPage(Model model,
                                @RequestParam(value = "page", defaultValue = "1") int page,
                                @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Navigating to Board Page, page: {}, pageSize: {}", page, pageSize);

        int totalBoardCount = boardService.getTotalBoardCount();
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        List<BoardDto> boardList = boardService.getPagedBoards(page, pageSize);

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "게시판 목록");
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "center");

        return "index";
    }

    // 게시물 상세보기 페이지
    @RequestMapping("detail")
    public String showPostDetails(@RequestParam("noticeNo") int noticeNo, Model model) {
        log.info("Navigating to Board Detail Page for noticeNo: {}", noticeNo);

        BoardDto boardDto = null;
        try {
            boardDto = boardService.get(noticeNo);
        } catch (Exception e) {
            log.error("Failed to fetch board details for noticeNo: {}", noticeNo, e);
        }

        model.addAttribute("board", boardDto);
        model.addAttribute("pageTitle", "게시물 상세보기");
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "boardDetail");

        return "index";
    }




    // 검색 기능
    @RequestMapping("search")
    public String searchBoard(Model model,
                              @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Searching for boards with keyword: {}, page: {}, pageSize: {}", searchKeyword, page, pageSize);

        int totalBoardCount = boardService.getTotalSearchBoardCount(searchKeyword);
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        List<BoardDto> boardList = boardService.searchBoardsByTitle(searchKeyword, page, pageSize);

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "검색 결과");
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "center");

        return "index";
    }

    // 내가 작성한 글 목록 보기 (/history)
    @RequestMapping("history")
    public String showMyPosts(Model model,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Navigating to My Posts Page, page: {}, pageSize: {}", page, pageSize);

        int totalBoardCount = boardService.getTotalBoardCountByUser("dummyUser"); // 로그인 검증을 없앴으므로 임시 사용자 ID를 사용
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        List<BoardDto> boardList = boardService.getPagedBoardsByUser("dummyUser", page, pageSize);

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "내가 작성한 글");
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", dir + "myPosts");

        return "index";
    }
}
