package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NoticeDto {
    private int noticeNo;
    private String trainerId;
    private String noticeTitle;
    private String noticeContent;
    private Date noticeDate;
    private String noticeImg;

    private TrainerDto trainer; // 추가된 부분

    public void setImg(String fileName) {
        this.noticeImg = fileName; // 경로를 그대로 사용
    }
}
