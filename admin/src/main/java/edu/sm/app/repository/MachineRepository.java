package edu.sm.app.repository;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MachineRepository extends SMRepository<Integer, MachineDto> {

    int countActiveMachines();
}
