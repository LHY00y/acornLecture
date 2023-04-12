<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<c:set var="result" value="${param.result }" />
<c:if test="${result == 'loginfailed' }">
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		window.onload = function() {
			alert("아이디 / 패스워드가 다릅니다. 다시 로그인 하세요.");
		}
	</script>
</c:if>
<c:if test="${result == 'logout' }">
	<script>
		window.onload = function() {
			alert("로그아웃이 되었습니다. 다시 로그인 하세요.");
		}
	</script>
</c:if>
<c:if test="${result == 'notLogin' }">
	<script>
		window.onload = function() {
			alert("로그인 되어 있지 않습니다. 로그인 하세요.");
		}
	</script>
</c:if>
<form method="post" action="${contextPath }/member/login.do">
<!-- 구버전 -->
<!-- 	<h1 align="center">로그인</h1>
	<table align="center">
		<tr align="center">
			<td width="50" align="left">아이디</td>
			<td width="200"><input tabIndex="1" type="text" name="member_id"></td>
			<td rowspan="2"><input tabIndex="3" class="submit" type="submit"
				value="로그인"></td>
		</tr>
		<tr align="center">
			<td width="50" align="left">암호</td>
			<td width="200"><input tabIndex="2" type="password"
				name="password"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td align="right"><input class="sign" type="button" value="회원가입"
				onclick="location.href='memberTypeForm.do'">
		</tr>
	</table> -->
	
	<!-- 신버전 -->
	<main class="form-signin w-100 m-auto">
		<form>
			<table align=center>
				<tr><td>&nbsp;</td></tr>
				<tr><td>&nbsp;</td></tr>
				<tr>
					<td>
						<h1 class="h3 mb-3 fw-normal">Please sign in</h1>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating">
							<input type="text" style="height: 50px; width: 300px"
								class="form-control" id="floatingInput"
								placeholder="ID" name="member_id"> 
								 <label for="floatingInput">Id</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-floating">
							<input type="password" style="height: 50px; width: 300px"
								class="form-control" id="floatingPassword" name="password"
								placeholder="Password"> <label for="floatingPassword">Password</label>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<input class="w-100 btn btn-lg btn-primary" type="submit" value="로그인" />
					</td>
				</tr>
				<tr>
					<td>
						<input class="w-100 btn btn-lg btn-primary" type="button" value="회원 가입" onclick="location.href='memberTypeForm.do'" />
					</td>
				</tr>
			</table>
		</form>
	</main>
</form>