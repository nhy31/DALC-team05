<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 하윤 0208 부트스트랩 하는중 -->
<!-- 부트스트랩 css -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">
</head>

<body>

<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li><a href="#" class="nav-link px-2 link-secondary">레시피추천</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">홈트레이닝 추천</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">건강미디어</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">커뮤니티</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2">Login</button>
        <button type="button" class="btn btn-primary">Sign-up</button>
      </div>
    </header>
</div>

</body>
</html>



<!-- <!-- 기본 상단바 (나중에 되면 링크 걸어서 따로 불러오든 코드 간소화 필요할듯) -->
<!--    	<nav class="dalcbar"> -->
<!--       <div class="dalc_name"> -->
<%--          <h2><a href="<c:url value='/main'/>">로고 이미지</a></h2> --%>
<!--       </div> -->
      
<!--       <div align = "center"> -->
<%--          <form name="mainSearch" action="/main/search" method="GET"> --%>
<!--             <input type="text" name="searchView" placeholder="검색어를 입력하세요." width="500" height="40"> -->
<%--             <input type="image" src="<c:url value='/images/search.png'/>" alt="검색버튼" width="15" height="15"> --%>
<%--          </form> --%>
<!--       </div> -->
      
<!--       <ul class="dalc_menu"> -->
<%--         <c:if test="${ses == 0}">  --%>
<%--         	<li><a href="<c:url value="/main/login" />">로그인</a></li> --%>
<%--          	<li><a href="<c:url value="/main/join"/> ">회원가입</a></li> --%>
<%--       	</c:if> --%>
      	
<%--       	<c:if test="${ses == 1}">  --%>
<%--           <li>${member_nickName}님 </li> --%>
<%--             <li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li> --%>
<%--             <li><a href="<c:url value='/member/mypage'/>">정보수정</a></li> --%>
<%--             <li><a href="<c:url value="/member/delete.do" />">탈퇴</a></li> <!-- 탈퇴기능만 한번테스트해보려고 잠깐삽입 --> --%>
<%--             <li><a href="<c:url value="/member/mybox" />">보관함</a></li> <!-- 한번테스트해보려고 잠깐삽입 --> --%>
<%--             <li><a href="<c:url value="/member/diary" />">나의 기록</a></li> <!--한번테스트해보려고 잠깐삽입 --> --%>
<%--       	</c:if> --%>
<!--       </ul> -->
<!--    	</nav> -->
<!--    <hr> -->
   
<!--    <nav class="dalcbar"> -->
<!--    <p align="center"> -->
<!--       <ul class="dalc_menu"> -->
<%--          <li><a href="<c:url value='/main/recipe'/>">레시피 추천</a></li> --%>
<%--          <li><a href="<c:url value='/main/exercise'/>">홈트레이닝 추천</a></li> --%>
<%--          <li><a href="<c:url value='/main/media'/>">건강 미디어</a></li> --%>
<%--          <li><a href="<c:url value='/main/community'/>">현대사회 커뮤니티</a></li> --%>
<!--       </ul> -->
<!--    </p> -->
<!--    </nav> -->
<!--    <hr> -->
<!--    <!-- 기본 상단바 끝 -->