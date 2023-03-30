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
	function fn_joinMember(){
		var joinForm = document.joinForm;
		var member_name = joinForm.member_name.value;
		var member_id = joinForm.member_id.value;
		var password = joinForm.password.value;
		var rePwd = joinForm.rePwd.value;
		
		console.log(member_name);
		if(member_name.length==0 || member_name==""){
			alert("이름을 입력해 주세요.");
			joinForm.member_name.focus();
		} else if(member_id.length==0 || member_id==""){
			alert("아이디를 입력해 주세요.");
			joinForm.member_id.focus();
		} else if(joinForm.idDuplication.value!="idCheck"){
			alert("아이디 중복체크를 해주세요.");
		} else if(password.length==0 || password==""){
			alert("비밀번호를 입력해 주세요.");
		} else if(rePwd.length==0 || rePwd==""){
			joinForm.rePwd.focus();
		} else if(rePwd!=password){
			alert("입력하신 비밀번호가 틀립니다.");
			joinForm.rePwd.focus();
		} else{
			joinForm.method="post";
			joinForm.action="${contextPath}/member/addMember.do";
			joinForm.submit();
		}
	}
	
	function fn_dbCheckId(){
		var joinForm = document.joinForm;
		var member_id = joinForm.member_id.value;
		if(member_id.length==0 || member_id==""){
			alert("아이디를 입력해 주세요.");
			joinForm.member_id.focus();
		} else{
			window.open("${contextPath}/member/dbCheckId.do","","width=500, hegith=300");
		}
	}
	
	function inputIdChk(){
		var joinForm = document.joinForm;
		var dbCheckId = document.joinForm.dbCheckId;
		document.joinForm.idDuplication.value="idUnCheck";
		dbCheckId.disabled=false;
		dbCheckId.style.opacity=1;
		dbCheckId.style.cursor="pointer";
	}
</script>
</head>
<body>
	<form name="joinForm" method="post" action="/acornLecture/member/addMember.do">
		<h1 style="text-align: center">강사 회원 가입</h1>
		<table align="center">
			<tr>
				<td id="memberTd" width="100"><p align="left">아이디</p></td>
				<td id="memberTd" width="280"><input type="text" name="member_id" onkeydown="inputIdChk()" />
				<button id="confirm" type="button" onclick="fn_dbCheckId()" name="dbCheckId">중복확인</button></td>
				<input type="hidden" name="idDuplication" value="idUncheck" />
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">암호</p></td>
				<td id="memberTd" width="280"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">암호 확인</p></td>
				<td id="memberTd" width="280"><input type="password" name="rePwd"></td>
			</tr>
			<tr>
				<td id="memberTd" width="100"><p align="left">이름</p></td>
				<td id="memberTd" width="280"><input type="text" name="member_name"></td>
			</tr>
			<input type="hidden" name="grade" value="강사">
			<tr>
				<td id="memberTd" width="100"><p align="left">&nbsp;</p></td>
				<td id="memberTd" width="280"><input id="confirm" type="button" value="가입하기" onclick="fn_joinMember()"> <input id="confirm"
					type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
</body>
</html>