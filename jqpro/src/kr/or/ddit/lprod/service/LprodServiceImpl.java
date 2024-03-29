package kr.or.ddit.lprod.service;

import java.util.List;

import kr.or.ddit.lprod.dao.ILprodDao;
import kr.or.ddit.lprod.dao.LprodDaoImpl;
import kr.or.ddit.lprod.vo.LprodVO;

public class LprodServiceImpl implements ILprodService {
	
	private ILprodDao dao;
	private static ILprodService service;
	
	//생성자
	private LprodServiceImpl() {
		dao = LprodDaoImpl.getDao();
	}
	
	public static ILprodService getService() {
		if(service == null) service = new LprodServiceImpl();
		return service;
	}

	@Override
	public List<LprodVO> selectLprod() {
		List<LprodVO> list= null;
		list = dao.selectLprod();
		return list;
	}

}
