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

}
