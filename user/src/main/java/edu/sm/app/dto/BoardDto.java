package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
    private int noticeNo;
    private String noticeTitle;
    private String noticeContent;
    private LocalDateTime noticeDate;
    private String custId;
    private String boardImg;

    // getId() 메서드 추가
    public int getId() {
        return noticeNo;  // noticeNo 필드를 반환
    }

    // 이미 존재하는 메서드들
    public String getUserId() {
        return custId;
    }



}