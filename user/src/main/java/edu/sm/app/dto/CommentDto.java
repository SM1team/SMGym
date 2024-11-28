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
    private int noticeNo;  // 게시글 번호
    private String custId;  // 작성자 ID
    private String commentContent;  // 댓글 내용
    private LocalDateTime commentDate;  // 댓글 작성일 (LocalDateTime 사용)

    // 별도의 setter와 getter는 Lombok의 @Data 어노테이션에 의해 자동으로 생성됨
}
