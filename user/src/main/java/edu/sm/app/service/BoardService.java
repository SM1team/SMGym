package edu.sm.app.service;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService implements SMService<Integer, BoardDto> {

    private final BoardRepository repository;

    @Override
    public void add(BoardDto board) throws Exception {
        repository.insert(board);
    }

    @Override
    public void modify(BoardDto board) throws Exception {
        repository.update(board);
    }

    @Override
    public void del(Integer noticeNo) throws Exception {
        repository.delete(noticeNo);
    }

    @Override
    public BoardDto get(Integer noticeNo) throws Exception {
        return repository.selectOne(noticeNo);
    }

    @Override
    public List<BoardDto> get() throws Exception {
        return repository.select();
    }

    // 페이징 처리된 게시물 목록을 반환하는 메서드
    public List<BoardDto> getPagedBoards(int page, int pageSize) {
        // 페이징 처리: 페이지 번호와 페이지 크기 기반으로 게시물 조회
        int offset = (page - 1) * pageSize;  // offset 계산
        return repository.selectWithPaging(offset, pageSize);
    }

    // 전체 게시물 수를 반환하는 메서드
    public int getTotalBoardCount() {
        // 게시물의 전체 개수를 반환
        return repository.countTotal();
    }
}
