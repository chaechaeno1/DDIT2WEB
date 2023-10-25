package kr.or.ddit.pay.dao;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.PayVO;

public class PayDaoImpl implements IPayDao {
	
	private static IPayDao dao;
	private SqlSession session;
	
	public static IPayDao getInstance() {
		if(dao == null) dao = new PayDaoImpl();
		return dao;
	}


	@Override
	public int insertPayInfo(PayVO vo) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.insert("pay.insertPayInfo", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}


	@Override
	public int updateRefundInfo(int rsvno) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.update("pay.updateRefundInfo", rsvno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
	

}
