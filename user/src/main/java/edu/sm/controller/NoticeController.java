package edu.sm.controller;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.dto.NoticeDto;
import edu.sm.app.dto.CommentDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.service.NoticeService;
import edu.sm.app.service.CommentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class NoticeController {


    @Value("${app.dir.uploadimgdir}")
    String uploadDir;

    @Value("${app.dir.imgdir}")
    String imgdir;


    private final NoticeService noticeService;

    // 페이징 계산 공통 메서드
    private void addPagingAttributes(Model model, int page, int pageSize, int totalNoticeCount) {
        int totalPages = (int) Math.ceil((double) totalNoticeCount / pageSize);

        if (totalPages == 0) {
            page = 1;
        } else if (page > totalPages) {
            page = totalPages;
        } else if (page < 1) {
            page = 1;
        }

        model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalNoticeCount", totalNoticeCount);
    }

    // 공지사항 목록 페이지
    @RequestMapping("/notice")
    public String showNoticePage(Model model,
                                 @RequestParam(value = "page", defaultValue = "1") int page,
                                 @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Navigating to Notice Page, page: {}, pageSize: {}", page, pageSize);


        // 전체 게시물 수
        int totalBoardCount = noticeService.getTotalNoticeCount();

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalBoardCount);


        List<NoticeDto> noticeList = noticeService.getPagedNotices(page, pageSize);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pageTitle", "공지사항 목록");
        model.addAttribute("top", "notice/top");
        model.addAttribute("center", "notice/center");

        return "index";
    }

    // 공지사항 상세보기 페이지
    @RequestMapping("/notice/detail")
    public String showNoticeDetails(@RequestParam("noticeNo") int noticeNo,
                                    Model model,
                                    HttpSession session) throws Exception {
        log.info("Navigating to Notice Detail Page for noticeNo: {}", noticeNo);


        // NoticeService의 get 메서드를 사용합니다.
        NoticeDto noticeDto = noticeService.get(noticeNo);  // getNotice -> get으로 수정


        try {
            noticeDto = noticeService.get(noticeNo);
        } catch (Exception e) {
            log.error("Failed to fetch board details for noticeNo: {}", noticeNo, e);
        }


        model.addAttribute("notice", noticeDto);
        model.addAttribute("pageTitle", "공지사항 상세보기");
        model.addAttribute("top", "notice/top");
        model.addAttribute("center", "notice/noticeDetail");

        return "index";
    }
    @RequestMapping("/notice/list")
    public String listNotice(Model model,
                             @RequestParam(value = "page", defaultValue = "1") int page,
                             @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {

        log.info("Navigating to Notice List Page, page: {}, pageSize: {}", page, pageSize);

        // 전체 공지사항 수 구하기
        int totalNoticeCount = noticeService.getTotalNoticeCount();

        // 페이징 처리 공통 메서드 호출
        addPagingAttributes(model, page, pageSize, totalNoticeCount);

        // 페이징 처리된 공지사항 조회
        List<NoticeDto> noticeList = noticeService.getPagedNotices(page, pageSize);

        // 모델에 데이터 추가
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pageTitle", "공지사항 목록");
        model.addAttribute("top", "notice/top");
        model.addAttribute("center", "notice/center");

        return "index"; // index.jsp 반환
    }


    // 공지사항 검색
    @RequestMapping("/notice/search")
    public String searchNotice(Model model,
                               @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
                               @RequestParam(value = "page", defaultValue = "1") int page,
                               @RequestParam(value = "pageSize", defaultValue = "10") int pageSize) throws Exception {
        log.info("Searching for notices with keyword: {}, page: {}, pageSize: {}", searchKeyword, page, pageSize);

        int totalNoticeCount = noticeService.getTotalSearchNoticeCount(searchKeyword);

        addPagingAttributes(model, page, pageSize, totalNoticeCount);

        List<NoticeDto> noticeList = noticeService.searchNoticesByTitle(searchKeyword, page, pageSize);

        model.addAttribute("noticeList", noticeList);
        model.addAttribute("pageTitle", "공지사항 검색 결과");
        model.addAttribute("top", "notice/top");
        model.addAttribute("center", "notice/center");

        return "index";
    }

    @RequestMapping("/noticewriteimpl")
    public String noticewriteimpl(Model model,
                                  @RequestParam("title") String title,
                                  @RequestParam("content") String content,

                                  @RequestParam(value = "noticeImg", required = false) MultipartFile noticeImg,
                                  HttpSession session) throws Exception {
        log.info("공지사항 저장 요청: 제목={}, 내용={}", title, content);

        try {
            TrainerDto loggedInUser = (TrainerDto) session.getAttribute("loginid");
            if (loggedInUser == null) {
                throw new Exception("로그인된 사용자가 없습니다.");
            }

            NoticeDto newNotice = new NoticeDto();
            newNotice.setNoticeTitle(title);
            newNotice.setNoticeContent(content);
            newNotice.setTrainerId(loggedInUser.getTrainerId());
            if (noticeImg != null && !noticeImg.isEmpty()) {
                String fileName = StringUtils.cleanPath(noticeImg.getOriginalFilename());
                File directory = new File(uploadDir);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                File uploadFile = new File(uploadDir + fileName);
                noticeImg.transferTo(uploadFile);
                newNotice.setImg(fileName);
            }

            noticeService.saveBoard(newNotice);

        } catch (Exception e) {
            log.error("게시글 저장 중 오류", e);

            // 예외를 콘솔에도 출력 (혹은 개발자 환경에서만 사용)
            e.printStackTrace();  // 이 줄을 추가하여 스택 트레이스를 콘솔에 출력

            model.addAttribute("error", "게시글 저장 중 오류가 발생했습니다.");

            return "redirect:/notice/write"; // 게시글 작성 페이지로 돌아가기
        }
        return "redirect:/notice"; // 게시글 저장 후 목록 페이지로 리디렉션
    }

}
