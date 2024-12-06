package edu.sm.app.repository;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MachineRepository extends SMRepository<Integer, MachineDto> {

    // 머신 상태 업데이트
    void updateStatus(@Param("machineNo") Integer machineNo, @Param("machineStatus") boolean machineStatus) throws Exception;

    // 머신 상태 조회
    boolean getStatus(Integer machineNo) throws Exception;

    // 특정 machineNo에 대해 MachineDto 조회
    MachineDto selectOne(Integer machineNo) throws Exception;

    // 머신 상태 업데이트 (MyBatis 스타일)
    void updateMachineStatus(@Param("machineNo") int machineNo, @Param("machineStatus") boolean machineStatus) throws Exception;

    // machine_no에 해당하는 machine_status를 0에서 1, 1에서 0으로 반전시키는 쿼리
    void toggleMachineStatus(@Param("machineNo") int machineNo) throws Exception;
}
