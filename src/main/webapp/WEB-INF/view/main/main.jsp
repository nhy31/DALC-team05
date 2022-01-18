<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 아아현 메인페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<title>아프다 아파, 현대사회</title>
</head>

<body>
   <nav class="dalcbar">
      <div class="dalc_name">
         <h1><a href="<c:url value='/main'/>">로고 이미지</a></h1>
      </div>
      
      <ul class="dalc_menu">
         <li><a href="<c:url value='/main/recipe'/>">레시피 추천</a></li>
         <li><a href="<c:url value='/main/exercise'/>">홈트레이닝 추천</a></li>
         <li><a href="<c:url value='/main/media'/>">건강 미디어</a></li>
         <li><a href="<c:url value='/main/community'/>">현대사회</a></li>
      </ul>
      
      <ul class="dalc_login">
      	<c:if test="${ses == 0}"> 
			<li><a href="<c:url value="/main/login" />">로그인</a></li>
			<li><a href="<c:url value="/main/join" />">회원가입</a></li>
		</c:if>
		<c:if test="${ses == 1}"> 
	    	<li>${member_nickName}님 </li>
         	<li><a href="<c:url value='/main/logout.do'/>">로그아웃</a></li>
		</c:if>
    
      </ul>
   </nav>
</body>
</html>