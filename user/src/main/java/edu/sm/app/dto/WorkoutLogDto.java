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
public class WorkoutLogDto {
    private int workoutNo;
    private String custId;
    private Date workoutDate;
    private int workoutTime;
    private int workoutCalories;
    private String workoutComments;
}