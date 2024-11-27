package edu.sm.app.repository;


import com.github.pagehelper.Page;
import edu.sm.app.dto.Search;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Repository
@Mapper
public interface TrainerRepository extends SMRepository<String, TrainerDto> {

    Page<TrainerDto> trainerfindpage(Search search) throws Exception;
}
