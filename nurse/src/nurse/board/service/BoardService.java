package nurse.board.service;

import java.util.ArrayList;

import nurse.board.vo.Board;

public interface BoardService {
	public ArrayList<Board> getBoardList(Board b);
	public Boolean insertArticle(Board b);
	public Boolean insertArticlePlus(Board b);
	public Board getBoardArticle(String num);
	public int getBoardCount();
	public void plusArticleCount(String num);
	public void deleteBoardArticle(Board b);
	public void updateBoardArticle(Board b);
	public void updateSameGroupSrtno(Board b);
}
