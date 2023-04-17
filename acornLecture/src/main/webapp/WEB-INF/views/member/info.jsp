<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학원 정보</title>
</head>
<body>
	<div class="p-5 mb-4 bg-light rounded-3" style="width: 100%">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">홍선생 홈페이지에 오신 것을 환영합니다!</h1>
			<p class="col-md-8 fs-4" id="infoText">
				홍선생 홈페이지는 학생들이 원하는 과목에 대한 인강 선생님을 추천해주는 홈페이지입니다.<br> 강의는 수준 높은
				내용과 풍부한 경험을 가진 선생님들이 제작한 것으로, <br>학생들의 능력과 수준에 맞게 구성되어 있습니다.
			</p>
		</div>
	</div>
	<div class="row align-items-md-stretch">
		<div class="col-md-6">
			<!-- * 카카오맵 - 지도퍼가기 -->
			<!-- 1. 지도 노드 -->
			<div id="daumRoughmapContainer1681708887933"
				class="root_daum_roughmap root_daum_roughmap_landing"></div>
				
			<script charset="UTF-8" class="daum_roughmap_loader_script"
				src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				
			<script charset="UTF-8">
				new daum.roughmap.Lander({
					"timestamp" : "1681708887933",
					"key" : "2egio",
					"mapWidth" : "640",
					"mapHeight" : "360"
				}).render();
			</script>
		</div>
		<div class="col-md-6">
			<div class="h-100 p-5 bg-light border rounded-3">
				<h2>PROD.</h2>
				<p>이하영<br>노현경<br>정주영<br>전대웅<br>전상우<br>조건희<br>조혜란</p>
			</div>
		</div>
	</div>
</body>
</html>