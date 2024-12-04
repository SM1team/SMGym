package edu.sm.app.service;

import edu.sm.app.dto.MachineDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.MachineRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MachineService implements SMService<Integer, MachineDto> {

    @Autowired
    private MachineRepository machineRepository;

    @Override
    public void add(MachineDto machineDto) throws Exception {
        machineRepository.insert(machineDto);
    }

    @Override
    public void modify(MachineDto machineDto) throws Exception {
        machineRepository.update(machineDto);
    }

    @Override
    public void del(Integer machineNo) throws Exception {
        machineRepository.delete(machineNo);
    }

    @Override
    public MachineDto get(Integer machineNo) throws Exception {
        return machineRepository.selectOne(machineNo);
    }

    @Override
    public List<MachineDto> get() throws Exception {
        return machineRepository.select();
    }

    /**
     * machineStatus만 변경하는 메서드
     */
    public void changeStatus(Integer machineNo, boolean machineStatus) throws Exception {
        // 기계 상태 변경
        machineRepository.updateStatus(machineNo, machineStatus);
    }

    /**
     * machineStatus를 토글하는 메서드
     */

    public void toggleMachineStatus(Integer machineNo) throws Exception {
        // 현재 상태를 가져옴
        boolean currentStatus = machineRepository.getStatus(machineNo);  // 상태 조회

        // 상태 토글: true -> false, false -> true
        boolean newStatus = !currentStatus;

        // 상태 변경
        machineRepository.updateStatus(machineNo, newStatus);

        // 상태 변경 후, DB에서 변경된 상태를 가져와 콘솔에 출력
        boolean updatedStatus = machineRepository.getStatus(machineNo); // 변경된 상태 조회
        System.out.println("Machine No: " + machineNo + " Status Updated to: " + updatedStatus);
    }


//    // 머신 상태 가져오기
//    public int getMachineStatus(Integer machineNo) {
//        Optional<Machine> machineOpt = machineRepository.findById(machineNo);
//        return machineOpt.map(Machine::getMachineStatus).orElse(-1);  // 상태를 가져옴, 없으면 -1
//    }



}