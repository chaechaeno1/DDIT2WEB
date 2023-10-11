package kr.or.ddit.reply.service;

import java.util.List;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
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
	
	public static IReplyService getService() {
		if(service == null) service = new ReplySerivceImpl();//첫번째만 생성
		return service; //두번째부터는 리턴만 실행
		
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
