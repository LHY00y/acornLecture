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
<title>강의 추가</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function cancel(obj){
		obj.action = "${contextPath}/main.do";
		obj.submit();
	}
	
	function cate_select(){
		let category = document.getElementById("category");
		let categorySelect = category.options[category.selectedIndex].value;
		
		if(categorySelect=="add"){
			document.getElementById("add_cate").style.visibility="visible";	
		}else{
			document.getElementById("add_cate").style.visibility="hidden";
		}
	}
	
	function fn_submit(obj){
		let title = document.getElementById("title");
		let content11 = document.getElementById("content11");

		if(title.value== null || title.value.length==0){
			alert('제목을 입력해주세요');
			return;
		} else if(content11.value==null || content11.value.length==0){
			alert('내용을 입력해주세요');
			return;
		}else if( $('input:checkbox[name=daybox]:checked').length==0){
		    alert("요일을 선택해주세요.");
		    return;
		}
		obj.action = "${contextPath}/lecture/addNewLecture.do";
		obj.method= "post";
		obj.submit();
	}
</script>
</head>
<body>
	<form name="lectureForm" method="post" action="${contextPath }/lecture/addNewLecture.do"
		enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right">작성자</td>
				<td align="left">
					<input type="text" size="15" maxlength="100" name="name" value="${member.member_name }" readonly="readonly">
				</td>
				<td align="right">카데고리</td>
				<td  align="left">
					<select id="category" name="category" style="height:25px;" onchange="cate_select()">
						<c:forEach var="category" items="${categories }">
						<c:choose>
						<c:when test="${cate  == category }">
							<option value="${category }"  selected>${category }</option>
						</c:when>
						<c:otherwise>
							<option value="${category }">${category }</option>
						</c:otherwise>
						</c:choose>
						</c:forEach>
						<option value="add" >직접입력</option>				
					</select>
				</td>
				<td  id="add_cate"  style="visibility:hidden;" >
					<input type="text" name="category_add" style="height:20px;" size="15"/>
				</td>
			</tr>
			<tr>
				<td align="right">강의 제목</td>
				<td colspan="4"><input type="text" id="title" size="67" maxlength="500" name="title"></td>
			</tr>
			<tr>
				<td align="right" valign="top">강의 설명</td>
				<td colspan="4"><textarea id="content11" name="content" rows="10" cols="69" maxlength="4000" ></textarea></td>
			</tr>
			<tr>
				<td align="right" >요일/시간</td>
				<td colspan="2">
					<input type="checkbox" value="월" name="daybox">월
					<input type="checkbox" value="화" name="daybox">화
					<input type="checkbox" value="수" name="daybox">수
					<input type="checkbox" value="목" name="daybox">목
					<input type="checkbox" value="금" name="daybox">금
					<input type="checkbox" value="토" name="daybox">토
				</td>
				<td align="right" ><input type="time" name="time" value="21:00"></td>
			</tr>
			<tr>
				<td align="right">정원</td>
				<td colspan="2"><input type="number" min="0" name="count" value="20"></td>
			</tr>

			<tr style="height:100px; align:bottom;">
				<td></td>
				<td colspan="2">
					<input type="button" onclick="fn_submit(this.form)" value="강의추가" style="">
					<input type="button" value="취소" onclick="cancel(this.form)">
				</td>
			</tr>
		</table>
	</form>		