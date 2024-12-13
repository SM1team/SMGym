package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.dto.WorkoutDetailDto;
import edu.sm.app.dto.WorkoutLogDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository//spring container 위에 동작하기위함.
@Mapper//Mybatis framework 이동하기위한 통로이다.
public interface WorkoutLogRepository extends SMRepository<Integer, WorkoutLogDto> {
    //service에서 repository를 호출하면 하는일이 없음....
    //Mybatis가 다 해줌.
    //따라서 public class가 아닌 interface로 놓는다.
    //예전에 insert,update 이런거 다 써서 했는데 이걸 Mybatis가 해줌.

    List<WorkoutLogDto> findByCar(String s);

    Page<WorkoutLogDto> cargetpage() throws Exception;

//    Page<ReservationDto> cargetfindpage(Search search) throws Exception;

    List<WorkoutLogDto> selectByCustId(String custId);

    List<WorkoutDetailDto> workdetail(Integer workoutNo);
    //write 에서 받은 값 저장
    void insert(WorkoutLogDto workoutLogDto);
    // detail에서 받은 값 저장
    void insertWorkoutDetail(WorkoutDetailDto workoutDetailDto);

    List<String> selectAllExerciseNames();

    // 삭제
    void deleteWorkoutDetail(int workoutDetailNo);

    // 수정
    void updateWorkoutDetail(WorkoutDetailDto workoutDetailDto);

    int deleteByworkoutNo(Integer workoutNo);



}
