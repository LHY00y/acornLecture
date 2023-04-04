<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<div id="ctBtnContainer">
	<button class="ctBtn" onclick="location.href='${contextPath}/acornLecture/lecture/listLectures.do?cate=백엔드'">백엔드</button>
	<button class="ctBtn" onclick="location.href='${contextPath}/acornLecture/lecture/listLectures.do?cate=프론트엔드'">프론트엔드</button>
	<button class="ctBtn" onclick="location.href='${contextPath}/acornLecture/lecture/listLectures.do?cate=모바일'">모바일</button>
	<button class="ctBtn" onclick="location.href='${contextPath}/acornLecture/lecture/listLectures.do?cate=인공지능'">인공지능</button>
	<button class="ctBtn" onclick="location.href='${contextPath}/acornLecture/lecture/listLectures.do?cate=기타'">기타</button>
</div>

<div id="reviewContainer">
	<h3>후기 리스트 include 할 곳</h3>
</div>