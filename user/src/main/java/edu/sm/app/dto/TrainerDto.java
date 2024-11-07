package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TrainerDto {
    private String trainerId;
    private String trainerName;
    private int trainerAge;
    private int trainerGender;
    private String trainerPhone;
    private String trainerAddress;
    private String trainerPwd;
    private int placeNo;
}