<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="b-example-divider"></div>

<div class="container">
	<header
		class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
		<div>
			<a id="mainLogo" href="${ contextPath }/main.do">홍 선생</a>
		</div>

		<ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
			<li><a href="#" class="nav-link px-2 link-secondary">Home</a></li>
			<li><a href="#" class="nav-link px-2" style="color:#9DC0DF">Features</a></li>
			<li><a href="#" class="nav-link px-2" style="color:#9DC0DF">Pricing</a></li>
			<li><a href="#" class="nav-link px-2" style="color:#9DC0DF">FAQs</a></li>
			<li><a href="#" class="nav-link px-2" style="color:#9DC0DF">About</a></li>
		</ul>
        
        <!-- 신버전 헤더 -->
		<div class="col-md-3 text-end">
		<c:choose>
			<c:when test="${isLogOn == true && member != null }">	
				<input type="button" class="btn acornbtn-outline me-2" value="로그아웃" onclick="location.href='/acornLecture/member/logout.do'"/>
				<input type="button" class="btn acornBtn" value="마이 페이지" onclick="location.href='/acornLecture/member/myPage.do'"/>
			</c:when>
			<c:otherwise>
				<input type="button" class="btn acornbtn-outline me-2" value="로그인" onclick="location.href='/acornLecture/member/loginForm.do'"/>
				<input type="button" class="btn acornBtn" value="회원 가입" onclick="location.href='/acornLecture/member/memberTypeForm.do'"/>
			</c:otherwise>
		</c:choose>
		</div>
		</header>
	
		<div id="menuContainer" style="background-color: #9DC0DF;">
			<a class="link" href="${ contextPath }/lecture/listLectures.do">강의
				목록</a> <a class="link" href="${ contextPath }/board/review.do">후기 목록</a>
			<a class="link" href="${ contextPath }/board/notice.do">공지 목록</a>
		</div>