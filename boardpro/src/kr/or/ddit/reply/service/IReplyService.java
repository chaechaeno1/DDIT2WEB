package kr.or.ddit.reply.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.reply.vo.ReplyVO;

public interface IReplyService {
	
	
	//댓글 저장 - 리턴: int, param: vo, 메서드이름: insertReply 
	public int insertReply(ReplyVO vo);
	
	//댓글 삭제 - 리턴: int, param: int, 메서드이름: deleteReply 
	public int deleteReply(int rno);
	
	//댓글 수정 - 리턴: int, param: vo, 메서드이름: updateReply 
	public int updateReply(ReplyVO vo);
	
	//댓글 리스트 - 리턴: List<ReplyVO>, param: int, 메서드이름: listReply 
	public List<ReplyVO> listReply(int bno);
	
	
	
}
