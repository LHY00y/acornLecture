<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
    
<c:set var="contextPath" value="${pageContext.request.contextPath }" />


<table style="text-algn:center; margin: 0px auto;">
	<tr>
		<td>
			<div class="card h-100" style="width: 14rem;">
			  <img style="height:150px;"src="https://static.wixstatic.com/media/2d5b26_87ad07458de042d48fad426f58860810~mv2.jpg/v1/fill/w_640,h_410,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/2d5b26_87ad07458de042d48fad426f58860810~mv2.jpg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">프론트 엔드</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn w-100" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=프론트엔드'" value="Go Front-End">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;"src="https://blog.codestates.com/wp-content/uploads/2022/04/%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B3%E1%84%89%E1%85%B3%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%8E%E1%85%B3-%E1%84%91%E1%85%B3%E1%84%85%E1%85%A9%E1%86%AB%E1%84%90%E1%85%B3%E1%84%8B%E1%85%A6%E1%86%AB%E1%84%83%E1%85%B3-%E1%84%80%E1%85%A2%E1%84%87%E1%85%A1%E1%86%AF%E1%84%8C%E1%85%A1-%E1%84%87%E1%85%A2%E1%86%A8%E1%84%8B%E1%85%A6%E1%86%AB%E1%84%83%E1%85%B3.jpeg?fit=640%2C360&ssl=1" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">백 엔드</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn w-100" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=백엔드'" value="Go Back-End">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202111/130948-539/%E1%84%86%E1%85%A6%E1%84%8B%E1%85%B5%E1%86%AB-%E1%84%8B%E1%85%A1%E1%87%81.png" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">모바일</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn w-100" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=모바일'" value="Go Mobile">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src="https://typecast.ai/kr/learn/wp-content/uploads/2022/12/852-scaled.jpeg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">인공지능</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn w-100" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=인공지능'" value="Go AI">
			  </div>
			</div>
		</td>
		<td>
			<div class="card" style="width: 14rem;">
			  <img style="height:150px;" src="https://images.velog.io/images/dev_shu/post/d695eb16-9f9e-44e4-9338-dc3b30c34d0d/etc.jpeg" class="card-img-top" alt="...">
			  <div class="card-body">
			    <h5 class="card-title">기타</h5>
			    <p class="card-text"></p>
			    <input type="button" class="btn acornBtn w-100" onclick="location.href='${ contextPath }/lecture/listLectures.do?cate=기타'" value="Go Etc">
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

<div id="searchLectureByKeyword">
	<h4>학습 가이드</h4>
	<h2>
		내게 딱 맞는 학습이 궁금하다면?
	</h2>
	<h4>
		원하는 키워드를 선택해보세요!
	</h4>	
	<table id="searchLectureByKeywordTb" align="center" style="border: none;">
		<tr>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=데이터 분석'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213648-476/sbwj-thumb09.png"></button>

			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=프로그래밍'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213652-476/sbwj-thumb02.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=영상편집'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213657-476/sbwj-thumb03.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=모바일'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213706-476/sbwj-thumb05.png"></button>
			</td>
		</tr>
		<tr>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=파이썬'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213709-476/sbwj-thumb06.png"></button>

			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=일러스트'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213713-476/sbwj-thumb07.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=사이드 프로젝트'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213716-476/sbwj-thumb08.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=자동화'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/2022-05-09T01:53:01Z/2022-05-09T01:53:01Z-476/sbwj-thumb01.png"></button>
			</td>
		</tr>
				<tr>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=마케팅'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213727-476/sbwj-thumb10.png"></button>

			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=딥러닝'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213733-476/sbwj-thumb11.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=데이터 분석'">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213738-476/sbwj-thumb12.png"></button>
			</td>
			<td>
				<button class="btn_image" onclick="location.href='${contextPath}/lecture/search.do?keyword=디자인 '">
					<img class="input_image" src="https://storage.googleapis.com/static.fastcampus.co.kr/prod/uploads/202204/213700-476/sbwj-thumb04.png"></button>
			</td>
		</tr>
	</table>
</div>

<div style="margin: 50px 0px 50px 0px">
	<h4>요즘 대세 chatGPT</h4>
	<h2>
		chatGPT란?
	</h2>
	<h4>chatGPT에 대해 배워보고 효율적으로 사용해보세요!</h4>
	<iframe width="640" height="355" src="https://www.youtube.com/embed/OktEGBDholo" title="지금 전 세계가 주목하는 &#39;챗GPT&#39;✨&#39;GPT&#39; 모르면 도태된다!｜&#39;AI와 함께 살기, 준비됐나요?&#39; - 김성훈 교수｜차이나는 클라스｜JTBC 201130 방송" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe><br>
	<button type="button" class="btn acornBtn" style="width:640px;" onclick="location.href='${contextPath}/lecture/search.do?keyword=chatGPT'">수강하러 가기</button>
</div>

