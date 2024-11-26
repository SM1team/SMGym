package edu.sm.app.repository;

import edu.sm.app.dto.CommentDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CommentRepository extends SMRepository<Integer, CommentDto> {

    // 댓글 등록
    void insert(CommentDto commentDto);

    // 댓글 수정
    void update(@Param("commentDto") CommentDto commentDto);

    // 댓글 삭제
    void delete(@Param("commentNo") int commentNo);

    // 댓글 조회 (하나)
    CommentDto selectOne(@Param("commentNo") int commentNo);

    // 전체 댓글 조회
    List<CommentDto> select();

    // 특정 게시물에 달린 댓글 조회 (페이징 처리)
    List<CommentDto> selectByBoardId(@Param("boardId") int boardId,
                                     @Param("offset") int offset,
                                     @Param("pageSize") int pageSize);

    // 특정 게시물에 달린 댓글 수 조회
    int countByBoardId(@Param("boardId") int boardId);

    // 댓글 내용으로 검색된 댓글 조회 (페이징 처리)
    List<CommentDto> searchByContent(@Param("searchKeyword") String searchKeyword,
                                     @Param("offset") int offset,
                                     @Param("pageSize") int pageSize);

    // 댓글 내용으로 검색된 댓글 수 조회
    int countSearchResults(@Param("searchKeyword") String searchKeyword);

    // 특정 게시물에 해당하는 댓글 조회
    List<CommentDto> findByNoticeNo(@Param("noticeNo") int noticeNo);
}
