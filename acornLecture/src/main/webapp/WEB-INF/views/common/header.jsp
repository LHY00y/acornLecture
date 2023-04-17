<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<div class="container col">
  <div class="row justify-content-md-center align-items-center">
    <header class="d-flex flex-wrap justify-content-between py-2 mb-4 border-bottom">
      <div class="col-sm-1">
        <a id="mainLogo" href="${ contextPath }/main.do">홍 선생</a>
      </div>
      <form action="${contextPath }/lecture/search.do" method="GET" class="col-sm-4">
        <div class="input-group">
          <input type="text" class="form-control" style="width:200px;" name="keyword" value="${keyword}" placeholder="강의를 검색해 보세요" style="font-size: 14px;"/>
          <input type="submit" class="btn btn-lg acornBtn" style="font-size: 14px;" value="강의 검색"/>
        </div>
      </form>
      <ul class="nav col-sm-3 col-md-auto justify-content-center mb-md-0">
        <li><a href="${ contextPath }/lecture/listLectures.do" class="nav-link px-2" style="color:#9DC0DF; font-size: 14px;">강의 목록</a></li>
        <li><a href="${ contextPath }/board/review.do" class="nav-link px-2" style="color:#9DC0DF; font-size: 14px;">후기 목록</a></li>
        <li><a href="${ contextPath }/board/notice.do" class="nav-link px-2" style="color:#9DC0DF; font-size: 14px;">공지 목록</a></li>
        <li><a href="${ contextPath }/member/info.do" class="nav-link px-2" style="color:#9DC0DF; font-size: 14px;">about</a></li>
      </ul>
      <div class="col-sm-3 text-end align-self-center">
        <c:choose>
          <c:when test="${isLogOn == true && member != null }"> 
            <input type="button" class="btn acornbtn-outline me-2" style="font-size: 14px;" value="로그아웃" onclick="location.href='/acornLecture/member/logout.do'"/>
            <input type="button" class="btn acornBtn" style="font-size: 14px;" value="마이 페이지" onclick="location.href='/acornLecture/member/myPage.do'"/>
          </c:when>
          <c:otherwise>
            <input type="button" class="btn acornbtn-outline me-2" style="font-size: 14px;" value="로그인" onclick="location.href='/acornLecture/member/loginForm.do'"/>
            <input type="button" class="btn acornBtn" style="font-size: 14px;" value="회원 가입" onclick="location.href='/acornLecture/member/memberTypeForm.do'"/>
          </c:otherwise>
        </c:choose>
      </div>
    </header>
  </div>
</div>

<%-- 	<div id="menuContainer" style="background-color: #9DC0DF;">
			<a class="link" href="${ contextPath }/lecture/listLectures.do">강의
				목록</a> <a class="link" href="${ contextPath }/board/review.do">후기 목록</a>
			<a class="link" href="${ contextPath }/board/notice.do">공지 목록</a>
	</div> --%>
