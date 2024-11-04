package edu.sm.app.repository;

import edu.sm.app.dto.ItemDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ItemRepository extends SMRepository<Integer, ItemDto> {
    List<ItemDto> findByName(String name);
}
