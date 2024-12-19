package edu.sm.app.service;
import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.ProductRepository;
import edu.sm.app.repository.TrainerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TrainerService implements SMService<Integer, TrainerDto> {

    final TrainerRepository trainerRepository;

    @Override
    public void add(TrainerDto trainerDto) throws Exception {

    }

    @Override
    public void modify(TrainerDto trainerDto) throws Exception {

    }

    @Override
    public void del(Integer integer) throws Exception {

    }

    @Override
    public TrainerDto get(Integer integer) throws Exception {
        return null;
    }


    @Override
    public List<TrainerDto> get() throws Exception {
        return trainerRepository.getTrainerIds();
    }



}








