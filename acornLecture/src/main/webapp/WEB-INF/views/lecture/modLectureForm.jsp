<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 추가</title>
<script>
	function cancel(obj) {
		obj.action = "${contextPath}/main.do";
		obj.submit();
	}

	function cate_select() {
		let category = document.getElementById("category");
		let categorySelect = category.options[category.selectedIndex].value;

		if (categorySelect == "add") {
			document.getElementById("add_cate").style.visibility = "visible";
		} else {
			document.getElementById("add_cate").style.visibility = "hidden";
		}
	}
	
	function fn_submit(obj){
		let content11 = document.getElementById("content11");
		let count=0;

		if(content11.value==null || content11.value.length==0){
			alert('내용을 입력해주세요');
			return;
		}
		for(i=1; i<=6; i++){ 
	        if(!(document.getElementById("daybox"+i).checked)){ 
	        	count++;
	        }
	    }if(count==6){
	    	alert("요일을 선택해주세요.");
	    	return
	    }
		obj.action = "${contextPath }/lecture/modLecture.do?lecture_id=${lecture.lecture_id}";
		obj.method= "post";
		obj.submit();
	}
</script>
</head>
<body>
	<h1 style="text-align: center;">강의 수정</h1>
	<form name="lectureForm" method="post"
		action="${contextPath }/lecture/modLecture.do?lecture_id=${lecture.lecture_id}"
		enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right">작성자</td>
				<td align="left"><input type="text" size="15" maxlength="100"
					name="name" value="${member.member_name }" readonly="readonly">
				</td>
				<td align="right">카테고리</td>
				<td align="left"><select id="category" name="category"
					style="height: 25px;" onchange="cate_select()">
						<c:forEach var="category" items="${categories }">
							<c:choose>
								<c:when test="${lecture.category  == category }">
									<option value="${category }" selected>${category }</option>
								</c:when>
								<c:otherwise>
									<option value="${category }">${category }</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<option value="add">직접입력</option>
				</select></td>
				<td id="add_cate" style="visibility: hidden;"><input
					type="text" name="category_add" style="height: 20px;" size="15" />
				</td>
			</tr>
			<tr>
				<td align="right">강의 제목</td>
				<td colspan="4"><input type="text" size="67" maxlength="500"
					name="title" value="${lecture.lecture_title }" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right" valign="top">강의 설명</td>
				<td colspan="4"><textarea id="content11" name="content" rows="10" cols="69"
						maxlength="4000">${lecture.lecture_content }</textarea></td>
			</tr>
			<tr>
				<td align="right">요일/시간</td>
				<td colspan="2"><input type="checkbox" value="월" name="daybox" id="daybox1"
					${fn:contains(day, "월") ? "checked" : "unchecked"}>월
					<input type="checkbox" value="화" id="daybox2" name="daybox"
					${fn:contains(day, "화") ? "checked" : "unchecked"}>화
					<input type="checkbox" value="수" id="daybox3" name="daybox"
					${fn:contains(day, "수") ? "checked" : "unchecked"}>수
					<input type="checkbox" value="목" id="daybox4" name="daybox"
					${fn:contains(day, "목") ? "checked" : "unchecked"}>목
					<input type="checkbox" value="금" id="daybox5" name="daybox"
					${fn:contains(day, "금") ? "checked" : "unchecked"}>금
					<input type="checkbox" value="토" id="daybox6" name="daybox"
					${fn:contains(day, "토") ? "checked" : "unchecked"}>토
				</td>
				<td align="right" colspan="2"><input type="time" name="time" value="${time}"></td>
			</tr>
			<tr>
				<td align="right">정원</td>
				<td><input type="number" min="0" name="count"
					value="${lecture.count }"></td>
			</tr>
			<tr style="height: 100px; align: bottom;">
				<td></td>
				<td colspan="2">
					<input class="btn acornBtn" type="button" onclick="fn_submit(this.form)" value="강의수정">
					<input class="btn acornBtn" type="button" value="취소" onclick="cancel(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>