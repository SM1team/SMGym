    package edu.sm.app.service;


    import edu.sm.app.dto.PtDto;
    import edu.sm.app.frame.SMService;
    import edu.sm.app.repository.PtRepository;
    import lombok.RequiredArgsConstructor;
    import org.springframework.stereotype.Service;

    import java.util.List;

    @Service
    @RequiredArgsConstructor
    public class PtService implements SMService<String, PtDto> {
        private final PtRepository ptRepository;

        @Override
        public void add(PtDto ptDto) throws Exception {
            ptRepository.insert(ptDto);

        }

        @Override
        public void modify(PtDto ptDto) throws Exception {
            ptRepository.update(ptDto);

        }

        @Override
        public void del(String s) throws Exception {
            ptRepository.delete(s);

        }

        @Override
        public PtDto get(String s) throws Exception {
            return ptRepository.selectOne(s);


        }

        @Override
        public List<PtDto> get() throws Exception {
            return ptRepository.select();
        }

        public List<PtDto> getPTByTrainerId(String trainerId) throws Exception {
            return ptRepository.selectByTrainerId(trainerId);
        }

        public PtDto gets(Integer ptNo) throws Exception {
            return ptRepository.selectOnes(ptNo); // PT 번호로 해당 PT 조회
        }

        public void deletePts(List<Integer> ptNos) {
            for (Integer ptNo : ptNos) {
                int rowsAffected = ptRepository.deleteByPtNo(ptNo);
                if (rowsAffected > 0) {
                    System.out.println("삭제 성공: PT 번호 " + ptNo);
                } else {
                    System.out.println("삭제 실패: PT 번호 " + ptNo);
                }
            }
        }
    }
