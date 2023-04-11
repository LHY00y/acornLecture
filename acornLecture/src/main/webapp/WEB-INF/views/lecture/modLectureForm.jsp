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
				<td colspan="4"><textarea name="content" rows="10" cols="69"
						maxlength="4000">${lecture.lecture_content }</textarea></td>
			</tr>
			<tr>
				<td align="right">요일/시간</td>
				<td colspan="2"><input type="checkbox" value="월" name="daybox"
					${fn:contains(lecture.schedule, "월") ? "checked" : ""}>월
					<input type="checkbox" value="화" name="daybox"
					${fn:contains(lecture.schedule, "화") ? "checked" : ""}>화
					<input type="checkbox" value="수" name="daybox"
					${fn:contains(lecture.schedule, "수") ? "checked" : ""}>수
					<input type="checkbox" value="목" name="daybox"
					${fn:contains(lecture.schedule, "목") ? "checked" : ""}>목
					<input type="checkbox" value="금" name="daybox"
					${fn:contains(lecture.schedule, "금") ? "checked" : ""}>금
					<input type="checkbox" value="토" name="daybox"
					${fn:contains(lecture.schedule, "토") ? "checked" : ""}>토
				</td>
				<td align="right" colspan="2"><input type="time" name="time"
					value="${lecture.schedule}"></td>
			</tr>
			<tr>
				<td align="right">정원</td>
				<td><input type="number" min="0" name="count"
					value="${lecture.count }"></td>
			</tr>

			<tr style="height: 100px; align: bottom;">
				<td></td>
				<td colspan="2"><input type="submit" value="강의수정" style="">
					<input type="button" value="취소" onclick="cancel(this.form)">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>