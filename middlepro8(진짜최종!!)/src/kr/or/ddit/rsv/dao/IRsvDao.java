package kr.or.ddit.rsv.dao;

import java.util.List;

import kr.or.ddit.vo.RsvVO;

public interface IRsvDao {
	/**
	 * 전체 예약 내역을 불러온다
	 * @return List<RsvVO> : 전체 예약 내역
	 */
	public List<RsvVO> selectRsv();

	/**
	 * 현재 날짜의 달 정보로 예약 테이블의 정보를 가져오는 이벤트
	 * @param currMonth 현재 달의 정보를 가져옴
	 * @return 예약 테이블의 전체 정보를 반환
	 */
	public List<RsvVO> selectRsvAll(RsvVO rvo);
	
	/**
	 * 로그인된 아이디정보로 예약 내역을 가져온다
	 * @param mem_id
	 * @return List<RsvVO>
	 */
	public List<RsvVO> selectRsvInfo(String mem_id);
	
	
	
	/**
	 * 예약정보를 저장
	 * @param rvo 예약 정보들이 담긴 vo
	 * @return 예약 성공 여부
	 */
	public int insertRsv(RsvVO rvo);
	
	/**
	 * 예약 후 결제를 위해 예약번호를 바로 받아오는 함수
	 * @return 예약번호 반환
	 */
	public int getRightRsvNo();
	
	
	/**
	 * 캘린더애서 예약 정보 클릭시 예약내역 출
	 * @param rvo
	 * @return
	 */
	public List<RsvVO> selectByRsv(RsvVO rvo);
	
	
	public int updateRsvInfo(int rsvno);
	
	
}
