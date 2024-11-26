package edu.sm.app.service;

import edu.sm.app.dto.CommentDto;
import edu.sm.app.frame.SMService;
import edu.sm.app.repository.CommentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentService implements SMService<Integer, CommentDto> {

    private final CommentRepository repository;

    @Override
    public void add(CommentDto comment) throws Exception {
        repository.insert(comment);
    }

    @Override
    public void modify(CommentDto comment) throws Exception {
        repository.update(comment);
    }

    @Override
    public void del(Integer commentNo) throws Exception {
        repository.delete(commentNo);
    }

    @Override
    public CommentDto get(Integer commentNo) throws Exception {
        return repository.selectOne(commentNo);
    }

    @Override
    public List<CommentDto> get() throws Exception {
        return repository.select();
    }

    // 댓글 저장 메서드
    public void saveComment(CommentDto commentDto) throws Exception {
        if (commentDto.getNoticeNo() == 0) {
            throw new IllegalArgumentException("게시물 번호가 설정되지 않았습니다.");
        }
        repository.insert(commentDto);  // repository의 insert 메서드로 넘기기
    }

    // 특정 게시물에 대한 페이징 처리된 댓글 목록을 반환하는 메서드
    public List<CommentDto> getPagedCommentsByBoardId(int noticeNo, int offset, int pageSize) {
        return repository.selectByBoardId(noticeNo, offset, pageSize);
    }

    // 특정 게시물에 대한 댓글 개수 반환하는 메서드
    public int getCommentCountByBoardId(int noticeNo) {
        return repository.countByBoardId(noticeNo);
    }

    public List<CommentDto> getCommentsByNoticeNo(int noticeNo) {
        return repository.findByNoticeNo(noticeNo);
    }


}
