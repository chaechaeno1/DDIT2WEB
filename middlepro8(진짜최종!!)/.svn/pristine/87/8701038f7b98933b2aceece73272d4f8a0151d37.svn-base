package kr.or.ddit.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.MemberVO;

/*
 * Data Access Object
 * SqlSession객체가 필요
 * Singleton을 위한 자신의 객체를 생성해서 리턴하는 메서드 필요
 */

public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao dao;
	private SqlSession session;
	
	// 생성자

	public static IMemberDao getInstance() {
		if (dao == null) dao = new MemberDaoImpl();

		return dao;
	}

	// 로그인
	@Override
	public MemberVO loginMember(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		MemberVO vo = null;
		
		try {
			vo = session.selectOne("member.loginMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return vo;
	}

	// id중복체크
	@Override
	public String idCheck(String id) {
		session = MyBatisUtil.getSqlSession();
		String res = null;
		
		try {
			res = session.selectOne("member.idCheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return res;
	}

	// 회원가입
	@Override
	public int insertMember(MemberVO vo) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.insert("member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	// 내 정보 수정
	@Override
	public int updateMember(MemberVO vo) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.update("member.updateMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}

	// 회원 탈퇴
	@Override
	public int withdrawalMember(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		int cnt = 0;
		
		try {
			cnt = session.update("member.withdrawalMember", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		
		return cnt;
	}
	
	//아이디 찾기
	@Override
	public String idFind(MemberVO vo) {
		session = MyBatisUtil.getSqlSession();
		String memId = null;
		
		try {
			memId = session.selectOne("member.idFind", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return memId;
		
		
	}
	
	//패스워드 찾기
	@Override
	public String pwFind(MemberVO vo) {
		session = MyBatisUtil.getSqlSession();
		String mempw = null;
		
		try {
			mempw = session.selectOne("member.pwFind", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		System.out.println("dao  ========================"  + mempw);
		return mempw;
		
		
	}
	
	// 임시비밀번호
	@Override
	public boolean updatePassword(String userid, String newPassword) {
		 session = MyBatisUtil.getSqlSession();
		    boolean success = false; // 초기값은 실패로 설정

		    try {
		        Map<String, String> params = new HashMap<>();
		        params.put("userid", userid);
		        params.put("newPassword", newPassword);

		        // 비밀번호 업데이트를 수행하고 업데이트된 행 수를 받아옴
		        int updatedRows = session.update("member.updatePassword", params);

		        if (updatedRows > 0) {
		            // 적어도 1행이 업데이트되었으면 업데이트 성공으로 처리
		            success = true;
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        session.commit();
		        session.close();
		    }

		    return success;

}
	
	//회원정보가져오기
	@Override
	public List<MemberVO> selectMemberList(Map<String, Object> map) {
		session  = MyBatisUtil.getSqlSession();
		List<MemberVO> list = null;
		
		try {
			list = session.selectList("member.selectMemberList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}

	
	
	// 총 회원인원 가져오기
	@Override
	public int getTotalCont(Map<String, Object> map) {
		session  = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.selectOne("member.getTotalCont", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return res;
	
	}
	

}
