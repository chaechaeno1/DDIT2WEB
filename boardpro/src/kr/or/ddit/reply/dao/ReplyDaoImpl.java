package kr.or.ddit.reply.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.reply.vo.ReplyVO;

public class ReplyDaoImpl implements IReplyDao {
	private static IReplyDao dao;
	private SqlSession sqlSession;
	public static IReplyDao getDao(){
		if(dao==null) dao = new ReplyDaoImpl();
		return dao;	
	}
	

	@Override
	public int insertReply(ReplyVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.insert("reply.insertReply", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int deleteReply(int rno) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.delete("reply.deleteReply", rno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public int updateReply(ReplyVO vo) {
		sqlSession = MyBatisUtil.getSqlSession();
		int res = 0;
		try {
			res = sqlSession.update("reply.updateReply", vo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return res;
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		sqlSession = MyBatisUtil.getSqlSession();
		List<ReplyVO> list = null;
		try {
			list = sqlSession.selectList("reply.listReply", bno);	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.commit();
			sqlSession.close();
		}

		return list;
	}

}
