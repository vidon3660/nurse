package nurse.board.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.board.dao.BoardDao;
import nurse.board.service.BoardService;
import nurse.board.vo.Board;

@Service("boardSerivce")
public class BoardServiceImpl implements BoardService{

	@Autowired(required=false)
	private BoardDao boardDao;
	
	@Override
	public ArrayList<Board> getBoardList(Board b) {
		
		return boardDao.getBoardList(b);
	}

	@Override
	public Boolean insertArticle(Board b) {
		//줄 바꿈
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.insertArticle(b);
		return true;
	}
	
	@Override
	public Boolean insertArticlePlus(Board b) {
		//줄 바꿈
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.insertArticlePlus(b);
		return true;
	}

	@Override
	public Board getBoardArticle(String num) {
		//게시글을 가져오면서 조회카운트 1증가
		plusArticleCount(num);
		return boardDao.getBoardArticle(num);
	}

	@Override
	public int getBoardCount() {
		return boardDao.getBoardCount();
	}

	@Override
	public void plusArticleCount(String num) {
		boardDao.plusArticleCount(num);
	}

	@Override
	public void deleteBoardArticle(Board b) {
		boardDao.deleteBoardArticle(b);
	}

	@Override
	public void updateBoardArticle(Board b) {
		b.setContent(b.getContent().replace("\r\n","<br>"));
		boardDao.updateBoardArticle(b);
	}

	@Override
	public void updateSameGroupSrtno(Board b) {
		boardDao.updateSameGroupSrtno(b);
	}

}
