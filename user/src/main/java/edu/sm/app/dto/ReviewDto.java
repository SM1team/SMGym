package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDto {
    private int reviewNo;
    private String custId;
    private int productNo;
    private String reviewContent;
    private int reviewStar;
    private String reviewImg;
    private Date reviewDate;
}