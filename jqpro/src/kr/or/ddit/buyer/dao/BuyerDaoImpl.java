package kr.or.ddit.buyer.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.buyer.vo.BuyerVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

/*
 * sqlSession 객체 얻기
 * 싱글톤을 위한 자신의 객체 생성해서 리턴하기
 * 
 */

public class BuyerDaoImpl implements IBuyerDao{
	
	private SqlSession sqlSession;
	private static IBuyerDao dao; //자기 자신의 객체 선언, 클래스 혹은 인터페이스로 선언 가능
	
	//public 선언. service에서 사용되어야함.
	public static IBuyerDao getDao() {
		if(dao == null) dao = new BuyerDaoImpl();
		return dao;
			
	}

	@Override
	public List<BuyerVO> selectName() {
		sqlSession = MyBatisUtil.getSqlSession();
		List<BuyerVO> list= null; //(1) 선언
		try { //(2) 실행
			list = sqlSession.selectList("buyer.selectName");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list; //(3) 리턴
	}

	@Override
	public BuyerVO selectById(String id) {
		sqlSession = MyBatisUtil.getSqlSession();
		BuyerVO vo= null;
		try {
			vo = sqlSession.selectOne("buyer.selectById", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo;
	}

}
