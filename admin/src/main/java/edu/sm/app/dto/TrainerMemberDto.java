package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class TrainerMemberDto {
    private String trainerId; // 트레이너 ID
    private String trainerName;
    private int memberCount;   // 담당 회원 수
}
