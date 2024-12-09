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
//        workoutLogRepository.save(workoutLogDto);
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
    // 운동이름 끌어오는 코드
    public List<String> getAllExerciseNames() {
        return workoutLogRepository.selectAllExerciseNames();
    }
    public void save(WorkoutLogDto workoutLogDto) {
        // DTO에서 엔티티로 변환 후 저장하는 로직을 추가
        workoutLogRepository.insert(workoutLogDto);
    }
    public List<WorkoutDetailDto> getWorkoutDetails(Integer workoutNo) throws Exception {
        // workoutNo에 해당하는 운동 기록 상세 정보를 조회
        return workoutLogRepository.workdetail(workoutNo);
    }

    // 운동 세부 정보 추가
    public void addWorkoutDetail(WorkoutDetailDto workoutDetailDto) throws Exception {
        // 운동 세부 정보 저장
        workoutLogRepository.insertWorkoutDetail(workoutDetailDto);
    }


    public void saveWorkoutDetail(WorkoutDetailDto workoutDetailDto) {
        workoutLogRepository.insertWorkoutDetail(workoutDetailDto);
    }
    //삭제
    public void deleteWorkoutDetail(int workoutDetailNo) throws Exception {
        workoutLogRepository.deleteWorkoutDetail(workoutDetailNo); // Repository에서 삭제 호출
    }
    // 수정
    public void editWorkoutDetail(WorkoutDetailDto workoutDetailDto) throws Exception {
        workoutLogRepository.updateWorkoutDetail(workoutDetailDto); // Repository에서 수정 호출
    }

    // 운동 일지에 해당하는 총 소모 칼로리 계산
    public Integer getTotalCalories(int workoutNo) throws Exception {
        List<WorkoutDetailDto> workoutDetails = workoutLogRepository.workdetail(workoutNo);
        return workoutDetails.stream()
                .mapToInt(WorkoutDetailDto::getWdetailCalories) // 소모 칼로리 값만 추출
                .sum(); // 합산
    }
    // 특정 운동 번호에 대해 총 운동 시간을 계산하는 메서드
    public Integer getTotalWorkoutTime(int workoutNo) throws Exception {
        List<WorkoutDetailDto> workoutDetails = workoutLogRepository.workdetail(workoutNo);

        // 운동 시간 합산
        return workoutDetails.stream()
                .mapToInt(WorkoutDetailDto::getWdetailTime) // 운동 시간만 추출 (예: 분 단위)
                .sum(); // 합산
    }

    public List<WorkoutDetailDto> getWorkoutDetailsByWorkoutNo(Integer workoutNo) throws Exception {
        // workoutNo에 해당하는 운동 기록 상세 정보를 조회
        return workoutLogRepository.workdetail(workoutNo); // Repository에서 해당 workoutNo에 대한 WorkoutDetailDto를 가져옴
    }


}
