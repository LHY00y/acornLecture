<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%
	request.setCharacterEncoding("utf-8");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<form method="post" action="/acornLecture/member/addMember.do">
		<h1 style="text-align: center">회원 가입</h1>
		<table align="center">
			<tr>
				<td id="memberTd" width="100"><p align="left">아이디</p></td>
				<td id="memberTd" width="280"><input type="text" name="id"> <input
					id="confirm" type="button" value="중복 확인" /></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">암호</p></td>
				<td id="memberTd" width="280"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">암호 확인</p></td>
				<td id="memberTd" width="280"><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">이름</p></td>
				<td id="memberTd" width="280"><input type="text" name="name"></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">&nbsp;</p></td>
				<td id="memberTd" width="280"><input id="confirm" type="submit" value="가입하기"> <input id="confirm"
					type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>