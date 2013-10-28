<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><spring:message code="board.title"/></title>
<link rel="stylesheet" type="text/css" href="css/065.css" />

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('select[name=articlePerPage]').val('${board.articlePerPage}');
		$('select[name=articlePerPage]').change(function(){
			var app = $('select[name=articlePerPage]').val();
			document.location.href='<c:url value="board.do?method=list&articlePerPage='+app+'"/>';
		});
	});
	function pageMove(pno){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="board.do?method=list&articlePerPage="+app+"&currentPage="+pno;
	}
	function viewArticle(pno,no){
		var app = $('select[name=articlePerPage]').val();
		document.location.href="board.do?method=view&articlePerPage="+app+"&currentPage="+pno+"&num="+no;
	}
</script>
</head>

<body>
<center>
<h3><spring:message code="board.title"/></h3>
<form method="post">
<table border="0" width="600">
	<tr>
		<td width="50%" align="left">
		Articles per page: 
		<select name="articlePerPage">
			<option value="3">3</option>
			<option value="5">5</option>
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="40">40</option>
		</select>
		</td>
		<td width="50%" align="right">Page <c:out value="${board.currentPage }"/> of <c:out value="${board.totalPage }"/></td>
	</tr>
</table>

<table cellspacing="1" border="1" width="600">
	<tr>
		<th width="50"><spring:message code="board.num"/></th>
		<th width="350"><spring:message code="board.subject"/></th>
		<th width="50"><spring:message code="board.writer"/></th>
		<th width="100"><spring:message code="board.regdate"/></th>
		<th width="50"><spring:message code="board.readcount"/></th>
	</tr>
	<c:if test="${board.totalCount==0 }">
	<tr>
		<td colspan="5" align="center">게시글이 없습니다.</td>
	</tr>
	</c:if>
	<c:forEach var="bd" items="${boardList }">
	<tr>
		<td>${bd.num }</td>
		<td>
		<c:forEach begin="1" end="${bd.gap }" step="1" varStatus="s">
			<c:if test="${s.first }">'</c:if>ㅡ
		</c:forEach>
		<a href="javascript:viewArticle('${board.currentPage }','${bd.num }');">
		${bd.subject }</a>
		</td>
		<td>${bd.writer }</td>
		<td>${bd.regdate }</td>
		<td>${bd.readcount }</td>
	</tr>
	</c:forEach>
	
</table>
<table border="0" width="600">
	<tr>
		<td align="center">
		<c:if test="${board.totalCount==0 }">
			페이징 정보가 없습니다.
		</c:if>
		<c:if test="${board.totalCount>0 }">
		<c:if test="${board.firstPage > board.pagePerBlock }">
			[<a href="board.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=1">처음</a>] 
			<a href='<c:url value="board.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.firstPage-1 }"/>'>
			<spring:message code="board.prev"/></a>
		</c:if>
		<c:forEach var="pno" begin="${board.firstPage }" end="${board.lastPage }">
			[
			<c:if test="${pno!=board.currentPage }"><a href="javascript:pageMove('${pno }');"></c:if>
			<c:if test="${pno==board.currentPage }"><b></c:if>
			${pno }
			<c:if test="${pno!=board.currentPage }"></a></c:if>
			<c:if test="${pno==board.currentPage }"></b></c:if>
			]
		</c:forEach>
		<c:if test="${board.lastPage < board.totalPage }">
			<a href='<c:url value="board.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.lastPage+1 }"/>'>
			<spring:message code="board.next"/></a>
		</c:if>
		</c:if>
		</td>
	</tr>
</table>
<table cellspacing="0" border="0" width="600">
	<tr>
		<td align="right">
		<a href="board.do?method=write&articlePerPage=${board.articlePerPage }&currentPage=${board.currentPage}">
		<spring:message code="board.link.write"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>