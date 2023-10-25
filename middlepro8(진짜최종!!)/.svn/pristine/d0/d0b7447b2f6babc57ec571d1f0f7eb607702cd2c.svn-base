package kr.or.ddit.FAQ.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FAQVO;

public interface IFAQDao {
	
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
	


	
}
