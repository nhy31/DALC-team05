<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../main/top_temp.jsp" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width">

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<style type="text/css">
.content {
	margin: 40px 200px 250px 200px;
}

.single_btn{
	background-color: #851BD8;
	border: none;
	color: #ffffff;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
	padding: 10px 23px;
	border-radius: 79px;
}
</style>

<title>홈트레이닝 메인페이지</title>
</head>

<body>

	<div class="content">
   	<div class="content_header">	<h2>오늘의 인기 홈트레이닝</h2>	</div>
   		<div class="swiper-container">
   		<div class="swiper-wrapper">
   			<c:forEach var="list" items="${today_exercise}">
        	<div class="swiper-slide">
        		<table>
        			<tr><td><a href="${list.exercise_url}" >
        				<img class="today_img" src="${list.exercise_thumb}" alt="thumbnail" ></a>
        			</td></tr>
        			<tr><td><h3><a href="${list.exercise_url}">${list.exercise_title}</a></h3></td></tr>
        			<tr><td>${list.exercise_channel}</td></tr>
        			<tr><td>조회수 ${list.exercise_views}</td></tr>
        		</table>
            	<!-- <button id="btn-mark" type="button">찜하기</button>	-->
            </div>
            </c:forEach>
      	</div>
      	
      	<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
      	<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 -->
      	<br><br>
      	<div class="swiper-pagination"></div>	<!-- 페이징 -->
   	 </div>
	
	<br><br>
	
	<div class="content_header"> <h2>질병 별 추천 홈트레이닝</h2> </div> <br>
		<div align="left">
	     	<button name="exercise_cold" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=0'/>';"> 감기 </button>
	      	<button name="exercise_hyperlipidemia" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=1'/>';"> 고지혈증 </button>
	      	<button name="exercise_pressure" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=2'/>';"> 고혈압 </button>
	      	<button name="exercise_diabetes" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=3'/>';"> 당뇨 </button>
	      	<button name="exercise_disc" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=4'/>';"> 디스크 </button>
	      	<button name="exercise_constipation" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=5'/>';"> 변비 </button>
	      	<button name="exercise_indigestion" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=6'/>';"> 소화불량 </button>
	      	<button name="exercise_kidney" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=7'/>';"> 신장병 </button>
	      	<button name="exercise_gastritis" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=8'/>';"> 위염 </button>
	      	<button name="exercise_etc" class="single_btn" onClick="location.href='<c:url value='/exercise/sick.do?sick_code=9'/>';"> 기타 </button>
	   	</div>
	   	<br>
	   	
	   	<%@ include file="../exercise/exercise_sick.jsp" %>
	</div>
	   	

	
	<script>
	new Swiper('.swiper-container', {
      slidesPerView : 4, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 30, // 슬라이드 간 간격
      slidesPerGroup : 4, // 그룹으로 묶는 개수
      
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