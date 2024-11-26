package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.ReservationDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository//spring container 위에 동작하기위함.
@Mapper//Mybatis framework 이동하기위한 통로이다.
public interface CustRepository extends SMRepository<String, CustDto> {
    //service에서 repository를 호출하면 하는일이 없음....
    //Mybatis가 다 해줌.
    //따라서 public class가 아닌 interface로 놓는다.
    //예전에 insert,update 이런거 다 써서 했는데 이걸 Mybatis가 해줌.

    List<CustDto> findByName(String Name);

    Page<CustDto> custfindpage(Search search) throws Exception;





}
