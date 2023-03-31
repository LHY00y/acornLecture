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
<title>전체 강의 리스트</title>
</head>
<body>
		<!-- onclick 만들기 -->
		<select name="category" style="height:25px;">
			<option selected>전체</option>
			<c:forEach var="cate" items="${categories }">
				<option value="${cate }">${cate }</option>
			</c:forEach>				
		</select>
		<form action="${contextPath }/lecture/search.do" method="GET" style="padding-left:20px; display:inline;">
			<input type="text" name="keyword" style="width:55%; height:20px;">
			<input type="submit" value="검색" style="width:50px; height:29px; margin:5px;"/>	
		</form>
		<table align="center">
		
		<tr align="center" bgcolor="#9DC0DF">
			<th><b>번호</b></th>
			<th><b>카데고리 <br>
			</b></th>
			<th><b>강의명</b></th>
			<th><b>강사</b></th>
			<th><b>요일</b></th>
			<th><b>정원</b></th>
		</tr>
		
		<c:set var="index" value="0"/>
		<c:forEach var="lecture" items="${lecturesList}">
			<tr align="center">
				<td>${index=index+1 }</td>
				<td>${lecture.category }</td>
				<td><a href="#">${lecture.lecture_title }</a></td>
				<td>${lecture.professor_name }</td> 
 				<td>${lecture.schedule }</td>
 				<td>${lecture.count }</td>
			</tr>
		</c:forEach>
		
	</table>
</body>
</html>