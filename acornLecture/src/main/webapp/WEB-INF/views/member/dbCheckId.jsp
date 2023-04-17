<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>

<%
	request.setCharacterEncoding("UTF-8");
	Integer result = (Integer) session.getAttribute("result");
%>


<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="member_id" value="${param.member_id}" />

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/css/bootstrap.min.css" integrity="sha512-Ez0cGzNzHR1tYAv56860NLspgUGuQw16GiOOp/I2LuTmpSK9xDXlgJz3XN4cnpXWDmkNBKXR/VDMTCnAaEooxA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.1/js/bootstrap.min.js" integrity="sha512-EKWWs1ZcA2ZY9lbLISPz8aGR2+L7JVYqBAYTq5AXgBkSjRSuQEGqWx8R1zAX16KdXPaCjOCaKE8MCpU0wcHlHA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="${ contextPath }/resources/css/mainStyle.css">
<meta charset="UTF-8">
<title>ID 중복 확인</title>
<script type="text/javascript">
	function sendCheckValue() {
		var openJoinfrm = opener.document.joinForm;
		
		if (document.checkIdForm.chResult.value=="N") {
			alert("다른 아이디를 입력해주세요.");
			openJoinfrm.id.focus();
			
			window.close();
		}else {
			// 중복체크 결과인 idCheck 값을 전달
			openJoinfrm.idDuplication.value="idCheck";
			openJoinfrm.dbCheckId.disabled=true;
			openJoinfrm.dbCheckId.style.opacity=0.6;
			openJoinfrm.dbCheckId.style.cursor="default";
			window.close();
		}
		
	}
</script>
</head>
<body>
	<br>
	<b><font size="4" color="gray">ID 중복 확인</font></b>
	<br>
	
	<form name="checkIdForm">
		<input type="text" name="member_id" value="${member_id}" id="member_id" disabled>
			
		<c:choose>
		<c:when test="${result==1}">
			<p style="color: red">이미 사용 중인 아이디입니다.</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:when>
		<c:when test="${result==0 }">
			<p style="color: green">사용가능한 아이디입니다.</p>
			<input type="hidden" name="chResult" value="Y"/>
		</c:when>
		<c:otherwise>
			<p>오류 발생(-1)</p>
			<input type="hidden" name="chResult" value="N"/>
		</c:otherwise>
		</c:choose>

		<input class="btn acornBtn" type="button" onclick="window.close()" value="취소"/><br>
		<input class="btn acornBtn" type="button" onclick="sendCheckValue()" value="사용하기"/>

	</form>

</body>
</html>