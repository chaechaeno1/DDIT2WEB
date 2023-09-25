package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

/*
 * dao객체 필요
 * 싱글톤을 위한 자기 자신의 객체를 생성해서 리턴하는 메서드(getService)
 * 
 * 
 */


public class MemberServiceImpl implements IMemberService {
	
	private IMemberDao dao;
	private static IMemberService service;
	
	//생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getDao();
		
	}
	
	public static IMemberService getService() {
		if(service == null) service = new MemberServiceImpl(); //첫번째만 생성
		return service; //두번째부터는 리턴만 실행
		
	}
	
	
	@Override
	public List<MemberVO> selectMember() {
		/*
		List<MemberVO> list = null;
		list = dao.selectMember();
		return list;
		*/
		return dao.selectMember();
	}

	@Override
	public MemberVO selectById(Map<String, Object> map) {
		/*
		MemberVO vo = null;
		vo = dao.selectById(map);
		return vo;
		*/	
		return dao.selectById(map);
	}

}
