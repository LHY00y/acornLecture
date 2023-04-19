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
<title>영상 목록</title>
<script>
	
</script>
</head>
<body>
	<table align="center">
		<tr align="center" bgcolor="#9DC0DF">
			<th>번호</th>
			<th style="width:50%;">제목</th>
			<th>작성일</th>
		</tr>
		<c:set var="index" value="0"/>
		<c:choose>
			<c:when test="${ empty mvList }">	
				<tr align="center">
					<td id="noneDataTd" colspan="5">작성된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="mv" items="${mvList}">
					<tr align="center">
						<td>${index=index+1 }</td>
						<td><a href="${contextPath }/lecture/showMv.do?id=${mv.lecture_id}&mvFileNo=${mv.mvFileNo}">${mv.mvTitle}</a></td>
						<td style="font-size:9pt; color:grey;">${mv.regDate }</td> 
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>