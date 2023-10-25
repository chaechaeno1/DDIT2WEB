package kr.or.ddit.notice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.NoticeVO;
import kr.or.ddit.vo.PageVO;

public interface INoticeService {
	
	// 리스트 가져오기 - 한 페이지당 3개씩
	public List<NoticeVO> selectNoticeList(Map<String, Object> map);
	
	// 전체 글 개수 구하기
	public int getTotalCount(Map<String, Object> map);
	
	// 저장
	public int insertNotice(NoticeVO vo);
	
	// 삭제
	public int deleteNotice(int bno);
	
	// 수정
	public int updateNotice(NoticeVO vo);
	
	// 조회수 증가
	public int updateHit(int bno);
	
	// 페이지별 정보구하기 - start, end, 총페이지수
	public PageVO pageInfo(int page, String stype, String sword);
	
}
