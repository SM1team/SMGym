package edu.sm.controller;

import edu.sm.app.dto.CommentDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.service.CommentService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.time.LocalDateTime;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommentController {

    private final CommentService commentService;  // 댓글 서비스

    // 댓글 작성 페이지 (새로운 댓글 작성)
    @RequestMapping("/comment/write")
    public String writeComment(@RequestParam("noticeNo") int noticeNo,
                               @RequestParam("commentContent") String commentContent,
                               HttpSession session,
                               Model model) {
        // 로그인된 사용자 정보 가져오기
        CustDto loggedInUser = (CustDto) session.getAttribute("loginid");

        // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        if (loggedInUser == null) {
            model.addAttribute("error", "로그인이 필요합니다.");
            return "redirect:/login";
        }

        // 댓글 작성 로직
        CommentDto commentDto = CommentDto.builder()
                .noticeNo(noticeNo)
                .custId(loggedInUser.getCustId()) // 로그인한 사용자 ID
                .commentContent(commentContent) // 사용자가 입력한 댓글 내용
                .commentDate(LocalDateTime.now()) // 현재 시간 설정
                .build();

        try {
            // 댓글 서비스 호출하여 댓글 저장
            commentService.saveComment(commentDto);
        } catch (Exception e) {
            log.error("댓글 저장 중 오류 발생", e);
            model.addAttribute("error", "댓글 저장 중 오류가 발생했습니다.");
            return "redirect:/board/detail?noticeNo=" + noticeNo;
        }

        // 작성 후 게시물 상세보기 페이지로 리다이렉트
        return "redirect:/board/detail?noticeNo=" + noticeNo;
    }

    // 댓글 저장 처리 (POST 요청)
    @RequestMapping("/comment/save")
    public String saveComment(@SessionAttribute("loginid") CustDto loggedInUser,
                              @RequestParam("noticeNo") int noticeNo,
                              @RequestParam("content") String content,
                              Model model) {
        log.info("Saving new comment for board: {}", noticeNo);

        try {
            // 댓글 DTO 생성
            CommentDto newComment = CommentDto.builder()
                    .custId(loggedInUser.getCustId())  // 로그인된 사용자 ID
                    .noticeNo(noticeNo)  // 게시물 ID
                    .commentContent(content)   // 댓글 내용
                    .commentDate(LocalDateTime.now())  // 댓글 작성 시간
                    .build();

            // 댓글 저장
            commentService.saveComment(newComment);

            // 게시물 상세 페이지로 리디렉션 (성공 메시지 전달)
            model.addAttribute("success", "댓글이 성공적으로 저장되었습니다.");
            return "redirect:/board/detail?noticeNo=" + noticeNo;
        } catch (Exception e) {
            log.error("댓글 저장 중 오류 발생", e);
            model.addAttribute("error", "댓글 저장 중 오류가 발생했습니다.");
            return "redirect:/board/detail?noticeNo=" + noticeNo;
        }
    }

    // 댓글 삭제 처리
    @RequestMapping("/comment/delete")
    public String deleteComment(@RequestParam("commentId") int commentId,
                                @RequestParam("noticeNo") int noticeNo,
                                Model model) {
        try {
            // 댓글 삭제
            commentService.del(commentId);  // 삭제 메서드 호출

            // 게시물 상세 페이지로 리디렉션 (성공 메시지 전달)
            model.addAttribute("success", "댓글이 성공적으로 삭제되었습니다.");
            return "redirect:/board/detail?noticeNo=" + noticeNo;
        } catch (Exception e) {
            log.error("댓글 삭제 중 오류 발생", e);
            model.addAttribute("error", "댓글 삭제 중 오류가 발생했습니다.");
            return "redirect:/board/detail?noticeNo=" + noticeNo;
        }
    }
}
