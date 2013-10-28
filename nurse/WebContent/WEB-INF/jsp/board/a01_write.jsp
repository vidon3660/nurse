<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>     
<%@ page import="java.net.InetAddress" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write</title>
<link rel="stylesheet" type="text/css" href="css/065.css" />

<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function writeup(){
		if($('input[name=writer]').val().length==0){
			alert('Input data of writer\t');
			$('input[name=writer]').focus();
			return;
		}
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
%>
<body>
<center>
<h3><spring:message code="board.title"/></h3>
<form method="post" action="board.do?method=writeup">
<input type="hidden" name="articlePerPage" value="${board.articlePerPage }">
<!-- <input type="hidden" name="currentPage" value="${board.currentPage }"> 새글 작성 시 첫 페이지 상단에 보여야 하니 현재 페이지 값을 넘겨 줄 필요가 없다.-->
<input type="hidden" name="readcount" value="0">
<input type="hidden" name="ref" value="0">
<input type="hidden" name="step" value="0">
<input type="hidden" name="depth" value="0">

<table border="1" width="600">
	<tr>
		<td colspan="2" align="right">
		<a href="board.do?method=list&articlePerPage=${board.articlePerPage }&currentPage=${board.currentPage}">
		<spring:message code="board.link.list"/></a>
		</td>
	</tr>
	<tr>
		<th><spring:message code="board.writer"/></th>
		<td><input type="text" name="writer" size="10"></td>
	</tr>
	<tr>
		<th><spring:message code="board.email"/></th>
		<td><input type="text" name="email" size="60"></td>
	</tr>
	<tr>
		<th><spring:message code="board.subject"/></th>
		<td><input type="text" name="subject" size="60"></td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td><textarea name="content" rows="10" cols="60"></textarea></td>
	</tr>
	<tr>
		<th><spring:message code="board.pass"/></th>
		<td><input type="password" name="pass" size="4"></td>
	</tr>
	<tr>
		<th>ip</th>
		<td><input type="text" name="ip" size="20" value="${ip }" readonly></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<a href="javascript:writeup();">
		<spring:message code="board.link.confirm"/></a>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>