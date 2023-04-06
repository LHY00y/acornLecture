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
<title>게시글 작성</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	function backToList(obj){
		obj.action = "${contextPath}/board/board.do";
		obj.submit();
	}
	let cnt = 1;
	function fn_addFile(){
		$("#d_file").append("<br>" + "<input type='file' name='file"+cnt+"'>");
		cnt++;
	}
</script>
</head>
<body>
	<h1 style="text-align: center;">새 글 쓰기</h1>
	<form name="articleForm" method="post" action="${contextPath }/board/addNewArticle.do"
		enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right">작성자</td>
				<td colspan="2" align="left">
				<input type="hidden" name="lecture_id" value="1">
				<input type="text" size="20" maxlength="100" name="name" value="${member.member_name }" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right">글제목</td>
				<td colspan="2"><input type="text" size="67" maxlength="500" name="title"></td>
			</tr>
			<tr>
				<td align="right" valign="top">글내용</td>
				<td colspan="2"><textarea name="content" rows="10" cols="69" maxlength="4000"></textarea></td>
			</tr>
			<tr>
				<td align="right">이미지파일 첨부</td>
				<td align="left"><input type="button" value="파일추가" onclick="fn_addFile()"></td>
			</tr>
			<tr>
				<td colspan="4"><div id="d_file"></div></td>
			</tr>
			<tr>
				<td align="right"></td>
				<td colspan="2">
					<input type="submit" value="글쓰기">
					<input type="button" value="목록보기" onclick="backToList(this.form)">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>