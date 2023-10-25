package kr.or.ddit.pay.service;

import kr.or.ddit.pay.dao.IPayDao;
import kr.or.ddit.pay.dao.PayDaoImpl;
import kr.or.ddit.vo.PayVO;

public class PayServiceImpl implements IPayService {

	private IPayDao dao;
	private static IPayService service;
	
	private PayServiceImpl() {
		dao = PayDaoImpl.getInstance();
	}
	
	public static IPayService getInstance() {
		if(service == null) service = new PayServiceImpl();
		return service;
	}

	@Override
	public int insertPayInfo(PayVO vo) {
		return dao.insertPayInfo(vo);
	}

	@Override
	public int updateRefundInfo(int rsvno) {
		return dao.updateRefundInfo(rsvno);
	}
	
	

}
