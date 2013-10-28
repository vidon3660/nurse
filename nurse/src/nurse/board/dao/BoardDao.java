package nurse.board.dao;

import java.util.ArrayList;

import nurse.board.vo.Board;

public interface BoardDao {
	
	public ArrayList<Board> getBoardList(Board b);
	public void insertArticle(Board b); //새 글 입력
	public void insertArticlePlus(Board b); //덧 글 입력
	public Board getBoardArticle(String num);
	public int getBoardCount();
	public void plusArticleCount(String num); //조회 수 증가
	public void deleteBoardArticle(Board b);
	public void updateBoardArticle(Board b);
	public void updateSameGroupSrtno(Board b); //덧 글 입력 시 정렬번호 수정
	
}
