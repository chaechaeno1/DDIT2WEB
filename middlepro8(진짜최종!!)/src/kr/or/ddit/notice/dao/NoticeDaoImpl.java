package kr.or.ddit.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.mybatis.config.MyBatisUtil;
import kr.or.ddit.vo.NoticeVO;

public class NoticeDaoImpl implements INoticeDao {

	private static INoticeDao dao;
	private SqlSession session;
	
	// 자신을 생성하고 리턴
	public static INoticeDao getInstance() {
		if (dao == null) dao = new NoticeDaoImpl();

		return dao;
	}
	
	@Override
	public List<NoticeVO> selectNoticeList(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		List<NoticeVO> list = null;
		
		try {
			list = session.selectList("notice.selectNoticeList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}

	@Override
	public int getTotalCount(Map<String, Object> map) {
		session = MyBatisUtil.getSqlSession();
		int count = 0;
		
		try {
			count = session.selectOne("notice.getTotalCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return count;
	}

	@Override
	public int insertNotice(NoticeVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.insert("notice.insertNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int deleteNotice(int bno) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.delete("notice.deleteNotice", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateNotice(NoticeVO vo) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.update("notice.updateNotice", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

	@Override
	public int updateHit(int bno) {
		session = MyBatisUtil.getSqlSession();
		int res = 0;
		
		try {
			res = session.update("notice.updateHit", bno);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.commit();
			session.close();
		}
		return res;
	}

}
