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

    // 게시물 저장 메서드
    public void saveBoard(BoardDto boardDto) throws Exception {
        repository.insert(boardDto);
    }

    // 페이징 처리된 게시물 목록을 반환하는 메서드
    public List<BoardDto> getPagedBoards(int page, int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.selectWithPaging(offset, pageSize);
    }

    // 전체 게시물 수를 반환하는 메서드
    public int getTotalBoardCount() throws Exception {
        return repository.countTotal();
    }

    // 제목으로 검색된 게시물 반환 (검색어 포함된 게시물만)
    public List<BoardDto> searchBoardsByTitle(String searchKeyword, int page, int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.searchByTitle(searchKeyword, offset, pageSize);
    }

    // 로그인 이후 '내가 쓴 글'로 검색된 게시물 반환
    public List<BoardDto> getBoardsByCustId(String custId,int page,int pageSize) throws Exception {
        if (page <= 0 || pageSize <= 0) {
            throw new IllegalArgumentException("Page and pageSize must be greater than zero.");
        }
        int offset = (page - 1) * pageSize;
        return repository.selectByUser(custId,offset, pageSize);
    }
    // 검색된 게시물 수 반환
    public int getTotalSearchBoardCount(String searchKeyword) throws Exception {
        return repository.countSearchResults(searchKeyword);
    }
   // // 검색된 게시물 수 반환 - 로그인 이후 <내가 쓴 글>
    public int getTotalBoardsByCustId(String custId) {
        return repository.countByUser(custId);
   }

}
