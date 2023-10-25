package kr.or.ddit.pay.dao;

import kr.or.ddit.vo.PayVO;

public interface IPayDao {
	
	/**
	 * 결제 정보를 저장하는 함수
	 * @param PayVO 결제 정보
	 * @return 성공, 실패 여부
	 */
	public int insertPayInfo(PayVO vo);
	
	public int updateRefundInfo(int rsvno);

}
