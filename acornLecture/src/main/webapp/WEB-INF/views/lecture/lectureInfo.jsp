<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="id" value="${ param.id }" />
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
			추가 구현해야 할 기능: 후기 작성 링킹, 
			수강 신청 시 로그인 상태 아닐 경우 alert,  
			수강 신청 시 데이터베이스 접근
		-->
		<div id="tableContainer">
			<table id="lecInfoTable">
				<tr class="lecInfoTr">
					<td id="lecTitle">${ lecture.lecture_title }</td>
					<td rowspan="2" align="right"><c:choose>
							<c:when test="${ isLogOn == true && member != null }">
								<c:choose>
									<c:when test="${ isMine == true }">
										<button id="lecBtn">후기 작성</button>
									</c:when>
									<c:when test="${dto.stuCount eq lecture.count }">
										<button id="lecBtn"
											disabled="disabled">인원 마감</button>
									</c:when>
									<c:otherwise>
										<button id="lecBtn" onclick="location.href='enrol.do?lecture_id=${lecture.lecture_id}&member_id=${member.member_id }'">수강
											신청</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button id="lecBtn" onclick="location.href='${contextPath}/member/loginForm.do'; alert('로그인이 되어있지 않습니다.');">로그인</button>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr class="lecInfoTr">
					<td>${ lecture.lecture_content }</td>
				</tr>
			</table>
		</div>
	
		<hr>
	
		<jsp:include page="../board/board.jsp"></jsp:include>
</body>
</html>