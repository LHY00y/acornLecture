<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR</title>
</head>
<body>
	<div style="padding:30px; margin:50px;">
	<p style="font-size:16pt">
		오류가 발생했습니다. <br>이용에 불편을 드려 죄송합니다.
	</p>
		<a href="${contextPath }/main.do"><button style="margin-top:30px;">메인페이지로 돌아가기</button></a>
	</div>
</body>
</html>