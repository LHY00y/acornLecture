<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- 현재 링크 매핑 X -->
<div>
	<div id="mainLogoContainer">
		<a id="mainLogo" href="${ contextPath }/main.do">AcornLecture</a>
	</div>	
	<div id="loginContainer">
		<a class="link" href="${ contextPath }/member/loginForm.do" >로그인</a>
		<a class="link" href="${ contextPath }/member/memberForm.do">회원 가입</a>
	</div>
</div>

<div id="menuContainer">
	<a class="link" href="#">강의 목록</a>
	<a class="link" href="#">후기 목록</a>
</div>


<!-- 세션으로 로그인 기능 구현 예정
<div id="loginContainer">
	<c:choose>
		<c:when test="${ session.loggedIn eq true }">
			<a class="link" href="${contextPath }/member/loginForm.do" >로그인</a>
			<a class="link" href="${contextPath }/member/memberForm.do">회원 가입</a>
		</c:when>
		<c:otherwise>
			<a href="#">로그아웃</a>
			<a href="#">마이 페이지</a>
		</c:otherwise>
	</c:choose>
</div>
-->