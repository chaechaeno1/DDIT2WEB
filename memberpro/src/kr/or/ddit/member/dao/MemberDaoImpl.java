package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.member.vo.ZipVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

/*
 * Data Access Object
 * SqlSession객체 필요
 * Singleton을 위한 자신의 객체를 생성하여 리턴하는 메서드 필요(getDao)
 * 
 */
public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao dao; // 자신의 객체 생성
	private SqlSession sqlSession; // 메서드 마다 하나씩 주어야 하므로 생성자 생성X, 각 메서드에 따로 줌

	public static IMemberDao getDao() { // serviceImpl에서 써야하므로 private 말고 public
		if (dao == null)
			dao = new MemberDaoImpl();
		return dao;
	}

	@Override
	public List<MemberVO> selectMember() {
		sqlSession = MyBatisUtil.getSqlSession();
		List<MemberVO> list = null; // (1)선언
		try {
			list = sqlSession.selectList("member.selectMember");// (2)실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list; // (3)리턴
	}

	@Override
	public MemberVO selectById(Map<String, Object> map) {
		sqlSession = MyBatisUtil.getSqlSession();
		MemberVO vo = null; // (1)선언
		try {
			vo = sqlSession.selectOne("member.selectById", map);// (2)실행

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return vo; // (3)리턴
	}

	//id 중복체크
	@Override
	public String idCheck(String id) {
		sqlSession = MyBatisUtil.getSqlSession();
		String res = null;
		try {
			res = sqlSession.selectOne("member.idCheck", id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	
	//우편번호 찾기
	@Override
	public List<ZipVO> selectByDong(String dong) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<ZipVO> list = null;
		try {
			list = sqlSession.selectList("member.selectByDong", dong);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return list;
	}

	@Override
	public int insertMember(MemberVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.insert("member.insertMember", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return res;
	}

}
