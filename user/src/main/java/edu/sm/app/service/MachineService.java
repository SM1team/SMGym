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


    public MachineDto getMachineDetails(Integer machineNo) throws Exception {
        return machineRepository.selectOne(machineNo);  // DB에서 해당 머신 조회
    }

    // 모든 머신의 상태를 가져오는 메서드
    public List<MachineDto> get() throws Exception {
        List<MachineDto> machines = machineRepository.select(); // SMRepository에서 모든 머신 목록을 조회
        return machines;
    }

    // 특정 머신의 상태를 가져오는 메서드
    public boolean getMachineStatus(Integer machineNo) throws Exception {
        return machineRepository.getStatus(machineNo); // 머신 번호에 따른 상태 조회
    }

    // 기계 상태 토글
    public boolean toggleMachineStatus(int machineNo) throws Exception {
        // machineNo로 기계 정보 조회
        MachineDto machine = machineRepository.selectOne(machineNo);
        if (machine != null) {
            // 상태를 토글 (운동 중 -> 대기 중, 대기 중 -> 운동 중)
            boolean currentStatus = machine.isMachineStatus();
            machineRepository.toggleMachineStatus(machineNo);  // 상태 반전 쿼리 실행
            return true;
        }
        return false;  // 기계를 찾을 수 없을 경우
    }
    }

