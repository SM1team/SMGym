    package edu.sm.app.service;

    import com.github.pagehelper.Page;
    import com.github.pagehelper.PageHelper;
    import edu.sm.app.dto.CustDto;
    import edu.sm.app.frame.SMService;
    import edu.sm.app.repository.CustRepository;
    import lombok.RequiredArgsConstructor;
    import org.springframework.stereotype.Service;

    import java.util.List;

    @Service
    @RequiredArgsConstructor
    public class PtService implements SMService<String, CustDto> {

        @Override
        public void add(CustDto custDto) throws Exception {

        }

        @Override
        public void modify(CustDto custDto) throws Exception {

        }

        @Override
        public void del(String s) throws Exception {

        }

        @Override
        public CustDto get(String s) throws Exception {
//            return PtRepository.selectOne(s);
            return null;
        }

        @Override
        public List<CustDto> get() throws Exception {
            return List.of();
        }
    }
