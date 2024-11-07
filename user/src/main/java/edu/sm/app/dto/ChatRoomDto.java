package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatRoomDto {
    private int chatroomNo;
    private String custId;
    private String trainerId;
    private java.util.Date chatroomDate;
}