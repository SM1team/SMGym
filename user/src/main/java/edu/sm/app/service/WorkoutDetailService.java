package edu.sm.app.service;


import edu.sm.app.dto.WorkoutDetailDto;

import edu.sm.app.frame.SMService;
import edu.sm.app.repository.WorkoutDetailRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WorkoutDetailService implements SMService<Integer, WorkoutDetailDto> {
    //인터페이스가 될 수 없다.
    //보통 controller가 호출하기 때문.
    //RequiredArgsConstructor를 써주면 CustService 객체가 생성될때 자동으로 custRepository 생성
    //RequiredArgsContructor를 사용하면, 필드를 final로..

    final WorkoutDetailRepository workoutDetailRepository;


    @Override
    public void add(WorkoutDetailDto workoutDetailDto) throws Exception {
        workoutDetailRepository.insert(workoutDetailDto);
//        workoutDetailRepository.save(workoutLogDto);
    }

    @Override
    public void modify(WorkoutDetailDto workoutDetailDto) throws Exception {
        workoutDetailRepository.update(workoutDetailDto);

    }

    @Override
    public void del(Integer s) throws Exception {
        workoutDetailRepository.delete(s);

    }

    @Override
    public WorkoutDetailDto get(Integer s) throws Exception {
        return workoutDetailRepository.selectOne(s);
    }

    @Override
    public List<WorkoutDetailDto> get() throws Exception {
        return workoutDetailRepository.select();
    }

    public void deletewdetials(List<Integer> wdetailIds) {
        for (Integer wdetailId : wdetailIds) {
            int rowsAffected = workoutDetailRepository.deleteBywdetailNo(wdetailId);
            if (rowsAffected > 0) {
                System.out.println("삭제 성공: PT 번호 " + wdetailId);
            } else {
                System.out.println("삭제 실패: PT 번호 " + wdetailId);
            }
        }
    }




}
