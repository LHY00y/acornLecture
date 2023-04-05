<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>

<div>
	<div id="mainLogoContainer">
		<a id="mainLogo" href="${ contextPath }/main.do">홍 선생</a>
	</div>	
	<div id="loginContainer">
		<c:choose>
			<c:when test="${isLogOn == true && member != null }">	
				<a class="link" href="${ contextPath }/member/logout.do">로그아웃</a>
				<a class="link" href="${ contextPath }/member/myPage.do">마이 페이지</a>
			</c:when>
			<c:otherwise>
				<a class="link" href="${ contextPath }/member/loginForm.do" >로그인</a>
				<a class="link" href="${ contextPath }/member/memberTypeForm.do">회원 가입</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div id="menuContainer">
	<a class="link" href="${contextPath }/lecture/listLectures.do">강의 목록</a>
	<a class="link" href="#">후기 목록</a>
</div>