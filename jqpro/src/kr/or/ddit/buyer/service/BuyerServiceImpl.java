package kr.or.ddit.buyer.service;

import java.util.List;

import kr.or.ddit.buyer.dao.BuyerDaoImpl;
import kr.or.ddit.buyer.dao.IBuyerDao;
import kr.or.ddit.buyer.vo.BuyerVO;

public class BuyerServiceImpl implements IBuyerService{
	
	private IBuyerDao dao;
	private static IBuyerService service;
	
	//생성자
	public BuyerServiceImpl() {
		dao = BuyerDaoImpl.getDao();
	}
	
	public static IBuyerService getService() {
		if(service == null) service = new BuyerServiceImpl();
		return service;
	}

	@Override
	public List<BuyerVO> selectName() {		
		return dao.selectName();
	}

	@Override
	public BuyerVO selectById(String id) {
		
		return dao.selectById(id);
	}

}
