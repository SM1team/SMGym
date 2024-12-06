package edu.sm.app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Search {
    private String keyword;
    private String search;
    private String custId;  // 로그인된 사용자의 custId 필드 추가



}
