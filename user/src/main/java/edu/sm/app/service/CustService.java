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
    public class CustService implements SMService<String, CustDto> {
        //인터페이스가 될 수 없다.
        //보통 controller가 호출하기 때문.
        //RequiredArgsConstructor를 써주면 CustService 객체가 생성될때 자동으로 custRepository 생성
        //RequiredArgsContructor를 사용하면, 필드를 final로..
        final CustRepository custRepository;

        @Override
        public void add(CustDto custDto) throws Exception {
            custRepository.insert(custDto);



        }

        @Override
        public void modify(CustDto custDto) throws Exception {
            custRepository.update(custDto);


        }

        @Override
        public void del(String s) throws Exception {
            custRepository.delete(s);

        }

        @Override
        public CustDto get(String s) throws Exception {
            return custRepository.selectOne(s);
        }

        @Override
        public List<CustDto> get() throws Exception {
            return custRepository.select();
        }

        public List<CustDto> findByName(String name) throws Exception {
            return custRepository.findByName(name);
        }

        public Page<CustDto> getPage(int pageNo) throws Exception {
            PageHelper.startPage(pageNo,5);
            return custRepository.getpage();
        }



    }
