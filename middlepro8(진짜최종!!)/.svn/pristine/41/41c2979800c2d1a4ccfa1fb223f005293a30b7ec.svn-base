package kr.or.ddit.rsv.service;

import java.util.List;

import kr.or.ddit.rsv.dao.IRsvDao;
import kr.or.ddit.rsv.dao.RsvDaoImpl;
import kr.or.ddit.vo.RsvVO;

public class RsvServiceImpl implements IRsvService {

	private IRsvDao dao;
	private static IRsvService service;
	
	private RsvServiceImpl() {
		dao = RsvDaoImpl.getInstance();
	}
	
	public static IRsvService getInstance() {
		if(service == null) service = new RsvServiceImpl();
		return service;
	}
	
	@Override
	public List<RsvVO> selectRsv() {
		return dao.selectRsv();
	}

	@Override
	public List<RsvVO> selectRsvAll(RsvVO rvo) {
		return dao.selectRsvAll(rvo);
	}

	@Override
	public List<RsvVO> selectRsvInfo(String mem_id) {
		return dao.selectRsvInfo(mem_id);
	}
	
	
	@Override
	public int insertRsv(RsvVO rvo) {
		return dao.insertRsv(rvo);
	}

	@Override
	public int getRightRsvNo() {
		return dao.getRightRsvNo();
	}
	
	
	@Override
	public List<RsvVO> selectByRsv(RsvVO rvo) {
		return dao.selectByRsv(rvo);
	}

	@Override
	public int updateRsvInfo(int rsvno) {
		return dao.updateRsvInfo(rsvno);
	}

}
