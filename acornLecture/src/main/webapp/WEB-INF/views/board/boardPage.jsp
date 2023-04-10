<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="article" value="${articleMap.article }" />
<c:set var="imgFileList" value="${articleMap.imgFileList }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글</title>
<style>
	#tr_btn_modify {
		display:none;
	}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	
	function fn_imgBrowserOpen(img){
		let Browser = document.getElementById("imgBrowser");
		Browser.setAttribute('class', 'active');
		console.log(img.src);
		let bImg = document.getElementById("bImg");
		bImg.src=img.src;
	}
	
	function fn_imgBrowserClose(){
		let Browser = document.getElementById("imgBrowser");
		Browser.removeAttribute('class');
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
	

	function fn_modify_article(obj){
		obj.action = "${contextPath}/board/modArticle.do";
		obj.method= "post";
		obj.submit();
	}
	
	function fn_enable(obj){
		document.getElementById("i_title").disabled=false;
		document.getElementById("i_title").setAttribute("class", "modify");
		document.getElementById("i_content").disabled=false;
		document.getElementById("i_content").setAttribute("class", "modify");
		
		document.getElementById("m_btn").style.display="none";	
		document.getElementById("mc_btn").style.display="inline";	
		document.getElementById("mcheck_btn").style.display="inline";	
		document.getElementById("m_img").style.display="block";	
		let d_img = document.getElementsByClassName("d_img");
		for(let i =0;i<d_img.length;i++){
			d_img[i].style.display="block";
		}
		
		$("#side-img").append("<hr>")
		//이미지 없을때도 추가하는 기능
	}
	
	function fn_removeFile(no,img, obj){
		$("#d_file").append("<br>" + "<input type='hidden' name='delImgNo' value='"+no+"'>");
		$("#d_file").append("<br>" + "<input type='hidden' name='delImg' value='"+img+"'>");
		document.getElementById("img_"+no).style.display="none";	
		obj.style.display="none";
	}
	
	let cnt = 1;
	function fn_addFile(){
		$("#side-img").append("<br>" + "<input type='file' onchange='readURL(this)' name='file"+cnt+"'>");
		/* $("#side-img").append("<br>" + "<label for='file'>"
				  + "<div class='btn-select'>파일 선택</div>"
				 + "<input type='file' style='display:none;' name='file"+cnt+"'> </label>"
				  ); */
		cnt++;
	}
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
	    		$("#side-img").append("<br>" + "<img style='width:100px;border-radius:10px;'src='"+e.target.result+"'>");
		    };
		    reader.readAsDataURL(input.files[0]);
		  }
		}
</script>
</head>
<link rel="stylesheet" href="${ contextPath }/resources/css/boardStyle.css">
<body>
	<form name="frmArticle" method="post" enctype="multipart/form-data">
	
	<div id="imgBrowser">
		<button type="button" onclick="fn_imgBrowserClose()" style="float:right; background:#000; color:white; margin-bottom:10px; font-size:14pt;">X</button>
		<br>
		<img id="bImg" src="#" style="padding:20px 70px; width:800px; height:500px;">
	</div>
	<c:if test="${not empty imgFileList && imgFileList != null }">
	<div id="side-img">
		<c:forEach var="imgFile" items="${imgFileList}">
			<button type="button" class="d_img" onclick="fn_removeFile(${imgFile.imgFileNo },'${imgFile.imgFileName }', this)"
			style="position:relative; float:right; display:none; top:28px; right: 3px; color:#F0F0F0; margin-top:-25px; background:#FF6347;'" 
			>X</button>
		
			<img src="${contextPath }/download.do?imageFileName=${imgFile.imgFileName }&board_id=${article.board_id }"
			 id="img_${imgFile.imgFileNo }"
			 style="width:100px; border-radius:10px;"
			 onclick="fn_imgBrowserOpen(this)">
			<br>
		</c:forEach>
		<button id="m_img" class="button" onclick="fn_addFile()"  type="button"
			style="display:none; padding:5px; position: absolute; bottom:-50px; margin:auto; margin-top:10px; font-size:11pt; width:100px; height:30px;"
			>이미지추가</button>
	</div>
	</c:if>
		
		<input type="hidden" name="board_id" value="${article.board_id }">
		<div id="content">
			<p style="color:grey;">[${article.category }] ${article.lecture_title }</p>
			<input type="text" id="i_title" class="default" name="title" style="font-size:18pt; font-weight:bold;" value="${article.board_title }" disabled="disabled">
			<p style="font-size:10pt; color:grey;"> ${article.member_name } · ${article.write_date } · ${article.board_id } </p>
			<hr/>
			<textarea id="i_content" class="default" name="content" style="min-height:300px; width:inherit; padding:2px; margin-top:10px;" disabled="disabled">${article.board_content}</textarea>
	
		</div>
		<div style="margin-left:50px;">
		<c:if test="${member.member_id == article.member_id }">
			<input id="m_btn" class="button" type="button" value="수정" onclick="fn_enable(this.form)">
			<input id="mc_btn" class="button" type="button" value="수정 취소" onclick="window.location.reload()" style="display:none;">
			<input id="mcheck_btn" class="button" type="button" value="수정 완료" onclick="fn_modify_article(this.form)" style="display:none;">
			<input class="button" type="button" value="삭제" onclick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.board_id })">
		</c:if>
		</div>
		<div id="d_file"></div>
	</form>
</body>
</html>












