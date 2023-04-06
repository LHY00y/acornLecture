<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/lectureStyle.css">
<title>전체 게시판</title>
<script>
	
</script>
</head>
<body>
	<table align="center">
	
		<tr align="center" bgcolor="#9DC0DF">
			<th>번호</th>
			<th>구분</th>
			<th>제목</th>
			<th>작성자</th>
			<th>강의명</th>
			<th>작성일</th>
		</tr>
		
		<c:set var="index" value="0"/>
		<c:forEach var="board" items="${boardList}">
			<tr align="center">
				<td>${index=index+1 }</td>
				<td style="color:grey;">[${board.category}]</td>
				<td><a href="${contextPath }/lecture/boardPage.do?board_id=${board.board_id}">${board.board_title }</a></td>
				<td>${board.member_name }</td> 
				<td>${board.lecture_title }</td> 
 				<td>${board.write_date }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>