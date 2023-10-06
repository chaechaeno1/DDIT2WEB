package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.mybatis.config.MyBatisUtil;

public class BoardDaoImpl implements IBoardDao {
	
	private static IBoardDao dao;
	private SqlSession sqlSession;
	public static IBoardDao getDao() {
		if(dao==null) dao = new BoardDaoImpl();
		return dao;
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> map) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<BoardVO> list = null;
		try {
			list = sqlSession.selectList("board.selectBoardList", map);	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return list;
	}

	@Override
	public int getTotalCont(Map<String, Object> map) {
		sqlSession = MyBatisUtil.getSqlSession();
		int cnt = 0;
		try {
			cnt = sqlSession.selectOne("board.getTotalCont", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return cnt;
	}

	
	@Override
	public int insertBoard(BoardVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.insert("board.insertBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;

	}

	@Override
	public int deleteBoard(int bno) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.delete("board.deleteBoard", bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;

	}

	@Override
	public int updateBoard(BoardVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.update("board.updateBoard", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int updateHit(int bno) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.update("board.updateHit", bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

}
