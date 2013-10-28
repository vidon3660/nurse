<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>   

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
	function deleteArticle(no){
		if(confirm("Do you really want to delete?\t")){
			var pass = prompt("Password and Enter: ");
			if(pass.length<=0){
				alert("Password needed!\t");
				return;
			}
			if(pass=='${board.pass}'){
				document.location.href="board.do?method=delete&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&num="+no+"&pass="+pass+"";	
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}
	function editArticle(no){
		if(confirm("Do you want to update?\t")){
			var pass = prompt("Password and Enter: ");
			if(pass.length<=0){
				alert("Password needed!\t");
				return;
			}
			if(pass=='${board.pass}'){
				document.location.href="board.do?method=edit&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&num="+no+"&pass="+pass+"";	
			} else {
				alert("Password doesn't match!\t");
			}
		}
	}
	function appendArticle(no){
		
		document.location.href="board.do?method=append&articlePerPage=${board.articlePerPage}&currentPage=${board.currentPage}&num="+no+"";	
	}
</script>
</head>
<body>
<center>
<h3><spring:message code="board.title"/></h3>
<table border="1" width="600">
	<tr>
		<th width="100"><spring:message code="board.writer"/></th>
		<td width="500">${board.writer }</td>
	</tr>
	<tr>
		<th><spring:message code="board.email"/></th>
		<td>${board.email }</td>
	</tr>
	<tr>
		<th><spring:message code="board.subject"/></th>
		<td>${board.subject }</td>
	</tr>
	<tr>
		<th><spring:message code="board.content"/></th>
		<td>
		<br>
		${board.content }
		<br><br>
		</td>
	</tr>
	<tr>
		<th><spring:message code="board.pass"/></th>
		<td>*********</td>
	</tr>
	<tr>
		<th>ip</th>
		<td>${board.ip }</td>
	</tr>
</table>
<table border="1" width="600">
	<tr>
		<td align="center">
		<a href="javascript:appendArticle('${board.num }');">
		<spring:message code="board.link.append"/></a> / 
		<a href="javascript:deleteArticle('${board.num }');">
		<spring:message code="board.link.delete"/></a> / 
		<a href="javascript:editArticle('${board.num }');">
		<spring:message code="board.link.edit"/></a> / 
		<a href="javascript:goToList();">
		<spring:message code="board.link.list"/></a>
		</td>
	</tr>
</table>
</center>
</body>
</html>