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
    private int wdetailId;
    private int workoutNo;
    private int machineNo;
    private String wdetailExname;
    private int wdetailSets;
    private int wdetailCount;
    private int wdetailWeight;
    private int wdetailCalories;
    private int wdetailTime;
}