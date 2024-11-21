package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import edu.sm.app.dto.ReservationDto;
//import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ReservationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ReservationService implements SMService<Integer, ReservationDto> {
    //인터페이스가 될 수 없다.
    //보통 controller가 호출하기 때문.
    //RequiredArgsConstructor를 써주면 CustService 객체가 생성될때 자동으로 custRepository 생성
    //RequiredArgsContructor를 사용하면, 필드를 final로..

    final ReservationRepository reservationRepository;


    @Override
    public void add(ReservationDto reservationDto) throws Exception {
        reservationRepository.insert(reservationDto);
    }

    @Override
    public void modify(ReservationDto reservationDto) throws Exception {
        reservationRepository.update(reservationDto);

    }

    @Override
    public void del(Integer s) throws Exception {
        reservationRepository.delete(s);

    }

    @Override
    public ReservationDto get(Integer s) throws Exception {
        return reservationRepository.selectOne(s);
    }

    @Override
    public List<ReservationDto> get() throws Exception {
        return reservationRepository.select();
    }

    public List<ReservationDto> findByCar(String name) throws Exception {
        return reservationRepository.findByCar(name);
    }

    public Page<ReservationDto> cargetPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo,5);
        return reservationRepository.cargetpage();
    }

//    public Page<ReservationDto> cargetfindPage(int pageNo, Search search) throws Exception {
//        PageHelper.startPage(pageNo,4); //한 화면에 2개씩
//        return reservationRepository.cargetfindpage(search);
//    }

    public List<ReservationDto> getReservationsByCustId(String custId) throws Exception {
        return reservationRepository.selectByCustId(custId);
    }
}
