package edu.sm.app.repository;

import edu.sm.app.dto.BoardDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BoardRepository extends SMRepository<Integer, BoardDto> {

    // 페이징된 게시물 목록을 반환하는 메서드
    List<BoardDto> selectWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);

    // 전체 게시물 수를 반환하는 메서드
    int countTotal();

    // 제목으로 검색된 게시물 반환 (검색어 포함된 게시물만)
    List<BoardDto> searchByTitle(@Param("searchKeyword") String searchKeyword, @Param("offset") int offset, @Param("pageSize") int pageSize);

    // 검색된 게시물 수 반환
    int countSearchResults(@Param("searchKeyword") String searchKeyword);

    // 내가 작성한 게시물 목록을 반환하는 메서드
    List<BoardDto> selectByUser(@Param("userId") String userId, @Param("offset") int offset, @Param("pageSize") int pageSize);

    // 내가 작성한 게시물 수를 반환하는 메서드
    int countByUser(@Param("userId") String userId);
}