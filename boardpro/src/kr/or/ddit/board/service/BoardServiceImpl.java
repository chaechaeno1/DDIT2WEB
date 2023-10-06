package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.board.dao.BoardDaoImpl;
import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.board.vo.BoardVO;

public class BoardServiceImpl implements IBoardService {
	
	private IBoardDao dao;
	private static IBoardService service;
	
	//생성자
	private BoardServiceImpl() {
		dao = BoardDaoImpl.getDao();
	}
	
	public static IBoardService getService() {
		if(service == null) service = new BoardServiceImpl();
		return service;
	}

	@Override
	public List<BoardVO> selectBoardList(Map<String, Object> map) {
		
		return dao.selectBoardList(map);
	}

	@Override
	public int getTotalCont(Map<String, Object> map) {
		
		return dao.getTotalCont(map);
	}

	@Override
	public int insertBoard(BoardVO vo) {
		
		return dao.insertBoard(vo);
	}

	@Override
	public int deleteBoard(int bno) {
		
		return dao.deleteBoard(bno);
	}

	@Override
	public int updateBoard(BoardVO vo) {
		
		return dao.updateBoard(vo);
	}

	@Override
	public int updateHit(int bno) {
		
		return dao.updateHit(bno);
	}

}
