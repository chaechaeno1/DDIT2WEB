package kr.or.ddit.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.PageVO;


/*
 * dao객체가 필요
 * Singleton을 위한 자기 자신의 객체를 생성해서 리턴하는 메서드 필요
 * 
 */
public class MemberServiceImpl implements IMemberService {

	private IMemberDao dao;
	private static IMemberService service;
	
	// 생성자
	private MemberServiceImpl() {
		dao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(service == null) service = new MemberServiceImpl();
		
		return service;
	}
	

	@Override
	public MemberVO loginMember(Map<String, Object> map) {
		MemberVO vo = null;
		
		vo = dao.loginMember(map);
		
		return vo;
	}

	@Override
	public String idCheck(String id) {
		return dao.idCheck(id);
	}

	@Override
	public int insertMember(MemberVO vo) {
		return dao.insertMember(vo);
	}

	@Override
	public int updateMember(MemberVO vo) {
		return dao.updateMember(vo);
	}

	@Override
	public int withdrawalMember(Map<String, Object> map) {
		return dao.withdrawalMember(map);
	}
	@Override
	public String idFind(MemberVO vo) {
		return dao.idFind(vo);
	}
	@Override
	public String pwFind(MemberVO vo) {
		return dao.pwFind(vo);
	}
	
	@Override
	public boolean updatePassword(String id, String newPassword) {
		return false;
	}
	
	
	@Override
	public List<MemberVO> selectMemberList(Map<String, Object> map) {
		return dao.selectMemberList(map);
	}

	@Override
	public int getTotalCont(Map<String, Object> map) {
		return dao.getTotalCont(map);
	}
	
	@Override
	public PageVO pageInfo(int page, String searchType, String searchMem) {
		//db와 관련 없이 일반 단순 로직 처리 
		
		PageVO vo = new PageVO();
		
		//전체 글갯 수 구하기 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchType" , searchType);
		map.put("searchMem", searchMem);
		
		int count = this.getTotalCont(map);
		
		//전체페이지수 구하기 
		int perList = PageVO.getPerList();  // 한페이지에 출력되는 글 갯수
		
		int totalPage = (int)Math.ceil((double)count /perList ) ;
		
		
		//start, end 갑ㄱ 구하기 
		//1페이지 - 1, 3 ,  2페이지 4, 6 , 3페이지 7, 9  ~~~   7페이지 19, 21
		int start = (page -1) * perList  + 1;
		int end = start + perList - 1;
		if(end > count) end = count;
		
		//시작페이지와 끝페이지 구하기 1페이지 1,2 , 2페이지 1, 2 
		//3페이지 3, 4 , 4페이지 3, 4  , 5페이지 5, 6 , 6 페이지 5, 6
		//7페이지 7, 8
		int perPage = PageVO.getPerPage();//현재 브라우저에 출력되는 페이지 갯수
		int startPage =  ((page-1) / perPage * perPage) + 1;
		int endPage = startPage + perPage  -1;
		if (endPage > totalPage ) endPage = totalPage;
		
		vo.setStart(start);
		vo.setEnd(end);
		vo.setStartPage(startPage);
		vo.setEndPage(endPage);
		vo.setTotalPage(totalPage);
		
		
		return vo;
	}

}
