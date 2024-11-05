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
public class WorkoutLogDto {
    private int workoutNo;
    private String custId;
    private int machineNo;
    private Date workoutDate;
    private int workoutDuration;
    private int workoutCalories;
    private String comments;
}