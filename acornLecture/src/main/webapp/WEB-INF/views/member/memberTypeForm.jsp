<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<form>
		<table class="joinTypeTable">
			<tr>
				<td><input type="button" style="border-radius: 30px;" class="joinTypeBtn" id="proJoinMember" value="강사 회원" onClick="location.href='proMemberForm.do'"></td>
				<td>&nbsp;&nbsp;</td>
				<td><input type="button" style="border-radius: 30px;"class="joinTypeBtn" id="stuJoinMember" value="학생 회원" onClick="location.href='stuMemberForm.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>