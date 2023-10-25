package kr.or.ddit.admin.dao;

import java.util.List;
import java.util.Map;


import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.SaleVO;

public class AdminDaoImpl implements IAdminDao {

	
	 private static IAdminDao dao;
	 private SqlSession session;
	 
	 public static IAdminDao getDao() {
		if(dao == null) dao = new AdminDaoImpl();
		 
		 
		 return dao;
		 
	 }

	@Override
	public AdminVO SelectByAdminId(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		AdminVO vo = null;
		try {
			vo = session.selectOne("admin.SelectByAdminId",map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return vo;
	}
	
	
	@Override
	public List<String> SaleMonth() {
		session = MyBatisUtil.getSqlSession();
		List<String> list = null;
		
		try {
			list = session.selectList("admin.SaleMonth");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return list;
	}
	
	@Override
	public List<SaleVO> SaleDay(String month) {
		session = MyBatisUtil.getSqlSession();
		List<SaleVO> list = null;
		
		try {
			list = session.selectList("admin.SaleDay", month);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}	
		return list;
	}

}
