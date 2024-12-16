package edu.sm.controller;

import com.github.pagehelper.PageInfo;
import edu.sm.app.dto.*;
import edu.sm.app.service.*;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.MergedAnnotations;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.time.format.DateTimeParseException;

@Controller
@Slf4j
@RequiredArgsConstructor
public class MainInputController {

    @Value("${app.dir.uploadimgdir}")
    String uploadDir;

    @Value("${app.dir.imgdir}")
    String imgdir;

    final CustService custService;
    final ReservationService reservationService;
    final BoardService boardService;
    final CommentService commentService;
    final CustCheckService custCheckService;
    String dir = "register/";
    String qdir = "qna/";
    String bdir = "board/";

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID:" + id);
        log.info("PWD:" + pwd);

        CustDto custDto = custService.get(id);
        session.setAttribute("loginid", custDto);
        // PT 이용권 구매 여부 확인 및 세션에 저장
        boolean hasPT = custService.hasPurchasedPT(id);
        session.setAttribute("hasPT", hasPT);


        return "index";
    }
    @RequestMapping("/logoutimpl")
    public String logoutimpl(HttpSession session, Model model) {
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/registerimpl")
    public String registerimpl(Model model,
                               CustDto custDto,
                               HttpSession session) throws DuplicateKeyException, Exception {
        log.info("registerimpl 까지옴");
        try {
            custService.add(custDto); // DB에 사용자 추가
        } catch (DuplicateKeyException e) {
            throw e; // 예외 발생하면 전달
        } catch (Exception e) {
            throw e;
        }

        session.setAttribute("loginid", custDto); // session에 로그인 정보 추가
        model.addAttribute("top", dir + "top");
        model.addAttribute("center", "registerok");

        return "index";
    }

    @RequestMapping("/reservationimpl")
    public String reservationimpl(Model model,
                                  CustDto custDto,
                                  @RequestParam("custName") String custName,
                                  @RequestParam("custPhone") String custPhone,
                                  @RequestParam("reservationContent") String reservationContent,
                                  @RequestParam("reservationDate") String reservationDate,  // 예약 날짜
                                  HttpSession session) throws Exception {
        log.info("reservation 까지옴");

        // 예약 날짜를 로그로 출력
        log.info("Received reservation date: " + reservationDate);

        try {
            // 예약 날짜 형식을 파싱
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime localDateTime = LocalDateTime.parse(reservationDate, formatter);  // 예약 날짜를 LocalDateTime으로 변환

            // 입력받은 시간에 9시간 추가
            LocalDateTime adjustedDateTime = localDateTime.plusHours(9);

            // 9시간 추가된 시간을 Timestamp로 변환
            Timestamp timestamp = Timestamp.valueOf(adjustedDateTime);

            log.info("서버에서 받은 예약 시간 (9시간 추가): " + timestamp);

            // 로그인된 사용자 정보 가져오기
            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
            if (loggedInUser == null) {
                throw new Exception("로그인된 사용자가 없습니다.");
            }

            String custId = loggedInUser.getCustId();

            // 예약 정보 설정
            ReservationDto reservationDto = new ReservationDto();
            reservationDto.setCustName(custName);
            reservationDto.setCustPhone(custPhone);
            reservationDto.setReservationContent(reservationContent);
            reservationDto.setReservationDate(timestamp);  // 예약 날짜를 Timestamp로 저장
            reservationDto.setCustId(custId);

            // 예약 정보 저장
            reservationService.add(reservationDto);

        } catch (DateTimeParseException e) {
            log.error("DateTimeParseException: " + e.getMessage());
            throw new Exception("날짜 형식이 잘못되었습니다.", e);
        }

        // 모델에 예약 성공 메시지 추가
        model.addAttribute("reservationSuccess", true);
        model.addAttribute("top", qdir + "top");
        model.addAttribute("center", qdir + "reservation");

        return "redirect:/qna/history"; // 예약 후 index 페이지로 리턴
    }













    @RequestMapping("/boardwriteimpl")
    public String boardwriteimpl(Model model,
                                 @RequestParam("title") String title,
                                 @RequestParam("content") String content,
                                 @RequestParam(value = "boardImg", required = false) MultipartFile boardImg,
                                 HttpSession session) {
        log.info("게시글 저장 요청: 제목={}, 내용={}", title, content);

        try {
            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
            if (loggedInUser == null) {
                throw new Exception("로그인된 사용자가 없습니다.");
            }

            BoardDto newBoard = new BoardDto();
            newBoard.setNoticeTitle(title);
            newBoard.setNoticeContent(content);
            newBoard.setCustId(loggedInUser.getCustId());

            if (boardImg != null && !boardImg.isEmpty()) {
                String fileName = StringUtils.cleanPath(boardImg.getOriginalFilename());
                File directory = new File(uploadDir);
                if (!directory.exists()) {
                    directory.mkdirs();
                }

                File uploadFile = new File(uploadDir + fileName);
                boardImg.transferTo(uploadFile);
                newBoard.setImg(fileName);
            }

            boardService.saveBoard(newBoard);

        } catch (Exception e) {
            log.error("게시글 저장 중 오류", e);
            model.addAttribute("error", "게시글 저장 중 오류가 발생했습니다.");
            return "redirect:/board/write"; // 게시글 작성 페이지로 돌아가기
        }

        return "redirect:/board"; // 게시글 저장 후 목록 페이지로 리디렉션
    }

    @RequestMapping("/custcheckimpl")
    public String custcheckimpl(Model model,
                                Search search,
                                @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
                                @SessionAttribute("loginid") CustDto loginUser) throws Exception {  // 세션에서 로그인 사용자 정보 가져오기
        log.info("Search:" + search.toString());

        // 로그인된 사용자 ID를 Search 객체에 설정
        search.setCustId(loginUser.getCustId());  // 로그인된 사용자의 custId를 검색 조건에 추가

        PageInfo<CustCheckDto> p;
        p = new PageInfo<>(custCheckService.custcheckfindpage(pageNo, search), 3); // 하단 네비게이션 수

        model.addAttribute("custcheckpage", p);
        model.addAttribute("search", search);
        model.addAttribute("center", "mycheck/" + "center");

        return "index";
    }


//    @RequestMapping("/commentwriteimpl")
//    public String commentwriteimpl(Model model,
//                                   @RequestParam("noticeNo") int noticeNo,
//                                   @RequestParam("commentContent") String commentContent,
//                                   HttpSession session) {
//        log.info("댓글 저장 요청: noticeNo={}, 댓글 내용={}", noticeNo, commentContent);
//
//        try {
//            CustDto loggedInUser = (CustDto) session.getAttribute("loginid");
//            if (loggedInUser == null) {
//                throw new Exception("로그인된 사용자가 없습니다.");
//            }
//
//            CommentDto commentDto = new CommentDto();
//            commentDto.setNoticeNo(noticeNo);  // noticeNo로 설정
//            commentDto.setCommentContent(commentContent);
//            commentDto.setCustId(loggedInUser.getCustId());
//            commentDto.setCommentDate(LocalDateTime.now());  // 현재 시간 설정
//
//            commentService.saveComment(commentDto);  // DTO를 서비스로 전달
//
//        } catch (Exception e) {
//            log.error("댓글 저장 중 오류", e);
//            model.addAttribute("error", "댓글 저장 중 오류가 발생했습니다.");
//            return "redirect:/board/" + noticeNo;  // 게시판 상세 페이지로 리디렉션
//        }
//
//        return "redirect:/board/" + noticeNo; // 댓글 저장 후 게시판 상세 페이지로 리디렉션
//    }

}
