package edu.sm.app.repository;

import com.github.pagehelper.Page;
import edu.sm.app.dto.CartDto;
import edu.sm.app.dto.CustDto;
import edu.sm.app.dto.Search;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartRepository extends SMRepository<CartDto, CartDto> {
    List<CartDto> findByName(CartDto cartDto);
    Page<CustDto> getpage() throws Exception;
    Page<CustDto> getfindpage(Search search) throws Exception;

}
