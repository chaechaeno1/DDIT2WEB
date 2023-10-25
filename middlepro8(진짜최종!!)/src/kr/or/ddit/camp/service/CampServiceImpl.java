package kr.or.ddit.camp.service;

import java.util.List;

import kr.or.ddit.camp.dao.CampDaoImpl;
import kr.or.ddit.camp.dao.ICampDao;
import kr.or.ddit.vo.CampVO;
import kr.or.ddit.vo.RsvVO;

public class CampServiceImpl implements ICampService {

	private ICampDao dao;
	private static ICampService service;
	
	private CampServiceImpl() {
		dao = CampDaoImpl.getInstance();
	}
	
	public static ICampService getInstance() {
		if(service == null) service = new CampServiceImpl();
		return service;
	}
	
	@Override
	public List<CampVO> selectCampNo(String campCode) {
		return dao.selectCampNo(campCode);
	}

}
