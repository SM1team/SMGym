package edu.sm.app.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlaceDto {
    private int placeNo;
    private String placeName;
    private String placeLoc;
    private String placePhone;
}