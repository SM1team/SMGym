package edu.sm.controller;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BoardController {

    private final BoardService boardService;

    // 페이징 계산 공통 메서드
    private void addPagingAttributes(Model model, int page, int pageSize, int totalBoardCount) {
        int totalPages = (int) Math.ceil((double) totalBoardCount / pageSize);

        // 페이지 범위 검증
        if (totalPages == 0) { // 게시물이 없는 경우
            page = 1;
        } else if (page > totalPages) { // 초과 요청
            page = totalPages;
        } else if (page < 1) { // 0 이하 요청
            page = 1;
        }

        model.addAttribute("currentPage", page); // 현재 페이지
        model.addAttribute("pageSize", pageSize); // 페이지 크기
        model.addAttribute("totalPages", totalPages); // 총 페이지 수
        model.addAttribute("totalBoardCount", totalBoardCount); // 총 게시물 수
    }

    // 게시판 목록 페이지 엔드포인트
    @RequestMapping("/board")
    public String showBoardPage(Model model,
                                @RequestParam(value = "page", defaultValue = "1") int page,
                                @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Navigating to Board Page, page: {}, pageSize: {}", page, pageSize);

        // 전체 게시물 수
        int totalBoardCount = boardService.getTotalBoardCount();

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        // 페이징 처리된 게시물 목록 가져오기
        List<BoardDto> boardList = boardService.getPagedBoards(page, pageSize);

        // 모델에 데이터 추가
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "게시판 목록");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/center");

        return "index"; // index.jsp 반환
    }

    // 게시물 상세보기 페이지 엔드포인트
    @RequestMapping("/board/detail")
    public String showPostDetails(@RequestParam("noticeNo") int noticeNo, Model model) {
        log.info("Navigating to Board Detail Page for noticeNo: {}", noticeNo);

        // 게시물 데이터 조회
        BoardDto boardDto = null;
        try {
            boardDto = boardService.get(noticeNo);
        } catch (Exception e) {
            log.error("Failed to fetch board details for noticeNo: {}", noticeNo, e);
        }

        model.addAttribute("board", boardDto); // 게시물 데이터 추가
        model.addAttribute("pageTitle", "게시물 상세보기");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/boardDetail");

        return "index"; // index.jsp 반환
    }

    // 게시물 리스트 페이지 (페이징 처리)
    @RequestMapping("/board/list")
    public String listBoard(Model model,
                            @RequestParam(value = "page", defaultValue = "1") int page,
                            @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {

        log.info("Navigating to Board List Page, page: {}, pageSize: {}", page, pageSize);

        // 전체 게시물 수 구하기
        int totalBoardCount = boardService.getTotalBoardCount();

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        // 페이징 처리된 게시물 조회
        List<BoardDto> boardList = boardService.getPagedBoards(page, pageSize);

        // 모델에 데이터 추가
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "게시물 목록");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/center");

        return "index"; // index.jsp 반환
    }

    // 검색 기능을 위한 엔드포인트 추가
    @RequestMapping("/board/search")
    public String searchBoard(Model model,
                              @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Searching for boards with keyword: {}, page: {}, pageSize: {}", searchKeyword, page, pageSize);

        // 검색된 게시물 수 구하기
        int totalBoardCount = boardService.getTotalSearchBoardCount(searchKeyword);

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        // 검색된 게시물 목록 가져오기
        List<BoardDto> boardList = boardService.searchBoardsByTitle(searchKeyword, page, pageSize);

        // 모델에 데이터 추가
        model.addAttribute("boardList", boardList);
        model.addAttribute("pageTitle", "검색 결과");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/center");

        return "index"; // index.jsp 반환
    }


    // 내 게시물 목록 페이지 엔드포인트 (페이징 처리 추가)
    @RequestMapping("/board/myboards")
    public String getMyBoards(Model model, HttpSession session,
                              @RequestParam(value = "page", defaultValue = "1") int page,
                              @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        // 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        if (loggedInUser == null) {
            throw new Exception("로그인이 필요합니다.");
        }

        // 사용자 ID로 게시글 조회
        String custId = loggedInUser.getCustId();

        // 사용자 게시글 수 구하기 (페이징을 위한 전체 게시물 수)
        int totalBoardCount = boardService.getTotalBoardsByCustId(custId);

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalBoardCount);

        // 사용자가 작성한 게시글 목록 가져오기 (페이징 처리)
        List<BoardDto> myBoards = boardService.getBoardsByCustId(custId, page, pageSize);

        // 조회 결과를 모델에 추가
        model.addAttribute("myBoards", myBoards);
        model.addAttribute("pageTitle", "내 게시글");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/myBoards");

        // myboards.jsp로 이동
        return "index"; // index.jsp 반환
    }
}






























//    // 게시물 작성 내역 확인 페이지 - 사용자별 작성한 게시물 목록
//    @RequestMapping("board/history")
//    public String showHistoryPage(Model model,
//                                  @RequestParam(value = "page", defaultValue = "1") int page,
//                                  @RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
//                                  @SessionAttribute("custId") String custId) throws Exception {
//        // 사용자의 게시물 히스토리 목록 가져오기
//        List<BoardDto> historyList = boardService.getHistoryByCustId(page, pageSize, custId);
//
//        // 페이징 처리
//        int totalBoardCount = boardService.getTotalBoardCountByCustId(custId);
//        addPagingAttributes(model, page, pageSize, totalBoardCount);
//
//        model.addAttribute("pageTitle", "작성한 게시물 목록");
//        model.addAttribute("top", "board/top");
//        model.addAttribute("historyList", historyList);
//
//        return "board/history"; // history.jsp 반환
//    }
//