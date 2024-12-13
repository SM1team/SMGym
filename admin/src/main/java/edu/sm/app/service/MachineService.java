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


    public int getActiveMachineCount() {
        return machineRepository.countActiveMachines();
    }
}

