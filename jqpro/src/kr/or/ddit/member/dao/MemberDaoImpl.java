package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.vo.MemberVO;

/*
 * Data Access Object
 * SqlSession객체 필요
 * Singleton을 위한 자신의 객체를 생성하여 리턴하는 메서드 필요(getDao)
 * 
 */
public class MemberDaoImpl implements IMemberDao {
	
	private static IMemberDao dao;
	private static IMemberDao getDao() {
		if(dao == null) dao = new MemberDaoImpl();
		return dao;
	}
	
	

	@Override
	public List<MemberVO> selectMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO selectById(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
