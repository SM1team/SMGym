package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.dto.WorkoutDetailDto;
import edu.sm.app.dto.WorkoutLogDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ReservationRepository;
import edu.sm.app.repository.WorkoutLogRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WorkoutLogService implements SMService<Integer, WorkoutLogDto> {
    //인터페이스가 될 수 없다.
    //보통 controller가 호출하기 때문.
    //RequiredArgsConstructor를 써주면 CustService 객체가 생성될때 자동으로 custRepository 생성
    //RequiredArgsContructor를 사용하면, 필드를 final로..

    final WorkoutLogRepository workoutLogRepository;


    @Override
    public void add(WorkoutLogDto workoutLogDto) throws Exception {
        workoutLogRepository.insert(workoutLogDto);
    }

    @Override
    public void modify(WorkoutLogDto workoutLogDto) throws Exception {
        workoutLogRepository.update(workoutLogDto);

    }

    @Override
    public void del(Integer s) throws Exception {
        workoutLogRepository.delete(s);

    }

    @Override
    public WorkoutLogDto get(Integer s) throws Exception {
        return workoutLogRepository.selectOne(s);
    }

    @Override
    public List<WorkoutLogDto> get() throws Exception {
        return workoutLogRepository.select();
    }

    public List<WorkoutLogDto> findByCar(String name) throws Exception {
        return workoutLogRepository.findByCar(name);
    }

    public Page<WorkoutLogDto> cargetPage(int pageNo) throws Exception {
        PageHelper.startPage(pageNo,5);
        return workoutLogRepository.cargetpage();
    }

//    public Page<ReservationDto> cargetfindPage(int pageNo, Search search) throws Exception {
//        PageHelper.startPage(pageNo,4); //한 화면에 2개씩
//        return reservationRepository.cargetfindpage(search);
//    }

    public List<WorkoutLogDto> getWorkoutByCustId(String custId) throws Exception {
        return workoutLogRepository.selectByCustId(custId);
    }

    public List<WorkoutDetailDto> WorkoutdetailNo(Integer workoutNo) throws Exception {
        return workoutLogRepository.workdetail(workoutNo);
    }
}
