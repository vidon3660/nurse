package nurse.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nurse.board.vo.Board;

@Service("boardMaker")
public class BoardMaker {

	@Autowired(required=false)
	private PagingManager pagingManager;
	
	public Board makeBoard(BoardService boardService, Board b){
		//전체 글 수 구하기
		int totalCount = boardService.getBoardCount();
		b.setTotalCount(totalCount);
		
		//현재 페이지 구하기
		int currentPage = b.getCurrentPage()==0 ? 1 : b.getCurrentPage();
		b.setCurrentPage(currentPage);
		
		//페이지 당 표시 글 수
		int articlePerPage = b.getArticlePerPage();
		if (articlePerPage==0) {
			articlePerPage=10;
		}
		
		//검색쿼리 범위 값 설정
		//주의: boardList 조회쿼리 검색조건 > start 와 end 사용 > 따라서, 값이 없으면 boardList 값을 구할 수 없음
		b.setStart(pagingManager.getFirstArticleInPage(currentPage, articlePerPage));
		b.setEnd(pagingManager.getLastArticleInPage(currentPage, articlePerPage));
		
		//전체페이지 수 구하기
		int totalPage = pagingManager.getTotalPage(totalCount, articlePerPage);
		b.setTotalPage(totalPage);
		
		//블럭 당 표시 페이지 수, 시작 페이지, 끝 페이지 구하기
		int pagePerBlock = b.getPagePerBlock();
		b.setFirstPage(pagingManager.getFirstPageInBlock(totalPage, currentPage, pagePerBlock));
		b.setLastPage(pagingManager.getLastPageInBlock(totalPage, currentPage, pagePerBlock));
		
		return b;
	}
}
