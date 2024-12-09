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
    private String trainerAge;
    private String trainerGender;
    private String trainerPhone;
    private String trainerAddress;
    private String trainerPwd;
    private String placeNo;
    private RoleDto role;

    public String getTrainerPwd() {
        return trainerPwd;
    }
}
