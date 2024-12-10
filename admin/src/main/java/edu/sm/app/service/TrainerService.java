package edu.sm.app.service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import edu.sm.app.dto.Search;
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
    public void add(TrainerDto trainerDto) throws Exception {
        trainerRepository.insert(trainerDto);
    }

    @Override
    public void del(String s) throws Exception {
        trainerRepository.delete(s);
    }

    @Override
    public void modify(TrainerDto trainerDto) throws Exception {
        trainerRepository.update(trainerDto);
    }

    @Override
    public TrainerDto get(String s) throws Exception {
        return trainerRepository.selectOne(s);
    }

    @Override
    public List<TrainerDto> get() throws Exception {
        return trainerRepository.select();
    }

    public Page<TrainerDto> trainerfindpage(int pageNo, Search search) throws Exception {
        PageHelper.startPage(pageNo,4); //한 화면에 4개씩
        return trainerRepository.trainerfindpage(search);
    }


}
