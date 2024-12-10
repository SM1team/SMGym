package edu.sm.app.repository;

import edu.sm.app.dto.NoticeDto;
import edu.sm.app.frame.SMRepository;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface NoticeRepository extends SMRepository<Integer, NoticeDto> {

    @Autowired
    TrainerRepository trainerRepository = null; // 추가한 TrainerRepository 의존성 주입

    // 공지사항 전체 목록 조회
    List<NoticeDto> selectAll();

    // 페이징 처리된 공지사항 목록 조회
    List<NoticeDto> selectWithPaging(@Param("offset") int offset, @Param("pageSize") int pageSize);

    // 공지사항 총 개수 조회
    int countTotal();

    // 특정 트레이너의 공지사항 조회
    List<NoticeDto> selectByTrainer(@Param("trainerId") String trainerId, @Param("offset") int offset, @Param("pageSize") int pageSize);

    // 특정 트레이너의 공지사항 개수 조회
    int countByTrainer(@Param("trainerId") String trainerId);

    // 제목으로 공지사항 목록 조회
    List<NoticeDto> searchByTitle(@Param("searchKeyword") String searchKeyword, @Param("offset") int offset, @Param("pageSize") int pageSize);

    // 제목으로 공지사항 개수 조회
    int countSearchResults(@Param("searchKeyword") String searchKeyword);

    // 최신 4개의 공지사항 조회
    List<NoticeDto> selectRecentNotices();
    // 추가로 공지사항을 단일 조회하는 메서드
    NoticeDto selectNoticeByNo(@Param("noticeNo") int noticeNo);
}
