<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<%
	request.setCharacterEncoding("utf-8");
%>
<c:set var="cate" value="${param.cate }" />
<c:set var="keyword" value="${param.keyword }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${ contextPath }/resources/css/lectureStyle.css">
<title>전체 강의 리스트</title>
<script>
	function cate_select(){
		let category = document.getElementById("category");
		let categorySelect = category.options[category.selectedIndex].value;
		
		let url = '${contextPath }/lecture/listLectures.do';
		if('${keyword}' != null && '${keyword}' != ''){
			url = '${contextPath }/lecture/search.do?keyword=${keyword}';
		}
		
		if(categorySelect != ''){
			if('${keyword}' != null && '${keyword}' != ''){
				url += '&cate='+categorySelect;
			}else{
				url += '?cate='+categorySelect;
			}
		} 
		location.href=url;
	}
</script>
</head>
<body>
		<form action="${contextPath }/lecture/search.do" method="GET" style="padding-left:20px; display:inline;">
			<input type="text" name="keyword" style="width:55%; height:20px;">
			<input type="submit" value="검색" style="width:50px; height:29px; margin:5px;"/>	
		</form>
		<table align="center">
	
		<tr align="center" bgcolor="#9DC0DF">
			<th>번호</th>
			<th>
			
			<select id="category" name="category" style="height:25px;" onchange="cate_select()">
				<option value="" >전체</option>
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
			</select>
			<br>
			</th>
			<th>강의명</th>
			<th>강사</th>
			<th>요일</th>
			<th>정원</th>
		</tr>
		
		<c:set var="index" value="0"/>
		<c:forEach var="lecture" items="${lecturesList}">
			<c:if test="${empty cate || cate eq '전체' ||cate eq lecture.category }">
			<tr align="center">
				<td>${index=index+1 }</td>
				<td>${lecture.category }</td>
				<td><a href="${ contextPath }/lecture/info.do?id=${lecture.lecture_id}">${lecture.lecture_title }</a></td>				
				<td>${lecture.professor_name }</td> 
 				<td>${lecture.schedule }</td>
 				<td>${lecture.count }</td>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	<c:if test="${member.grade=='강사' }">
		<input id=confirm type="button" onclick="location.href='lectureForm.do'" value="강의 추가"> 
	</c:if>
</body>
</html>