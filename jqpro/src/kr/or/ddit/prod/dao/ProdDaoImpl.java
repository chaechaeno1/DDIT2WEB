package kr.or.ddit.prod.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;

/*
 * sqlSession 객체 얻기
 * 싱글톤을 위한 자신의 객체 생성해서 리턴하기
 * 
 */

import kr.or.ddit.prod.vo.ProdVO;

public class ProdDaoImpl implements IProdDao {
	private SqlSession sqlSession;
	private static IProdDao dao;
	
	public static IProdDao getDao() {
		if(dao == null) dao = new ProdDaoImpl();
		return dao;
	}
	
	@Override
	public List<ProdVO> selectByLgu(String lgu) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<ProdVO> list= null;
		try {
			list = sqlSession.selectList("prod.selectByLgu",lgu);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public ProdVO selectByIdDetail(String pid) {
		sqlSession = MyBatisUtil.getSqlSession();
		ProdVO vo= null;
		try {
			vo = sqlSession.selectOne("prod.selectByIdDetail", pid);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		
		return vo;
	}
}


