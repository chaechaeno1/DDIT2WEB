package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;


public interface IMemberDao {
	
	
	//메서드 선언
	
		
		
		//id,pass 검색한 데이터 가져오기
		public MemberVO selectById(Map<String, Object> map);
		
		

}


