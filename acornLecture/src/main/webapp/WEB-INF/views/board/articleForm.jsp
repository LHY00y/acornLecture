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
	function cancel(){
		if(confirm("작성을 취소하시겠습니까?")){
			history.back(-1);
		} 
	}
	
	let cnt = 1;
	function fn_addFile(){
		$("#img-list").append("<br>" + "<input type='file' onchange='readURL(this)' name='file"+cnt+"'>");
		cnt++;
	}
	
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
	    		$("#img-list").append("<br>" + "<img style='width:100px;border-radius:10px;'src='"+e.target.result+"'>");
		    };
		    reader.readAsDataURL(input.files[0]);
		  }
		}
</script>
</head>
<link rel="stylesheet" href="${ contextPath }/resources/css/boardStyle.css">
<body>
	<h1 style="text-align: center;">새 글 쓰기</h1>
	<form name="articleForm" method="post" action="${contextPath }/board/addNewArticle.do"
		enctype="multipart/form-data">
		
		<div id="side-img">
			<div id="img-list">
			</div>
			<button id="m_img" class="button" onclick="fn_addFile()"  type="button"
				style=" padding:5px; position: absolute; bottom:-50px; margin:auto; margin-top:10px; font-size:11pt; width:100px; height:30px;"
				>이미지추가</button>
		</div>
		
		<div id="content" style="margin:auto;">
			<p style="color:grey; margin-bottom:30px;">[${lecture.category }] ${lecture.lecture_title } · <span style="font-size:10pt; margin-left:2px; color:grey;">  ${member.member_name }</span></p>
			 <input type="text" class="default" placeholder="제목을 입력하세요." required="required" name="title" style="font-size:18pt; font-weight:bold;">
			
			<hr/>
			<textarea name="content" class="default" placeholder="내용을 입력하세요." required="required"
			style="min-height:300px; width:inherit; padding:2px; margin-top:10px; maxlength:4000;"></textarea>
			<input type="hidden" name="lecture_id" value="${param.lecture_id}">
			
			<br><br>
			<br><br>
			<input type="submit" class="button" value="글쓰기">
			<input type="button"  class="button" type="button" value="취소" onclick="cancel()">
	
		</div>
	</form>
</body>
</html>