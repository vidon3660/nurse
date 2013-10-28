package nurse.board.vo;

import java.io.Serializable;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Board implements Serializable{
	
	private static final long serialVersionUID = 83319532764750467L;
	private String num;
	private String writer;
	private String email;
	private String subject;
	private String pass;
	private String readcount;
	private String ref; //사용 안 함
	private String step; //사용 안 함
	private String depth; //사용 안 함
	private String regdate;
	private String content;
	private String ip;
	
	private int start;
	private int end;
	private int currentPage; //pageNum
	private int totalCount; //count
	private int totalPage;
	private int pagePerBlock;
	private int articlePerPage; //default pageSize
	private int firstPage;
	private int lastPage;
	
	private DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private Date date = new Date();
	private String[] nowDateAry = dateFormat.format(date).split(" ");
	
	public Board(){}
	public Board(int pagePerBlock, int articlePerPage){
		this.pagePerBlock = pagePerBlock;
		this.articlePerPage = articlePerPage;
	}
	
	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public void setArticlePerPage(int articlePerPage) {
		this.articlePerPage = articlePerPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getTotalPage() {
		if (totalPage==0) {
			totalPage=1;
		}
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		if (currentPage==0) {
			currentPage=1;
		}
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getPagePerBlock() {
		if (pagePerBlock==0) {
			pagePerBlock=5;
		}
		return pagePerBlock;
	}
	public int getArticlePerPage() {
		if (articlePerPage==0) {
			articlePerPage=10;
		}
		return articlePerPage;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getReadcount() {
		return readcount;
	}
	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		
		String[] articleDateAry = regdate.split(" ");
		if (nowDateAry[0].trim().equals(articleDateAry[0].trim())) {
			//show time instead day
			this.regdate = articleDateAry[1];
		} else {
			this.regdate = articleDateAry[0];
		}
		
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		if (ip==null) {
			InetAddress inetAddress;
			try {
				inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				System.out.println(e.getMessage());
			}
			finally{
				ip="";
			}
		}
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	private String gno="0";
	private String ccnt="0"; //does not use
	private String srtno="1";
	private String gap="0";

	public String getGno() {
		if (gno==null) {
			gno="0";
		}
		return gno;
	}
	public void setGno(String gno) {
		this.gno = gno;
	}
	public String getCcnt() {
		if (ccnt==null) {
			ccnt="0";
		}
		return ccnt;
	}
	public void setCcnt(String ccnt) {
		this.ccnt = ccnt;
	}
	public String getSrtno() {
		if (srtno==null) {
			srtno="1";
		}
		return srtno;
	}
	public void setSrtno(String srtno) {
		this.srtno = srtno;
	}
	public String getGap() {
		if (gap==null) {
			gap="0";
		}
		return gap;
	}
	public void setGap(String gap) {
		this.gap = gap;
	}
	
	public static void main(String[] args){
		//TODO:되는 로직 구성
		String ip="";
		if (ip.equals("")) {
			InetAddress inetAddress;
			try {
				inetAddress = InetAddress.getLocalHost();
				ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
			} catch (UnknownHostException e) {
				System.out.println(e.getMessage());
			}
			finally{
				ip="";
			}
		}
		System.out.println("ip >> "+ip);
	}
	
}
