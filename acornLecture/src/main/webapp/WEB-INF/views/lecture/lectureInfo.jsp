<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="id" value="${ param.id }" />
<c:set var="reviewList" value="${ reviewList }" scope="request" />
<c:set var="noticeList" value="${ noticeList }" scope="request" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${ contextPath }/resources/css/lectureStyle.css">
<title>강의 정보</title>
</head>
<body>

	<!--  
		공지, 후기 include 시 해당 강의 정보만 불러오기
		메인 후기 include
	-->
	<div id="tableContainer">
		<table id="lecInfoTable">
			<tr class="lecInfoTr">
				<td id="lecTitle">${ lecture.lecture_title }</td>
				<td rowspan="2" align="right"><c:choose>
						<c:when test="${ isLogOn == true && member != null }">
							<c:choose>
								<c:when test="${member.grade eq '강사' }">
									<button id="lecBtn" onclick="location.href='${ contextPath }/board/articleForm.do?lecture_id=${ lecture.lecture_id }'" <c:if test="${member.member_id ne lecture.professor_id }">disabled="disabled"</c:if>>공지 작성</button>
								</c:when>
								<c:when test="${ isMine == true }">
									<button id="lecBtn" 
											onclick="location.href='${ contextPath }/board/articleForm.do?lecture_id=${ lecture.lecture_id }'">후기 작성</button>
								</c:when>
								<c:when test="${dto.stuCount eq lecture.count }">
									<button id="lecBtn"
											disabled="disabled">인원 마감</button>
								</c:when>
								<c:otherwise>
									<button id="lecBtn" 
											onclick="location.href='enrol.do?lecture_id=${ lecture.lecture_id }&member_id=${ member.member_id }'">수강 신청</button>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<button id="lecBtn" 
									onclick="location.href='${contextPath}/member/loginForm.do'; alert('로그인 후 이용해 주세요.');">수강 신청</button>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr class="lecInfoTr">
				<td>${ lecture.lecture_content }</td>
			</tr>
		</table>
	</div>

	<hr>
	<div id="noticeContainer">
		<h4>공지</h4>
		<jsp:include page="../board/board.jsp">
			<jsp:param name="isReview" value="false" />
			<jsp:param name="isMain" value="false" />
		</jsp:include>
	</div>
	
	<hr>
	<div id="reviewContainer">
		<h4>후기</h4>
		<jsp:include page="../board/board.jsp">
			<jsp:param name="isReview" value="true" />
			<jsp:param name="isMain" value="false" />
		</jsp:include>	
	</div>
	
</body>
</html>