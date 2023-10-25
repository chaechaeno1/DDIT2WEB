package kr.or.ddit.admin.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AdminVO;
import kr.or.ddit.vo.SaleVO;

public interface IAdminService {

	// id pass 검색하여 admin 데이터 가져오기

	public AdminVO SelectByAdminId(Map<String, Object> map);

	// 매출 그래프 월별
	public List<String> SaleMonth();

	// 매출그래프 일별
	public List<SaleVO> SaleDay(String month);

}
