package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.CustDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CustService implements SMService<String, CustDto> {

    // 필요한 객체들
    final CustRepository custRepository;
    final BCryptPasswordEncoder passwordEncoder;  // BCryptPasswordEncoder 추가

    @Override
    public void add(CustDto custDto) throws Exception {
        // 비밀번호 암호화
        String encodedPwd = passwordEncoder.encode(custDto.getCustPwd());
        custDto.setCustPwd(encodedPwd);  // 암호화된 비밀번호를 DTO에 설정

        // 암호화된 비밀번호를 포함하여 사용자 정보 추가
        custRepository.insert(custDto);
    }

    @Override
    public void modify(CustDto custDto) throws Exception {
        // 비밀번호 수정이 필요하면 여기서도 암호화
        if (custDto.getCustPwd() != null) {
            String encodedPwd = passwordEncoder.encode(custDto.getCustPwd());
            custDto.setCustPwd(encodedPwd);  // 암호화된 비밀번호로 변경
        }

        // 사용자 정보 수정
        custRepository.update(custDto);
    }

    @Override
    public void del(String s) throws Exception {
        custRepository.delete(s);
    }

    @Override
    public CustDto get(String s) throws Exception {
        return custRepository.selectOne(s);
    }

    @Override
    public List<CustDto> get() throws Exception {
        return custRepository.select();
    }

    public List<CustDto> findByName(String name) throws Exception {
        return custRepository.findByName(name);
    }

    public Page<CustDto> getPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo, 5);
        return custRepository.getpage();
    }

    public boolean hasPurchasedPT(String custId) {
        return custRepository.hasPurchasedPT(custId) > 0;
    }
}
