package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDao {

	// id, pass 검색해서 데이터 가져오기
	public MemberVO loginMember(Map<String, Object> map);
	
	// id 중복 검사
	public String idCheck(String id);
	
	// 회원가입
	public int insertMember(MemberVO vo);
	
	// 내 정보 수정
	public int updateMember(MemberVO vo);

	// 회원 탈퇴
	public int withdrawalMember(Map<String, Object> map);
	
	//아이디 찾기
	public String idFind(MemberVO vo);
	
	//패스워드 찾기
	public String pwFind(MemberVO vo);
	
	//임시비번
	public boolean updatePassword(String userid, String newPassword);
	
	// 회원정보조회
	public List<MemberVO> selectMemberList(Map<String, Object> map);
	
	// 전체 회원 수
	public int getTotalCont(Map<String, Object> map);
	
}
