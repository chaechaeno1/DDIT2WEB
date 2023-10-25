package kr.or.ddit.FAQ.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.FAQVO;

public class FAQDaoImpl implements IFAQDao {
	
	private SqlSession  sqlSession ;
	private static IFAQDao  dao;
 
	public static IFAQDao getDao() {
		if(dao == null)  dao = new FAQDaoImpl();
		
		return dao;
	}
	
	@Override
	public List<FAQVO> selectFAQList(Map<String, Object> map) {
		sqlSession  = MyBatisUtil.getSqlSession();
		List<FAQVO> list = null;
		
		try {
			list = sqlSession.selectList("FAQ.selectFAQList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	
	
	
	
	@Override
	public int getTotalCont(Map<String, Object> map) {
		sqlSession  = MyBatisUtil.getSqlSession();
		int res = 0;;
		
		try {
			res = sqlSession.selectOne("FAQ.getTotalCont", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return res;
	}
	
	
	
	

	@Override
	public int insertFAQ(FAQVO vo) {
		sqlSession  = MyBatisUtil.getSqlSession();
		int res = 0;;
		
		try {
			res = sqlSession.insert("FAQ.insertFAQ", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	
	
	
	
	
	@Override
	public int deleteFAQ(int fno) {
		sqlSession  = MyBatisUtil.getSqlSession();
		int res = 0;;
		
		try {
			res = sqlSession.delete("FAQ.deleteFAQ", fno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}
	
	
	
	
	@Override
	public int updateFAQ(FAQVO vo) {
		sqlSession  = MyBatisUtil.getSqlSession();
		int res = 0;;
		
		try {
			res = sqlSession.update("FAQ.updateFAQ", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}
	
}
