package edu.sm.app.service;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MachineService {

    @Autowired
    private MachineRepository machineRepository;

    // 모든 머신의 상태를 가져오는 메서드
    public List<MachineDto> get() throws Exception {
        List<MachineDto> machines = machineRepository.select(); // SMRepository에서 모든 머신 목록을 조회
        return machines;
    }

    // 특정 머신의 상태를 가져오는 메서드
    public boolean getMachineStatus(Integer machineNo) throws Exception {
        return machineRepository.getStatus(machineNo); // 머신 번호에 따른 상태 조회
    }

    // 특정 머신의 상태를 변경하는 메서드
    public boolean toggleMachineStatus(Integer machineNo) throws Exception {
        MachineDto machine = machineRepository.selectOne(machineNo); // 머신 정보 조회
        if (machine != null) {
            boolean currentStatus = machine.isMachineStatus(); // 현재 상태
            boolean newStatus = !currentStatus; // 상태 토글
            machineRepository.updateStatus(machineNo, newStatus); // 상태 업데이트
            return true;
        }
        return false;
    }
}
