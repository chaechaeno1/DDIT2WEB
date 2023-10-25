package kr.or.ddit.FAQ.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PageVO;

public interface IFAQService {
	  //리스트 가져오기 - 한페이지당 3(5)(10)개씩 
			public List<FAQVO> selectFAQList(Map<String, Object> map);
			
			//전체 글 갯수 구하기 
			public int getTotalCont(Map<String, Object> map);
			
			//저장
			public int insertFAQ(FAQVO  vo);
			
			//삭제
			public int deleteFAQ(int fno);
			
			//수정 
			public int updateFAQ(FAQVO  vo);
			
			//페이지별 정보구하기 - start, end, 총페이지수 
		    public PageVO pageInfo(int page, String stype, String sword);

}
