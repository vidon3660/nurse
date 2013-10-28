package nurse.board.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service("pagingManager")
public class PagingManager {

	private static final PagingManager pagingManager = new PagingManager();
	private static final Logger logger = LoggerFactory.getLogger(PagingManager.class);
	
	public static PagingManager getInstance(){
		return pagingManager;
	}
	
	public int getTotalPage(int totalCount, int articlePerPage){
		logger.info("+++ PagingManager.getTotalPage() called!");

		int totalPage = 0;
		if (totalCount==0) {
			return totalPage;
		}
		int oneMorePage = 0;
		if (totalCount%articlePerPage!=0) {
			oneMorePage = 1;
		}
		totalPage = (totalCount/articlePerPage)+oneMorePage;
		return totalPage;
	}
	
	public int getCurrentBlock(int currentPage, int pagePerBlock){
		logger.info("+++ PagingManager.getCurrentBlock() called!");
		
		int oneMoreBlock = 0;
		if (currentPage==0) {
			currentPage=1;
		}
		if (currentPage%pagePerBlock!=0) {
			oneMoreBlock = 1;
		}
		int currentBlock = (currentPage/pagePerBlock)+oneMoreBlock;
		return currentBlock;
	}
	
	public int getFirstPageInBlock(int totalPage, int currentPage, int pagePerBlock){
		logger.info("+++ PagingManager.getFirstPageInBlock() called!");
		
		if (totalPage>0) {
			if (currentPage==0) {
				currentPage=1;
			}
			return (currentPage-1)/pagePerBlock*pagePerBlock+1;
		}
		return 0;
	}
	
	public int getLastPageInBlock(int totalPage, int currentPage, int pagePerBlock){
		logger.info("+++ PagingManager.getLastPageInBlock() called!");
		
		int lastPage = 1;
		if (totalPage>0) {
			lastPage = getFirstPageInBlock(totalPage, currentPage, pagePerBlock)+(pagePerBlock-1);
			if (lastPage > totalPage) {
				lastPage = totalPage;
			}
			return lastPage;
		}
		
		return lastPage;
	}
	
	public int getFirstArticleInPage(int currentPage, int articlePerPage){
		logger.info("+++ PagingManager.getFirstArticleInPage() called!");
		if (currentPage==0) {
			currentPage=1;
		}
		return ((currentPage-1)*articlePerPage+1);
	}
	
	public int getLastArticleInPage(int currentPage, int articlePerPage){
		logger.info("+++ PagingManager.getLastArticleInPage() called!");
		if (currentPage==0) {
			currentPage=1;
		}
		return currentPage*articlePerPage;
	}
}
