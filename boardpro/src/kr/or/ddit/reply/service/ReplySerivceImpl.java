package kr.or.ddit.reply.service;

import java.util.List;

import kr.or.ddit.reply.dao.IReplyDao;
import kr.or.ddit.reply.dao.ReplyDaoImpl;
import kr.or.ddit.reply.vo.ReplyVO;

public class ReplySerivceImpl implements IReplyService {
	private IReplyDao dao;
	private static IReplyService service;
	
	//생성자
	private ReplySerivceImpl() {
		dao = ReplyDaoImpl.getDao();
	}
	

	@Override
	public int insertReply(ReplyVO vo) {
		
		return dao.insertReply(vo);
	}

	@Override
	public int deleteReply(int rno) {
		
		return dao.deleteReply(rno);
	}

	@Override
	public int updateReply(ReplyVO vo) {
	
		return dao.updateReply(vo);
	}

	@Override
	public List<ReplyVO> listReply(int bno) {
		
		return dao.listReply(bno);
	}

}
