package edu.sm.app.repository;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface MachineRepository extends SMRepository<Integer, MachineDto> {

    /**
     * 기계 상태만 업데이트
     *
     * @param machineNo     변경할 머신 ID
     * @param machineStatus 변경할 상태값
     */
    void updateStatus(@Param("machineNo") Integer machineNo, @Param("machineStatus") boolean machineStatus) throws Exception;

    /**
     * 기계의 상태를 조회
     *
     * @param machineNo 기계 ID
     * @return 기계 상태
     */
    boolean getStatus(Integer machineNo) throws Exception;
}
