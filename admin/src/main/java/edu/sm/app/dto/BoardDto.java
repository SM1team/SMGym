package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
    private int noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private String noticeDate;  // String으로 변경
    private String custId;
    private String boardImg;

    public void setImg(String fileName) {
        this.boardImg = fileName; // 경로를 그대로 사용
    }

    // getId() 메서드 추가
    public int getId() {
        return noticeNo;  // noticeNo 필드를 반환
    }

    // 이미 존재하는 메서드들
    public String getUserId() {
        return custId;
    }
}