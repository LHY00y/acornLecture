<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 추가</title>
<script>
	function backToList(obj){
		obj.action = "${contextPath}/lecture/board.do";
		obj.submit();
	}
</script>
</head>
<body>
	<h1 style="text-align: center;">강의 추가</h1>
	<form name="lectureForm" method="post" action="${contextPath }/lecture/addNewLecture.do"
		enctype="multipart/form-data">
		<table border="0" align="center">
			<tr>
				<td align="right">작성자</td>
				<td colspan="2" align="left">
				<input type="text" size="20" maxlength="100" name="name" value="${member.member_name }" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="right">강의 제목</td>
				<td colspan="2"><input type="text" size="67" maxlength="500" name="title"></td>
			</tr>
			<tr>
				<td align="right" valign="top">강의 설명</td>
				<td colspan="2"><textarea name="content" rows="10" cols="69" maxlength="4000">
				</textarea></td>
			</tr>
			<tr>
				<td align="right">요일/시간</td>
				<td >
					<input type="checkbox" value="월" name="daybox">월
					<input type="checkbox" value="화" name="daybox">화
					<input type="checkbox" value="수" name="daybox">수
					<input type="checkbox" value="목" name="daybox">목
					<input type="checkbox" value="금" name="daybox">금
					<input type="checkbox" value="토" name="daybox">토
				</td>
				<td >시작시간:  <input type="time" name="time" value="21:00"></td>
			</tr>
			<tr>
				<td align="right">정원</td>
				<td colspan="2"><input type="number" min="0" name="title" value="20"></td>
			</tr>
			<tr style="height:100px; align:bottom;">
				<td></td>
				<td colspan="2">
					<input type="submit" value="강의추가" style="">
					<input type="button" value="취소" onclick="backToList(this.form)">
				</td>
			</tr>
		</table>		
	</form>
</body>
</html>