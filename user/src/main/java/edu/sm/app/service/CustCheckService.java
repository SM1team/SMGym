package edu.sm.app.service;

import edu.sm.app.dto.CustCheckDto;
import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustCheckRepository;
import edu.sm.app.repository.ItemRepository;
import edu.sm.util.QRCodeGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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

    // 출석 기록
    public void recordCheckIn(String custId) {
        CustCheckDto custCheck = CustCheckDto.builder()
                .custId(custId)
                .checkStart(new java.sql.Date(System.currentTimeMillis()))
                .build();

        custCheckRepository.save(custCheck);
    }

    // 퇴실 기록
    public void recordCheckOut(String custId) {
        // 기존 출석 데이터를 찾아 퇴실 시간 업데이트
        CustCheckDto custCheck = custCheckRepository.findLatestCheckInByCustId(custId)
                .orElseThrow(() -> new RuntimeException("No check-in record found for customer ID: " + custId));

        custCheck.setCheckEnd(new java.sql.Date(System.currentTimeMillis()));
        custCheckRepository.update(custCheck);
    }

    //QR생성
    public String generateQRCode(String custId) {
        try {
            // QR 코드에 담을 내용 (여기서는 회원 ID)
            String data = "https://127.0.0.1:85/checkin?custId=" + custId;

            // QR 코드 생성
            byte[] qrImageBytes = QRCodeGenerator.generateQRCodeImage(data);

            // Base64로 인코딩하여 반환
            return "data:image/png;base64," + java.util.Base64.getEncoder().encodeToString(qrImageBytes);

        } catch (Exception e) {
            e.printStackTrace();
            return "Error generating QR code";
        }
    }
}








