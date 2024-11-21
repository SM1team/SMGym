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
    private String noticeDate;  // String으로 변경
    private String custId;
    private String boardImg;

    // 자동 생성된 setter와 getter 메소드 외에 커스텀 setImg() 메소드 추가
    public void setImg(String fileName) {
        this.boardImg = "/assets/img/board/" + fileName;
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