package edu.sm.app.service;

import edu.sm.app.dto.TrainerDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.TrainerRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TrainerService implements SMService<String, TrainerDto> {

    private final TrainerRepository trainerRepository;

    @Override
    public void add(TrainerDto adminDto) throws Exception {
    }

    @Override
    public void del(String s) throws Exception {
    }

    @Override
    public void modify(TrainerDto adminDto) throws Exception {
    }

    @Override
    public TrainerDto get(String s) throws Exception {
        return trainerRepository.selectOne(s);
    }

    @Override
    public List<TrainerDto> get() throws Exception {
        return trainerRepository.select();
    }
}
