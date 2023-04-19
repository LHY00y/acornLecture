<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영상 시청</title>
</head>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mainStyle.css">
<body>
	<div style=" margin-left:6%; ">
		<h3>${mv.mvTitle }</h3>
		<hr>
		<br>
		<div style="min-width:700px; width:70%; text-align:center; margin:auto;">
			<video style="min-width:700px; width:100%; margin:auto; " 
				src="${contextPath }/mvdownload.do?mvFileName=${mv.mvFileName }&lecture_id=${mv.lecture_id }" type="mp4" controls="controls">영상에 문제가 있습니다.</video>
			<br><br>
			<button class="acornBtn" style="float:left; padding:5px 20px;">이전 영상</button>
			<button class="acornBtn" style="float:right; padding:5px 20px;">다음 영상</button>
		</div>
		
	</div>
	
</body>
</html>