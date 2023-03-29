<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />	
<%
	request.setCharacterEncoding("utf-8");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script>
	function fn_joinMemberber(){
		var joinForm = document.joinForm;
		var name = joinForm.name.value;
		var id = joinForm.id.value;
		var pwd = joinForm.pwd.value;
		var rePwd = joinForm.rePwd.value;
		
		if(name.length==0 || name==""){
			alert("이름을 입력해 주세요.");
			joinForm.name.focus();
		} else if(id.length==0 || id==""){
			alert("아이디를 입력해 주세요.");
			joinForm.id.focus();
		} else if(joinForm.idDuplication.value!="idCheck"){
			alert("아이디 중복체크를 해주세요.");
		} else if(pwd.length==0 || pwd=""){
			alert("비밀번호를 입력해 주세요.");
		} else if(rePwd.length==0 || rePwd==""){
			joinForm.rePwd.focus();
		} else if(rePwd!=pwd){
			alert("입력하신 비밀번호가 틀립니다.");
			joinForm.rePwd.focus();
		} else{
			joinForm.method="post";
			joinForm.action="${contextPath}/member/addMember.do";
		}
	}
	
	function fn_dbCheckId(){
		var joinForm = document.joinForm;
		var id = joinForm.id.value;
		if(id.length==0 || id==""){
			alert("아이디를 입력해 주세요.");
			joinForm.id.focus();
		} else{
			window.open("${contextPath}/member/dbCheckId.do?id="+id,"","width=500, hegith=300");
		}
	}
</script>
</head>
<body>
	<form method="post" action="/acornLecture/member/addMember.do">
		<h1 style="text-align: center">회원 가입</h1>
		<table align="center">
			<tr>
				<td id="memberTd" width="100"><p align="left">아이디</p></td>
				<td id="memberTd" width="280"><input type="text" name="id">
				<button id="confirm" type="button" onclick="fn_dnCheckId()" name="dbCheckId">중복확인</button></td>
				<input type="hidden" name="idDuplication" value="idUncheck" />
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