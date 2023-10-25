package kr.or.ddit.FAQ.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.FAQ.dao.FAQDaoImpl;
import kr.or.ddit.FAQ.dao.IFAQDao;
import kr.or.ddit.vo.FAQVO;
import kr.or.ddit.vo.PageVO;

public class FAQServiceImpl implements IFAQService {
	
	private IFAQDao  dao;
	private static IFAQService  service;
	
	private FAQServiceImpl() {
		dao = FAQDaoImpl.getDao();
	}
	
	public static IFAQService getService() {
		if(service ==  null)  service = new FAQServiceImpl();
		
		return service;
	}
	
	
	
	@Override
	public List<FAQVO> selectFAQList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.selectFAQList(map);
	}

	@Override
	public int getTotalCont(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return dao.getTotalCont(map);
	}

	@Override
	public int insertFAQ(FAQVO vo) {
		// TODO Auto-generated method stub
		return dao.insertFAQ(vo);
	}

	@Override
	public int deleteFAQ(int fno) {
		// TODO Auto-generated method stub
		return dao.deleteFAQ(fno);
	}

	@Override
	public int updateFAQ(FAQVO vo) {
		// TODO Auto-generated method stub
		return dao.updateFAQ(vo);
	}

	@Override
	public PageVO pageInfo(int page, String stype, String sword) {
		//db와 관련 없이 일반 단순 로직 처리 
		
		PageVO vo = new PageVO();
		
		//전체 글갯 수 구하기 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stype" , stype);
		map.put("sword", sword);
		
		int count = this.getTotalCont(map);
		
		//전체페이지수 구하기 
		int perList = PageVO.getPerList();  // 한페이지에 출력되는 글 갯수
		
		int totalPage = (int)Math.ceil((double)count /perList ) ;
		
		
		//start, end 값 구하기 
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
