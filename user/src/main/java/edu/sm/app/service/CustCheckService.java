package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CustCheckDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustCheckRepository;
import edu.sm.app.repository.ItemRepository;
import edu.sm.util.QRCodeGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustCheckService implements SMService<String, CustCheckDto> {

    final CustCheckRepository custCheckRepository;

    @Override
    public void add(CustCheckDto custCheckDto) throws Exception {
        custCheckRepository.insert(custCheckDto);
    }

    @Override
    public void modify(CustCheckDto custCheckDto) throws Exception {
        custCheckRepository.update(custCheckDto);
    }

    @Override
    public void del(String s) throws Exception {
        custCheckRepository.delete(s);
    }

    @Override
    public CustCheckDto get(String s) throws Exception {
        return custCheckRepository.selectOne(s);
    }

    @Override
    public List<CustCheckDto> get() throws Exception {
        return custCheckRepository.select();
    }

    //QR생성
    public String generateQRCode(String custId) {
        try {
            // QR 코드에 담을 내용 (여기서는 회원 ID)
            String data = "https://127.0.0.1:85/check?custId=" + custId;

            // QR 코드 생성
            byte[] qrImageBytes = QRCodeGenerator.generateQRCodeImage(data);

            // Base64로 인코딩하여 반환
            return "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(qrImageBytes);

        } catch (Exception e) {
            e.printStackTrace();
            return "Error generating QR code";
        }
    }

    public void saveAttendance(String custId, String checkStart) throws Exception {
        CustCheckDto custCheckDto = new CustCheckDto();
        custCheckDto.setCustId(custId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(checkStart); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        custCheckDto.setCheckStart(timestamp); // checkStart에 Timestamp 값 설정
        custCheckRepository.save(custCheckDto); // 레포지토리 호출
    }

    public void updateCheckEndTime(String custId, String checkEnd) throws Exception {
        CustCheckDto custCheckDto = new CustCheckDto();
        custCheckDto.setCustId(custId);

        // checkStart를 String에서 LocalDateTime으로 변환
        LocalDateTime localDateTime = LocalDateTime.parse(checkEnd); // ISO 형식으로 날짜 변환

        // LocalDateTime을 Timestamp로 변환
        Timestamp timestamp = Timestamp.valueOf(localDateTime); // Timestamp로 변환

        custCheckDto.setCheckEnd(timestamp); // checkStart에 Timestamp 값 설정
        custCheckRepository.updateCheckEndTime(custCheckDto); // 레포지토리 호출
    }

    public Page<CustCheckDto> custcheckfindpage(int pageNo, Search search) throws Exception {
        // PageHelper로 페이지 설정
        PageHelper.startPage(pageNo, 4); // 페이지당 4개씩
        return custCheckRepository.custcheckfindpage(search); // 페이지네이션된 결과 반환
    }

    public List<Map<String, Object>> getMonthlyAttendance(String custId) {
        return custCheckRepository.getMonthlyAttendance(custId);
    }

}








