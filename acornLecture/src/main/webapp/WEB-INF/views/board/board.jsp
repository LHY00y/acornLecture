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
<title>게시판</title>
<script>
	
</script>
</head>
<body>
	<table align="center">
		<tr align="center" bgcolor="#9DC0DF">
			<th>번호</th>
			<th style="width:50%;">제목</th>
			<th>작성자</th>
			<th>강의명</th>
			<th>작성일</th>
		</tr>
		<c:set var="index" value="0"/>
		<c:choose>
			<c:when test="${ empty param.isReview }">
				<c:set var="boardList" value="${ boardList }" />
			</c:when>
			<c:when test="${ param.isReview eq 'true' }">
				<c:set var="boardList" value="${ reviewList }" />
			</c:when>
			<c:otherwise>
				<c:set var="boardList" value="${ noticeList }" />
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${ param.isMain eq 'false' }">			
				<c:forEach var="board" items="${boardList}">
					<c:if test="${ board.lecture_id eq param.id }">
						<tr align="center">
							<td>${index=index+1 }</td>
							<td><a href="${contextPath }/board/boardPage.do?board_id=${board.board_id}">${board.board_title }</a></td>
							<td style="font-size:9pt; color:grey;">${board.member_name }</td> 
							<td style="font-size:10pt; color:grey;">[${board.lecture_title }]</td> 
			 				<td>${board.write_date }</td>
						</tr>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="board" items="${boardList}">
					<tr align="center">
						<td>${index=index+1 }</td>
						<td><a href="${contextPath }/board/boardPage.do?board_id=${board.board_id}">${board.board_title }</a></td>
						<td style="font-size:9pt; color:grey;">${board.member_name }</td> 
						<td style="font-size:10pt; color:grey;">[${board.lecture_title }]</td> 
		 				<td>${board.write_date }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>