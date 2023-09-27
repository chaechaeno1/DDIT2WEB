package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

/*
 * dao 객체 얻기
 * 싱글톤을 위한 자신의 객체 생성해서 리턴하기
 */

public class BuyerServiceImpl implements IBuyerService{
	
	private IBuyerDao dao; // dao 객체 선언
	private static IBuyerService service; // 자기 자신은 static으로 선언
	
	//생성자 (dao를 한번만 생성하기 위함)
	private BuyerServiceImpl() { //controller에서 생성자에 new 생성으로 접근하지 못함
		dao = BuyerDaoImpl.getDao();
	}
	
	//public 선언. controller에서 사용해야함.
	public static IBuyerService getService() {
		if(service == null) service = new BuyerServiceImpl();
		return service;
	}

	@Override
	public List<BuyerVO> selectName() {
		 List<BuyerVO> list = null;
		 list = dao.selectName();
		 return list;
		
		//return dao.selectName();
	}

	@Override
	public BuyerVO selectById(String id) {
		BuyerVO vo = null;
		vo = dao.selectById(id);
		return vo;
		
		//return dao.selectById(id);
	}

}
