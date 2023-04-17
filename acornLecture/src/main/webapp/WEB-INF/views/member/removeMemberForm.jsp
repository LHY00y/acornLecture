<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 삭제창</title>
<script>
	function fn_removeMember(){
		var joinForm = document.joinForm;
		var password = joinForm.password.value;
		var rePwd = joinForm.rePwd.value;
		var pwdChk = "${member.password}";
		
		if(password.length==0 || password==""){
			alert("비밀번호를 입력해 주세요.");
		} else if(rePwd.length==0 || rePwd==""){
			joinForm.rePwd.focus();
			alert("비밀번호를 다시 입력해 주세요.");
		} else if(rePwd!=password){
			alert("입력하신 비밀번호가 틀립니다.");
			joinForm.rePwd.focus();
		} else if(password != pwdChk){
			alert("비밀번호가 틀립니다.")
			joinForm.rePwd.focus();
		} else{
			joinForm.method="post";
			joinForm.action="${contextPath}/member/removeMember.do";
			alert("회원정보 삭제가 완료되었습니다.");
			joinForm.submit();
		}
	}
</script>
</head>
<body>
	<div class="row" style="margin-top: 10px;">
		<div class="panel panel-info col-md-1" style="width:200px;">
    	<a class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
      		<svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
      		<span class="fs-4">Sidebar</span>
    	</a>
    <hr>
    	<ul class="nav nav-pills flex-column mb-auto">
    	  	<li class="nav-item">
        		<a href="${contextPath }/member/myPage.do" class="acornBtn1 nav-link" aria-current="page">
          			<svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
						내 강의 보기
        		</a>
      		</li>
      		<li>
        		<a href="${contextPath }/member/modMemberForm.do" class="acornBtn1 nav-link">
          			<svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
					회원 정보 수정
        		</a>
      		</li>
     		<li>
        		<a href="${contextPath }/member/removeMemberForm.do" class="acornBtn1 nav-link">
          			<svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
					회원 탈퇴
        		</a>
      		</li>
    	</ul>
    <hr>
   	</div>
    <div class="col-md-1"></div>
	<div class="col-md-1"></div>
	<form method="post" name="joinForm" class="col-md-4"
		action="/acornLecture/member/removeMember.do">
		<h1 style="text-align: center">회원 정보 삭제창</h1>
		<table align="center">
			<tr>
				<td width="200"><p align="right">아이디</p></td>
				<td width="400"><input type="text" name="member_id"
					value="${member.member_id }" disabled="disabled"> <input
					type="hidden" name="member_id" value="${member.member_id }">
				</td>

			</tr>
			<tr>
				<td width="200"><p align="right">암호</p></td>
				<td width="400"><input type="password" name="password"></td>
			</tr>
			<tr>
				<td width="200"><p align="right">암호확인</p></td>
				<td width="400"><input type="password" name="rePwd"></td>
			</tr>

			<tr>
				<td width="200"><p align="right">&nbsp;</p></td>
				<td width="400"><input class="btn acornBtn" type="button" value="탈퇴하기"
					onclick="fn_removeMember()"> <input class="btn acornBtn"
					type="reset" value="다시입력"></td>
			</tr>
		</table>
	</form>
	<div class="col-md-1"></div>
	<div class="col-md-1"></div>
	</div>
</body>
</html>