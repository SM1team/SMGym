package edu.sm.app.service;


import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.Search;
import edu.sm.app.dto.TrainerCheckDto;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.TrainerCheckRepository;
import edu.sm.util.QRCodeGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class TrainerCheckService implements SMService<String, TrainerCheckDto> {

    final TrainerCheckRepository trainercheckRepository;

    @Override
    public void add(TrainerCheckDto trainerCheckDto) throws Exception {
        trainercheckRepository.insert(trainerCheckDto);
    }

    @Override
    public void modify(TrainerCheckDto trainerCheckDto) throws Exception {
        trainercheckRepository.update(trainerCheckDto);
    }

    @Override
    public void del(String s) throws Exception {
        trainercheckRepository.delete(s);
    }

    @Override
    public TrainerCheckDto get(String s) throws Exception {
        return trainercheckRepository.selectOne(s);
    }

    @Override
    public List<TrainerCheckDto> get() throws Exception {
        return trainercheckRepository.select();
    }

    //QR생성
    public String generateQRCode(String trainerId) {
        try {
            // QR 코드에 담을 내용 (여기서는 회원 ID)
            String data = "https://127.0.0.1:84/check?trainerId=" + trainerId;

            // QR 코드 생성
            byte[] qrImageBytes = QRCodeGenerator.generateQRCodeImage(data);

            // Base64로 인코딩하여 반환
            return "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(qrImageBytes);

        } catch (Exception e) {
            e.printStackTrace();
            return "Error generating QR code";
        }
    }

    public void saveAttendance(String trainerId, String tcheckStart) throws Exception {
        TrainerCheckDto trainerCheckDto = new TrainerCheckDto();
        trainerCheckDto.setTrainerId(trainerId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(tcheckStart); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        trainerCheckDto.setTcheckStart(timestamp); // checkStart에 Timestamp 값 설정
        trainercheckRepository.save(trainerCheckDto); // 레포지토리 호출
    }

    public void updateCheckEndTime(String trainerId, String tcheckEnd) throws Exception {
        TrainerCheckDto trainerCheckDto = new TrainerCheckDto();
        trainerCheckDto.setTrainerId(trainerId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(tcheckEnd); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        trainerCheckDto.setTcheckEnd(timestamp); // checkStart에 Timestamp 값 설정
        trainercheckRepository.updateCheckEndTime(trainerCheckDto); // 레포지토리 호출
    }

    public List<Map<String, Object>> getTodayAttendance() {
        return trainercheckRepository.getTrainersWithTodayAttendance();
    }

    public Page<TrainerCheckDto> trainercheckfindpage(int pageNo, Search search) throws Exception {
        // PageHelper로 페이지 설정
        PageHelper.startPage(pageNo, 4); // 페이지당 4개씩
        return trainercheckRepository.trainercheckfindpage(search); // 페이지네이션된 결과 반환
    }



}








