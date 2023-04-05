<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div id="ctBtnContainer">
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=백엔드'">백엔드</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=프론트엔드'">프론트엔드</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=모바일'">모바일</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=인공지능'">인공지능</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=기타'">기타</button>
</div>

<hr>


<div id="reviewContainer">
	<jsp:include page="lecture/board.jsp"></jsp:include>
</div>