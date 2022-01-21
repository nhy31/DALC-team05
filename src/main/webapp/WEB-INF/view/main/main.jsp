<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 아아현 메인페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width">

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">

<title>아프다 아파, 현대사회</title>
</head>

<body>

   <nav class="dalcbar">
      <div class="dalc_name">
         <h2><a href="<c:url value='/main'/>">로고 이미지</a></h2>
      </div>
      
      <div align = "center">
         <form name="mainSearch" action="/main/search" method="GET">
            <input type="text" name="searchView" placeholder="검색어를 입력하세요." width="700" height="50">
            <input type="image" src="<c:url value='/images/search.png'/>" alt="검색버튼" width="15" height="15">
         </form>
      </div>
      
      <ul class="dalc_menu">
         <c:if test="${ses == 0}"> 
         <li><a href="<c:url value="/main/login" />">로그인</a></li>
         <li><a href="<c:url value="/main/join" />">회원가입</a></li>
         
      </c:if>
      <c:if test="${ses == 1}"> 
          <li>${member_nickName}님 </li>
            <li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
            <li><a href="<c:url value="/member/delete.do" />">탈퇴</a></li> <!-- 탈퇴기능만 한번테스트해보려고 잠깐삽입 -->
      </c:if>
      </ul>
   </nav>
   <hr>
   
   <nav class="dalcbar">
   <p align="center">
      <ul class="dalc_menu">
         <li><a href="<c:url value='/main/recipe'/>">레시피 추천</a></li>
         <li><a href="<c:url value='/main/exercise'/>">홈트레이닝 추천</a></li>
         <li><a href="<c:url value='/main/media'/>">건강 미디어</a></li>
         <li><a href="<c:url value='/main/community'/>">현대사회</a></li>
      </ul>
   </p>
   </nav>
   <hr>
   
   <div class="dalc_img" align="center">
      <img id="mainImg" src="<c:url value='/images/default.jpg'/>" alt="추후 메인 이미지" width="300" height="300"/>
   </div>
   
   <!-- 추천 레시피 부분-->
   <br>
   <h1><font size="5" face="돋움">질병 별 추천 레시피</font></h1>
      <div align="left">
      <button name="recipe_diabetes" class="disease_btn" onClick=""> 당뇨 </button>
      <button name="recipe_high_pressure" class="disease_btn" onClick=""> 고혈압 </button>
      <button name="recipe_low_pressure" class="disease_btn" onClick=""> 저혈압 </button>
      <button name="recipe_hyperlipidemia" class="disease_btn" onClick=""> 고지혈증 </button>
      <button name="recipe_etc" class="disease_btn" onClick=""> 기타 </button>
   </div>
   <br>
   
   <!-- swiper : 위 버튼 누른거에 따라서 링크 구현필요할듯 -->
   <div class="swiper-container">
      <div class="swiper-wrapper">
         <div class="swiper-slide">
            <a href=""><img src="/images/testImg.jpg"></a>
         </div>
         <div class="swiper-slide">
            <a href=""><img src="<c:url value='/images/testImg.jpg'/>" alt="테스트용"></a>
         </div>
         <div class="swiper-slide"><a href="">
            <img src="<c:url value='/images/testImg.jpg'/> "></a></div>
         <div class="swiper-slide"><a href="">
            <img src="<c:url value='/images/testImg.jpg'/> "></a></div>
         <div class="swiper-slide"><a href="">
            <img src="<c:url value='/images/testImg.jpg'/> "></a></div>
      </div>
      
      <!-- 네비게이션 -->
      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
      
      <!-- 페이징 -->
      <div class="swiper-pagination"></div>
   </div>
   <hr>
   
   <!-- 질병 별 추천 홈트레이닝 -->
    <br>
    <h1><font size="5" face="돋움">질병 별 추천 홈트레이닝</font></h1>
      <div align="left">
      <button name="recipe_diabetes" class="disease_btn" onClick=""> 당뇨 </button>
      <button name="recipe_high_pressure" class="disease_btn" onClick=""> 고혈압 </button>
      <button name="recipe_low_pressure" class="disease_btn" onClick=""> 저혈압 </button>
      <button name="recipe_hyperlipidemia" class="disease_btn" onClick=""> 고지혈증 </button>
      <button name="recipe_etc" class="disease_btn" onClick=""> 기타 </button>
   </div>
   <br>
   
   <!-- 페이징 처리 -->
   <script>
   new Swiper('.swiper-container', {
      slidesPerView : 3, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 30, // 슬라이드 간 간격
      slidesPerGroup : 3, // 그룹으로 묶는 개수
      
      // 그룹수가 맞지 않을 경우 빈칸으로 메우기
      loopFillGroupWithBlank : true,
      loop : true, // 무한 반복
      
      pagination : { // 페이징
         el : '.swiper-pagination',
         clickable : true, // 페이징을 클릭하면 해당 영역으로 이동 <- 필요시 지정
      },
      
      navigation : { // 네비게이션
         nextEl : '.swiper-button-next', // 다음 버튼 클래스명
         prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
      },   
   });
   </script>
   
</body>
</html>