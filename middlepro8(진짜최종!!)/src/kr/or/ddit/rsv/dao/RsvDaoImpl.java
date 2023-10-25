package kr.or.ddit.rsv.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.RsvVO;

public class RsvDaoImpl implements IRsvDao {
	
	private static IRsvDao dao;
	private SqlSession session;
	
	public static IRsvDao getInstance() {
		if(dao == null) dao = new RsvDaoImpl();
		return dao;
	}
	
	// 예약 전체 내역 조회
	@Override
	public List<RsvVO> selectRsv() {
		session = MyBatisUtil.getSqlSession();
		List<RsvVO> list = null;
		
		try {
			list = session.selectList("rsv.selectRsv");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return list;
	}

	@Override
	public List<RsvVO> selectRsvAll(RsvVO rvo) {
		session = MyBatisUtil.getSqlSession();
		List<RsvVO> list = null;

		try {
			list = session.selectList("rsv.selectRsvAll", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return list;
	}

	@Override
	public List<RsvVO> selectRsvInfo(String mem_id) {
		session = MyBatisUtil.getSqlSession();
		List<RsvVO> list = null;
		
		try {
			list = session.selectList("rsv.selectRsvInfo", mem_id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	
	
	
	@Override
	public int insertRsv(RsvVO rvo) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.insert("rsv.insertRsv", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	@Override
	public int getRightRsvNo() {
		session = MyBatisUtil.getSqlSession();
		int rsvNo = 0;
		
		try {
			rsvNo = session.selectOne("rsv.getRightRsvNo");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return rsvNo;
	}
	
	
	
	
	@Override
	public List<RsvVO> selectByRsv(RsvVO rvo) {
		session = MyBatisUtil.getSqlSession();
		List<RsvVO> list = null;
		
		try {
			list = session.selectList("rsv.selectByRsv", rvo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return list;
	}

	@Override
	public int updateRsvInfo(int rsvno) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.update("rsv.updateRsvInfo", rsvno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}


}
