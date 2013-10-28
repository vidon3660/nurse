<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   
<%@ page import="java.net.InetAddress" %>
<%@ page import="nurse.board.vo.Board"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View</title>
<link rel="stylesheet" type="text/css" href="css/065.css" />

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function goToList(){
		document.location.href="board.do?method=list&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}";
	}
	function editUpArticle(){
		if($('input[name=email]').val().length==0){
			alert('Input data of email\t');
			$('input[name=email]').focus();
			return;
		}
		if($('input[name=subject]').val().length==0){
			alert('Input data of subject\t');
			$('input[name=subject]').focus();
			return;
		}
		if($('textarea[name=content]').val().length==0){
			alert('Input data of content\t');
			$('textarea[name=content]').focus();
			return;
		}
		if($('input[name=pass]').val().length==0){
			alert('Input data of password\t');
			$('input[name=pass]').focus();
			return;
		}
		$('form').submit();
	}
</script>
</head>
<%
	InetAddress inetAddress = InetAddress.getLocalHost();
	String ip = inetAddress.getHostName()+"/"+inetAddress.getHostAddress();
	request.setAttribute("ip",ip);
	Board board = (Board)request.getAttribute("board");
	request.setAttribute("content", board.getContent().replace("<br>","\r\n"));
%>
<body>
<center>
<h3><spring:message code="board.title"/></h3>
<form method="post" action="board.do?method=editup">
<input type="hidden" name="articlePerPage" value="${board.articlePerPage }">
<input type="hidden" name="currentPage" value="${board.currentPage }">
<input type="hidden" name="num" value="${board.num }">

<table border="1" width="600">
	<tr>
		<th width="100"><spring:message code="board.writer"/></th>
		<td width="500">${board.writer }</td>
	</tr>
	<tr>
		<th><spring:message code="board.email"/></th>
		<td><input type="text" name="email" size="60" value="${board.email }"></td>
	</tr>
	<tr>
		<th><spring:message code="board.subject"/></th>
		<td><input type="text" name="subject" size="60" value="${board.subject }"></td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td>
		<textarea name="content" rows="10" cols="60">${content }</textarea>
		</td>
	</tr>
	<tr>
		<th><spring:message code="board.pass"/></th>
		<td><input type="password" name="pass" size="4"></td>
	</tr>
	<tr>
		<th>ip</th>
		<td><input type="text" name="ip" size="20" value="${ip }" readonly></td>
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td align="center">
		<a href="javascript:editUpArticle();">
		<spring:message code="board.link.editup"/></a> / 
		<a href="javascript:goToList();">
		<spring:message code="board.link.list"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>