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
	function fn_joinMember() {
		var joinForm = document.joinForm;
		var member_name = joinForm.member_name.value;
		var member_id = joinForm.member_id.value;
		var password = joinForm.password.value;
		var rePwd = joinForm.rePwd.value;
		const rePwdBtn = document.querySelector("#inputInvalid");
		console.log(member_name);
		if (member_name.length == 0 || member_name == "") {
			alert("이름을 입력해 주세요.");
			joinForm.member_name.focus();
		} else if (member_id.length == 0 || member_id == "") {
			alert("아이디를 입력해 주세요.");
			joinForm.member_id.focus();
		} else if (joinForm.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
		} else if (password.length == 0 || password == "") {
			alert("비밀번호를 입력해 주세요.");
		} else if (rePwd.length == 0 || rePwd == "") {
			joinForm.rePwd.focus();
		} else if (rePwd != password) {
			alert("입력하신 비밀번호가 틀립니다.");
			rePwdBtn.classList.add('is-invalid');
			joinForm.rePwd.focus();
		} else {
			alert("회원 가입이 완료되었습니다.")
			joinForm.method = "post";
			joinForm.action = "${contextPath}/member/addMember.do";
			joinForm.submit();
		}
	}

	function fn_dbCheckId() {
		var joinForm = document.joinForm;
		var member_id = joinForm.member_id.value;
		if (member_id.length == 0 || member_id == "") {
			alert("아이디를 입력해 주세요.");
			joinForm.member_id.focus();
		} else {
			window.open("${contextPath}/member/dbCheckId.do?member_id="
					+ member_id, "", "width=300px, height=300px");
		}
	}

	function inputIdChk() {
		var joinForm = document.joinForm;
		var dbCheckId = document.joinForm.dbCheckId;
		document.joinForm.idDuplication.value = "idUnCheck";
		dbCheckId.disabled = false;
		dbCheckId.style.opacity = 1;
		dbCheckId.style.cursor = "pointer";
	}
	
</script>
<style>
	/* .help-block 을 일단 보이지 않게 설정 */
        #myForm .help-block{
            display: none;
        }
	/* glyphicon 을 일단 보이지 않게 설정 */
        #myForm .glyphicon{
            display: none;
        }
</style>
</head>
<body>
	<form name="joinForm" method="post" id="myForm"
		action="/acornLecture/member/addMember.do">
		<table align="center">
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td>
					<h1 class="h3 mb-3 fw-normal">Join Member</h1>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<label for="exampleInputEmail1" class="form-label mt-4">아이디</label>
						<input type="text" class="form-control" name="member_id" onkeydown="inputIdChk()" />
						<input type="hidden" name="idDuplication" value="idUncheck" />
						<input type="hidden" name="grade" value="강사">
					</div>
				</td>
				<td>
				&nbsp; <input class="acornBtn" type="button" onclick="fn_dbCheckId()" name="dbCheckId" style="height: 30px; border-radius:5px; margin-top: 55px" value="중복 확인">
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group has-success">
						<label class="form-label mt-4" for="inputValid">비밀번호</label> 
						<input type="password" class="form-control" id="inputValid" name="password">
						<div class="valid-feedback"></div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group has-danger">
						<label class="form-label mt-4" for="inputInvalid">비밀번호 재확인</label>
						<input type="password" class="form-control"
							id="inputInvalid" name="rePwd">
							<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-group">
						<label for="exampleInputEmail1" class="form-label mt-4">이름</label>
						<input type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="member_name">
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div class="d-grid gap-2">
						<input class="btn acornBtn" type="button"
							value="가입하기" onclick="fn_joinMember()"> 
					</div>
				</td>
			</tr>
		</table>

	</form>
</body>
</html>

