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
<title>회원 정보</title>
<style>
	a:link{
		color:black;
	}
	a:hover{
		color:blue;
	}
	a:active{
		color:darkblue;
	}
</style>
</head>
<body>
	<form method="get" name="joinForm">
		<table align="center">
			<c:choose>
				<c:when test="${member.grade == '강사'}">
					<c:forEach var="item" items="${lectureList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td><a href="${ contextPath }/lecture/info.do?id=${item.lecture_id}">${item.lecture_title}</a>&nbsp;
							<input id="confirm" type="button"
								value="강의 수정" onClick="location.href='modLecture.do'">
							</td>
						<tr>
					</c:forEach>
				</c:when>
				<c:when test="${member.grade == '학생'}">
					<c:forEach var="item" items="${lectureList }" varStatus="status">
						<tr>
							<td>${status.count }</td>
							<td>${item}&nbsp;<input id="confirm" type="button"
								value="수강 취소" onClick="location.href='droplecture.do'">
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
			<tr></tr>
			<tr>
				<td></td>
				<td><input id="confirm" type="button" value="회원 정보 수정"
					onClick="location.href='modMemberForm.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>