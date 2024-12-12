package edu.sm.app.service;

import edu.sm.app.dto.NoticeDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.NoticeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class NoticeService implements SMService<Integer, NoticeDto> {

    private final NoticeRepository repository;

    @Override
    public void add(NoticeDto notice) throws Exception {
        repository.insert(notice);
    }

    @Override
    public void modify(NoticeDto notice) throws Exception {
        repository.update(notice);
    }

    @Override
    public void del(Integer noticeNo) throws Exception {
        repository.delete(noticeNo);
    }

    @Override
    public NoticeDto get(Integer noticeNo) throws Exception {
        return repository.selectOne(noticeNo);
    }

    @Override
    public List<NoticeDto> get() throws Exception {
        return repository.selectAll();
    }

    // 페이징 처리된 공지사항 목록
    public List<NoticeDto> getPagedNotices(int page, int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.selectWithPaging(offset, pageSize);
    }

    // 공지사항 총 개수 조회
    public int getTotalNoticeCount() throws Exception {
        return repository.countTotal();
    }

    // 특정 트레이너의 공지사항 조회
    public List<NoticeDto> getNoticesByTrainer(String trainerId, int page, int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.selectByTrainer(trainerId, offset, pageSize);
    }

    // 특정 트레이너의 공지사항 개수 조회
    public int getTotalNoticesByTrainer(String trainerId) throws Exception {
        return repository.countByTrainer(trainerId);
    }

    // 제목으로 공지사항 목록 조회
    public List<NoticeDto> searchNoticesByTitle(String searchKeyword, int page, int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.searchByTitle(searchKeyword, offset, pageSize);
    }

    // 제목으로 공지사항 개수 조회
    public int getTotalSearchNoticeCount(String searchKeyword) throws Exception {
        return repository.countSearchResults(searchKeyword);
    }



    // 게시물 저장 메서드
    public void saveBoard(NoticeDto noticeDto) throws Exception {
        repository.insert(noticeDto);
    }
}
