<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<%-- <div id="ctBtnContainer">
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=백엔드'">백엔드</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=프론트엔드'">프론트엔드</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=모바일'">모바일</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=인공지능'">인공지능</button>
	<button class="ctBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=기타'">기타</button>
</div> --%>
<table style="text-algn:center">
	<tr>
		<td>
			<div class="card h-100" style="width: 14rem;">
			  <img style="height:150px;"src="https://static.wixstatic.com/media/2d5b26_87ad07458de042d48fad426f58860810~mv2.jpg/v1/fill/w_640,h_410,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/2d5b26_87ad07458de042d48fad426f58860810~mv2.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">프론트 엔드</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=프론트엔드'" value="Go Front-End">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;"src="https://blog.codestates.com/wp-content/uploads/2022/04/%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B3%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8E%E1%85%B3-%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%86%AB%E1%84%90%E1%85%B3%E1%84%8B%E1%85%A6%E1%86%AB%E1%84%83%E1%85%B3-%E1%84%80%E1%85%A2%E1%84%87%E1%85%A1%E1%86%AF%E1%84%8C%E1%85%A1-%E1%84%87%E1%85%A2%E1%86%A8%E1%84%8B%E1%85%A6%E1%86%AB%E1%84%83%E1%85%B3.jpeg?fit=640%2C360&ssl=1" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">백 엔드</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=백엔드'" value="Go Back-End">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src=https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202111/130948-539/%E1%84%86%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%AB-%E1%84%8B%E1%85%A1%E1%87%81.png class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">모바일</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=모바일'" value="Go Mobile">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src="https://typecast.ai/kr/learn/wp-content/uploads/2022/12/852-scaled.jpeg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">인공지능</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=인공지능'" value="Go AI">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src="https://images.velog.io/images/dev_shu/post/d695eb16-9f9e-44e4-9338-dc3b30c34d0d/etc.jpeg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">기타</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=기타'" value="Go Etc">
			  </div>
			</div>
		</td>
	</tr>
</table>




<div id="reviewContainer">
	<jsp:include page="board/board.jsp">
		<jsp:param name="isReview" value="true" />
	</jsp:include>	
</div>