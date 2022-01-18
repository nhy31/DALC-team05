<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<title>메인 페이지</title>
</head>

<body>
   <nav class="dalcbar">
      <div class="dalc_name">
         <h1><a href="<c:url value='/user/main'/>">로고 이미지</a></h1>
      </div>
      
      <ul class="dalc_menu">
         <li><a href="<c:url value='/main/recipe'/>"></a>레시피 추천</li>
         <li><a href="<c:url value='/main/exercise'/>"></a>홈트레이닝 추천</li>
         <li><a href="<c:url value='/main/media'/>"></a>건강 미디어</li>
         <li><a href="<c:url value='/main/community'/>">현대사회</a></li>
      </ul>
      
      <ul class="dalc_login">
      	<c:if test="${ses == 0}"> 
			<li><a href="<c:url value="/main/login" />">로그인</a></li>
			<li><a href="<c:url value="/main/join" />">회원가입</a></li>
		</c:if>
		<c:if test="${ses == 1 }"> 
	    	<li>${member_nickName}님 </li>
         	<li><a href="<c:url value='/main/logout.do'/>">로그아웃</a></li>
		</c:if>
    
      </ul>
   </nav>
</body>
</html>