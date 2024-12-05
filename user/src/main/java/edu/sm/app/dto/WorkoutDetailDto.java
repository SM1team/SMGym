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
public class WorkoutDetailDto {
    private int wdetailId;        // 운동 세부 번호
    private int workoutNo;        // 운동 일지 번호
    private int machineNo;        // 운동기구 번호
    private String wdetailExname; // 운동 이름
    private int wdetailSets;      // 세트 수
    private int wdetailCount;     // 총 개수
    private int wdetailWeight;    // 총 무게
    private int wdetailCalories;  // 소모 칼로리
    private int wdetailTime;      // 운동 시간 (분)

}