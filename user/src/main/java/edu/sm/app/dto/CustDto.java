package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CustDto {
    private String custId;
    private String custPwd;
    private String custName;
    private int custAge;
    private int custGender;
    private String custPhone;
    private String custAddress;
    private String trainerId;
    private int custPoint;
}