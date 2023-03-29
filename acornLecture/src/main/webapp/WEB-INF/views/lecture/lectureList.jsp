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
<title>전체 강의 리스트</title>
</head>
<body>
	<div>
		카데고리 검색창
		<form>
		<input type="text" width="60%" name="search"> <input type="submit" value="검색">
		</form>
	</div>
	<div>
		<ul>
		
		<li> </li>
		</ul>
	</div>
</body>
</html>