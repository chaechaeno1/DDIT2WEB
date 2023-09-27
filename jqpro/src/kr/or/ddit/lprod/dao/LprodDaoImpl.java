package kr.or.ddit.lprod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

/*
 * sqlSession 객체 얻기
 * 싱글톤을 위한 자신의 객체 생성해서 리턴하기
 * 
 */

import kr.or.ddit.lprod.vo.LprodVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class LprodDaoImpl implements ILprodDao {
	
	private SqlSession sqlSession;
	private static LprodDaoImpl dao;
	
	public static ILprodDao getDao() {
		if(dao == null) dao = new LprodDaoImpl();		
		return dao;
	}
	
	@Override
	public List<LprodVO> selectLprod() {
		sqlSession = MyBatisUtil.getSqlSession();
		List<LprodVO> list= null;
		try {
			list = sqlSession.selectList("lprod.selectLprod");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

}
