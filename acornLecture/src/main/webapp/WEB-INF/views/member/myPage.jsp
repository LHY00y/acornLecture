<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%-- <c:set var="lectureList" value="${memberService..selectLectureList(member_id) }" /> --%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<form method="get" name="joinForm">
		<table align="center">
		 <c:choose>
	        <c:when test="${member.grade}=='강사'">
	        	<c:forEach var="lectureList" items="${lectureList }">
	        		asd
	        	</c:forEach>
	        </c:when>
	        <c:when test="${member.grade }=='학생'">
	        	<c:forEach var="item" items="${lectureList }">
	        		<h1>${item.lecture_title }</h1>
	        	</c:forEach>
	        </c:when>
        </c:choose>
			<tr>
				<h1>${member.grade }</h1>
			</tr>
			<tr>
				<input id="confirm" type="button" value="회원 정보 수정" onClick="location.href='modMemberForm.do'">
			</tr>
		</table>
	</form>
</body>
</html>