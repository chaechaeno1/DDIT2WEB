package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.dao.AdminDaoImpl;
import kr.or.ddit.admin.dao.IAdminDao;
import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.SaleVO;

public class AdminServiceImpl implements IAdminService {

	private IAdminDao dao;
	private static IAdminService service;
	
	private AdminServiceImpl() {
		dao = AdminDaoImpl.getDao();
		
	}
	public static IAdminService getService() {
		
		if(service == null) service = new AdminServiceImpl();
		return service;
	}
	
	@Override
	public AdminVO SelectByAdminId(Map<String, Object> map) {
	AdminVO vo = null;
	vo = dao.SelectByAdminId(map);
		return vo;
	}
	
	//월별
	@Override
	public List<String> SaleMonth() {
		List<String> vo = null;
		vo = dao.SaleMonth();	
		return vo;
	}
	
	//일별
	@Override
	public List<SaleVO> SaleDay(String month) {
		return dao.SaleDay(month);
	}
	


}
