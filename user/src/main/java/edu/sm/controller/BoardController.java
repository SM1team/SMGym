package edu.sm.controller;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.dto.CommentDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.BoardService;
import edu.sm.app.service.CommentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.util.StringUtils;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class BoardController {
    private final CommentService commentService;
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
    // 게시물 상세보기 페이지
    @RequestMapping("/board/detail")
    public String showPostDetails(@RequestParam("noticeNo") int noticeNo,
                                  @RequestParam(value = "commentNo", required = false) Integer commentNo, // 댓글 번호 추가
                                  Model model,
                                  HttpSession session) throws Exception {
        log.info("Navigating to Board Detail Page for noticeNo: {}", noticeNo);

        // 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
        if (loggedInUser == null) {
            log.error("로그인 정보가 없습니다.");
            return "redirect:/login"; // 로그인 페이지로 리다이렉트
        }

        // 게시물 데이터 조회
        BoardDto boardDto = null;
        try {
            boardDto = boardService.get(noticeNo);
        } catch (Exception e) {
            log.error("Failed to fetch board details for noticeNo: {}", noticeNo, e);
        }

        // 댓글 데이터 조회
        List<CommentDto> comments = null;
        try {
            comments = commentService.getCommentsByNoticeNo(noticeNo); // 댓글 조회
        } catch (Exception e) {
            log.error("Failed to fetch comments for noticeNo: {}", noticeNo, e);
        }

        // 댓글 번호가 전달되었을 경우 해당 댓글 정보도 모델에 추가 (optional)
        if (commentNo != null) {
            CommentDto commentDto = null;
            try {
                commentDto = commentService.getCommentByCommentNo(commentNo);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            model.addAttribute("selectedComment", commentDto); // 선택된 댓글 정보 추가
            log.info("Selected comment: {}", commentDto);
        }

        // 게시물 정보와 댓글 리스트를 모델에 추가
        model.addAttribute("board", boardDto); // 게시물 데이터 추가
        model.addAttribute("comments", comments); // 댓글 목록 추가
        model.addAttribute("pageTitle", "게시물 상세보기");
        model.addAttribute("top", "board/top");
        model.addAttribute("center", "board/boardDetail");

        // 로그인된 사용자 정보를 함께 전달 (필요시)
        model.addAttribute("loginUser", loggedInUser); // 로그인한 사용자 정보

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

    @RequestMapping("/board/write")
    public String writeBoardPage(Model model) {
        log.info("Navigating to Board Write Page");

        model.addAttribute("pageTitle", "게시글 작성");
        model.addAttribute("top", "board/top"); // 상단 정보 JSP
        model.addAttribute("center", "board/boardWrite"); // 작성 폼 JSP 경로

        return "index"; // index.jsp 반환 (레이아웃 템플릿)
    }



}
