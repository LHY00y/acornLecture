<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="imageFileList" value="${articleMap.imageFileList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글보기</title>
<style>
	#tr_btn_modify {
		display:none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function backToList(obj){
		obj.action="${contextPath}/board/board.do";
		obj.submit();
	}
	
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_content").disabled=false;
		imageFileName = document.getElementById("i_imageFileName");
		if(imageFileName != null && imageFileName.length != 0){
			document.getElementById("i_imageFileName").disabled=false;
		}
		document.getElementById("tr_btn_modify").style.display="block";
		document.getElementById("tr_btn").style.display="none";
	}
	
	function fn_modify_article(obj){
		obj.action = "${contextPath}/board/modArticle.do";
		obj.method= "post";
		obj.submit();
	}
	
	function fn_remove_article(url, board_id){
		let form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
		
		let board_idInput = document.createElement("input");
		board_idInput.setAttribute("type", "hidden");
		board_idInput.setAttribute("name", "board_id");
		board_idInput.setAttribute("value", board_id);
		
		form.appendChild(board_idInput);
		document.body.appendChild(form);
		form.submit();
	}
	
	function readURL(input){
		if(input.files && input.files[0]) {
			let reader = new FileReader();
			reader.onload = function(e) {
				$("#preview").attr("src", e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function fn_reply_form(url, lecture_id){
		let form = document.createElement("form");
		form.setAttribute("method", "post");
		form.setAttribute("action", url);
	
		let parentInput = document.createElement("input");
		parentInput.setAttribute("type", "hidden");
		parentInput.setAttribute("name", "lecture_id");
		parentInput.setAttribute("value", lecture_id);
		
		form.appendChild(parentInput);
		document.body.appendChild(form);
		form.submit();
	}
	
</script>
</head>
<body>
	<form name="frmArticle" method="post" enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">글번호</td>
				<td>
					<input type="text" value="${article.board_id }" disabled="disabled">
					<input type="hidden" value="${article.board_id }" name="board_id">
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">작성자</td>
				<td><input type="text" value="${article.member_id }" name="id" disabled="disabled"></td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">제목</td>
				<td>
				<input type="text" value="${article.board_title }" name="title" id="i_title" disabled="disabled">
				</td>
			</tr>
			<tr>
				<td width="150" align="center" bgcolor="#FF9933">내용</td>
				<td>
					<textarea rows="20" cols="60" name="content" id="i_content" disabled="disabled">${article.board_content }</textarea>
				</td>
			</tr>
			<c:choose>
			<c:when test="${not empty imageFileList && imageFileList != null }">
			<c:forEach var="item" items="${imageFileList }" varStatus="status">
				<tr>
					<td width="20%" align="center" bgcolor="#FF9933" rowspan="2">
						이미지${status.count }
					</td>
					<td>
						<input type="hidden" name="originalFileName" value="${item.imageFileName }">
						<img src="${contextPath }/download.do?imageFileName=${item.imageFileName }&board_id=${article.board_id }" id="preview"><br>
					</td>
				</tr>
				<tr>
					<td>
						<input type="file" name="imageFileName" id="i_imageFileName" onchange="readURL(this)">
					</td>
				</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
				<tr id="tr_file_upload">
					<td width="150" align="center" bgcolor="#ff9933" rowspan="2">
						이미지
					</td>
					<td>
						<%-- <input type="hidden" name="originalFileName" 
							value="${article.imageFileName }"> --%>
	
					</td>
				</tr>
				<tr>
					<td></td>
					<td>
						<img id="preview" /><br>
						<input type="file" name="imageFileName" id="i_imageFileName" 
							disabled="disabled" onchange="readURL(this);">
					</td>
				</tr>
			</c:otherwise>
			</c:choose>
			<tr>
				<td width="20%" align="center" bgcolor="#FF9933">
					등록일자
				</td>
				<td>
					<input type="text" value="<fmt:formatDate value='${article.write_date }' />" disabled="disabled">
				</td>
			</tr>
			<tr id="tr_btn_modify">
				<td colspan="2" align="center">
					<input type="button" value="수정반영하기" onclick="fn_modify_article(frmArticle)">
					<input type='button' value="취소" onclick="backToList(frmArticle)">
				</td>
			</tr>
			<tr id="tr_btn">
				<td colspan="2" align="center">
				<c:if test="${member.member_id == article.member_id }">
					<input type="button" value="수정하기" onclick="fn_enable(this.form)">
					<input type="button" value="삭제하기" onclick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.board_id })">
				</c:if>
					<input type="button" value="리스트로 돌아가기" onclick="backToList(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>












