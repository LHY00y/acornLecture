<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 업로드</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function cancel(obj){
		obj.action = "${contextPath}/main.do";
		obj.submit();
	}
	
	
	
	
</script>
</head>
<body>
	<form name="lectureForm" method="post" action="${contextPath }/lecture/addNewMovie.do"
		enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right">작성자</td>
				<td align="left">
					<input type="text" size="15" maxlength="100" name="name" value="${member.member_name }" readonly="readonly">
					<input type="hidden" value="${param.lecture_id }" name="lecture_id" autofocus="autofocus">
				</td>
			</tr>
			<tr>
				<td align="right">회차 제목</td>
				<td colspan="4"><input type="text" id="title" size="67" maxlength="500" name="title" required="required"></td>
			</tr>
			<tr>
				<td align="right">강의 영상 첨부</td>
				<td align="left"><input type='file' name='file'></td>
			</tr>
			<tr>
				<td colspan="4"><div id="d_file"></div></td>
			</tr>
			<tr style="height:100px; align:bottom;">
				<td></td>
				<td colspan="2">
					<input class="btn acornBtn" type="submit" value="강의업로드" style="">
					<input class="btn acornBtn" type="button" value="취소" onclick="cancel(this.form)">
				</td>
			</tr>
		</table>
	</form>		