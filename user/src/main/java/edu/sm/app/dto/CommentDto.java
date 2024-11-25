package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
    private int commentNo;
    private int noticeNo;  // 기존 boardId -> noticeNo로 변경
    private String custId;
    private String commentContent;
    private LocalDateTime commentDate;  // 시간 타입 변경: LocalDateTime으로 수정

    public void setCommentDate(LocalDateTime commentDate) {
        this.commentDate = commentDate;  // LocalDateTime을 그대로 설정
    }

    // getId() 메서드 추가
    public int getId() {
        return commentNo;  // commentNo 필드를 반환
    }

    // noticeNo 설정 메서드 추가
    public void setNoticeNo(int noticeNo) {
        this.noticeNo = noticeNo;
    }

    public int getNoticeNo() {
        return noticeNo;
    }
}
