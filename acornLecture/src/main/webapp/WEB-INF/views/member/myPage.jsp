<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isErrorPage="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
   request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
   a:link{
      color:black;
   }
   a:hover{
      color:blue;
   }
   a:active{
      color:darkblue;
   }
</style>
</head>
<body>
   <div class="row" style="margin-top: 10px;">
      <div class="panel panel-info col-md-1" style="width:200px; margin-top: 10px;">
       <a class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
            <h5>
               안녕하세요<br>
               ${member.member_name}님
            </h5>
       </a>
    <hr>
       <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
              <a href="${contextPath }/member/myPage.do" class="nav-link acornBtn1" aria-current="page">
                   <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
                  내 강의 보기
              </a>
            </li>
            <li>
              <a href="${contextPath }/member/modMemberForm.do" class="nav-link acornBtn1">
                   <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
               회원 정보 수정
              </a>
            </li>
           <li>
              <a href="${contextPath }/member/removeMemberForm.do" class="nav-link acornBtn1">
                   <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
               회원 탈퇴
              </a>
            </li>
       </ul>
    <hr>
      </div>
   <div class="col-md-1"></div>
   <div class="col-md-1"></div>
   <form method="get" name="joinForm" class="col-md-4">
      <table align="center">
      <h1 style="text-align:center">My Page</h1>
         <c:choose>
            <c:when test="${member.grade == '강사'}">
               <c:forEach var="item" items="${lectureList }" varStatus="status">
                  <tr>
                     <td colspan="2">
                     <div class="card" style="width: 20rem; margin:0 auto; margin-top: 5px;">
                        <div class="card-header">
                           ${status.count }
                        </div>
                        <a class="card-title" style="font-size:20px; padding:10px 10px 0px 10px;" href="${ contextPath }/lecture/info.do?id=${item.lecture_id}">${item.lecture_title}</a>
                        <p class="card-text" style="font-size:14px; padding:10px 10px 0px 10px;">${item.schedule}</p>
                        <table border="0">
                           <tr>
                              <td>
                                 <input class="w-100 btn acornBtn" type="button"
                                    value="강의 수정" onClick="location.href='${contextPath}/lecture/modLectureForm.do?lecture_id=${item.lecture_id}'">
                              </td>
                              <td>   
                                 <input class="w-100 btn acornBtn" type="button"
                                    value="강의 삭제" onClick="location.href='${contextPath}/lecture/delLecture.do?lecture_id=${item.lecture_id}'">                           
                              </td>
                           </tr>
                        </table>
                     </div>
                     </td>
                  </tr>
               </c:forEach>
               <tr>
               <td colspan="2">
                  <a class="w-100 btn acornBtn" style="color:white;" href="${contextPath }/lecture/lectureForm.do">강의 추가</a>
               </td>
               </tr>
            </c:when>
            <c:when test="${member.grade == '학생'}">
               <c:forEach var="item" items="${lectureList }" varStatus="status">
                  <tr>
                     <td colspan="2">
                     <div class="card" style="width: 20rem; margin:0 auto; margin-top: 5px;">
                        <div class="card-header">
                           ${status.count }
                        </div>
                        <a class="card-title" style="font-size:20px; padding:10px 10px 0px 10px;" href="${ contextPath }/lecture/info.do?id=${item.lecture_id}">${item.lecture_title}</a>
                        <p class="card-text" style="font-size:14px; padding:10px 10px 0px 10px;">${item.schedule}</p>
                        <table border="0">
                           <tr>
                              <td>
                                 <input class="w-100 btn acornBtn" type="button"
                                    value="수강 취소" onClick="location.href='dropLecture.do?lecture_id=${item.lecture_id}'">   
                              </td>
                           </tr>
                        </table>
                     </div>
                     </td>
                  <tr>
                  
               </c:forEach>
            </c:when>
         </c:choose>
         <tr></tr>
      </table>
   </form>
   <div class="col-md-1"></div>
   <div class="col-md-1"></div>
   </div>
</body>
</html>