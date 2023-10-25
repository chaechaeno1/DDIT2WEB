package kr.or.ddit.camp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.CampVO;
import kr.or.ddit.vo.RsvVO;

public class CampDaoImpl implements ICampDao {

	private static ICampDao dao;
	private SqlSession session;
	
	public static ICampDao getInstance() {
		if(dao == null) dao = new CampDaoImpl();
		return dao;
	}
	
	@Override
	public List<CampVO> selectCampNo(String campCode) {
		session = MyBatisUtil.getSqlSession();
		List<CampVO> list = null;
		
		try {
			list = session.selectList("campsite.selectCampNo", campCode);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

}
