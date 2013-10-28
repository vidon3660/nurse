package nurse.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import nurse.board.service.BoardMaker;
import nurse.board.service.BoardService;
import nurse.board.vo.Board;

@Controller("myBoardController")
@RequestMapping("/board.do")
public class BoardController3 {
	
	@Autowired(required=false)
	private BoardService boardService;
	
	@Autowired(required=false)
	private BoardMaker boardMaker;
	
	@RequestMapping(params = "method=list")
	public String list(Board b, Model md) throws Exception{
		
		//return "board/index";
		//셀렉트박스 articlePerPage 값 변동 시 다시 설정해야 함
		Board board = boardMaker.makeBoard(boardService,b);
		md.addAttribute("board",board);
		
		List<Board> boardList = boardService.getBoardList(b);
		md.addAttribute("boardList", boardList);
		
		return "board/a01_list";
	}
	
	@RequestMapping(params = "method=write")
	public String write(Board b, Model md) throws Exception{
		//안 써도 다음 페이지에서 값을 부를 수 있는 상황에 정체는 무엇?
		md.addAttribute("board",b);
		
		return "board/a01_write";
	}
	
	@RequestMapping(params = "method=writeup")
	public String writeup(Board b, Model md) throws Exception{
		//TODO: 글자 수 제한
		//TODO: insert 시 리턴값을 boolean으로 변환하는 클래스 작성 필요!
		Boolean isInserted = boardService.insertArticle(b);

		//글 작성 후 목록 첫 페이지로 이동하여 글 등록을 확인 시켜 줌
		return "redirect:board.do?method=list&articlePerPage="+b.getArticlePerPage();
	}
	
	@RequestMapping(params = "method=view")
	public String view(Board b, Model md) throws Exception{
		
		Board board = boardService.getBoardArticle(b.getNum());
		board.setArticlePerPage(b.getArticlePerPage());
		board.setCurrentPage(b.getCurrentPage());
		
		md.addAttribute("board", board);
		
		return "board/a01_view";
	}
	
	@RequestMapping(params = "method=delete")
	public String delete(Board b, Model md) throws Exception{
		//TODO: 글 작성 암호가 일치하는 경우에만 삭제되도록..
		//TODO: 삭제가 됬는지 여부를 리턴받아 보여주도록..
		
		boardService.deleteBoardArticle(b);
		
		return "redirect:board.do?method=list&articlePerPage="+b.getArticlePerPage()+"&currentPage="+b.getCurrentPage();
	}
	
	@RequestMapping(params = "method=edit")
	public String edit(Board b, Model md) throws Exception{
		
		Board board = boardService.getBoardArticle(b.getNum());
		board.setArticlePerPage(b.getArticlePerPage());
		board.setCurrentPage(b.getCurrentPage());
		
		md.addAttribute("board", board);
		
		return "board/a01_edit";
	}
	
	@RequestMapping(params = "method=editup")
	public String editup(Board b, Model md) throws Exception{
		//TODO: 글자 수 제한
		//TODO: 글 작성 암호가 일치하는 경우에만 되도록..
		//TODO: 됬는지 여부를 리턴받아 보여주도록..
		
		boardService.updateBoardArticle(b);
		
		return "redirect:board.do?method=view&articlePerPage="+b.getArticlePerPage()+"&currentPage="+b.getCurrentPage()+"&num="+b.getNum();
	}
	
	@RequestMapping(params = "method=append")
	public String append(Board b, Model md) throws Exception{
		
		md.addAttribute("board", b);
		
		return "board/a01_append";
	}
	
	@RequestMapping(params = "method=appendup")
	public String appendup(Board b, Model md) throws Exception{
		//TODO: 글자 수 제한
		/*		
		 *   	Logic #2
		 *   	sno(num) 자동증가 seq 사용
		 *   	gap=parent gap+1
		 *   	gno=parent gno
		 *   	srtno=parent srtno+1
		 *   
		 *   	실쿼리문: update board set
		 *   	srtno=srtno+1
		 *   	where srtno>=this srtno
		 */
		System.out.println("111111111"+b.getNum());
		
		
		Board bd = boardService.getBoardArticle(b.getNum());
	
		b.setGap((Integer.parseInt(bd.getGap())+1)+"");
		b.setGno(bd.getGno());
		b.setSrtno((Integer.parseInt(bd.getSrtno())+1)+"");

		//------------------------------------------------------
		//TODO:transaction needed
		boardService.updateSameGroupSrtno(b);
		Boolean isInserted = boardService.insertArticlePlus(b);
		//------------------------------------------------------
		
		return "redirect:board.do?method=list&articlePerPage="+b.getArticlePerPage()+"&currentPage="+b.getCurrentPage();
	}
}
