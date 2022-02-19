<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp" %>

<!-- 아아현 메인페이지 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width">

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

<title>아프다 아파, 현대사회</title>

<style type="text/css">
.content {
 margin: 40px 200px 250px 200px;
}

.sick_box {
width: 70px;
height: 31px;
background: #851BD8;
border-radius: 79px; 
float: left; "
}

.sick_box_font {
font-family: Roboto;
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 20px;
text-align: center;
color: #FFFFFF;
}

.container {
margin-top: 30px;
}

.category {
font-style: normal;
font-weight: 600;
font-size: 18px;
line-height: 21px;
color: #000000;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

</style>

</head>

<body>

     <div class="row" style="height: 294px;">
     <div class="col-md-2"></div>
    <div class="col-md-8" style="height: 294px; border:1px solid yellow;" >
   <div  id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel"   style="height: 294px; border:1px solid orange;">
  <div class="carousel-indicators"  style="height: 294px; border:1pb blue;">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner"  style="height: 294px; border:1px solid blue;">
    <div class="carousel-item active"  style="height: 294px; border:1px solid black;">
      <img style="height: 294px;" src="<c:url value='/images/main1.jpg'/>" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<c:url value='/images/default.jpg'/>" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="<c:url value='/images/default.jpg'/>" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  </div>
  <div class="col-md-2"></div>
  </div>
  
</div>

   <!-- 추천 레시피 부분 -->
	<div class="content">
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
	            <a href=""><img src="<c:url value='/images/testImg.jpg'/>" width="300" height="200" alt="테스트용" ></a>
	         </div>
	         <div class="swiper-slide">
	            <a href=""><img src="<c:url value='/images/testImg.jpg'/>" width="300" height="200"></a>
	         </div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg.jpg'/>" width="300" height="200"></a></div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg.jpg'/>" width="300" height="200"></a></div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg.jpg'/>" width="300" height="200"></a></div>
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
	      <button name="training_diabetes" class="disease_btn" onClick=""> 당뇨 </button>
	      <button name="training_high_pressure" class="disease_btn" onClick=""> 고혈압 </button>
	      <button name="training_low_pressure" class="disease_btn" onClick=""> 저혈압 </button>
	      <button name="training_hyperlipidemia" class="disease_btn" onClick=""> 고지혈증 </button>
	      <button name="training_etc" class="disease_btn" onClick=""> 기타 </button>
	   </div>
	   <br>
	   
	   <div class="swiper-container">
	      <div class="swiper-wrapper">
	         <div class="swiper-slide">
	            <a href=""><img src="<c:url value='/images/testImg2.jpg'/>" width="300" height="200"></a>
	         </div>
	         <div class="swiper-slide">
	            <a href=""><img src="<c:url value='/images/testImg2.jpg'/>" width="300" height="200" alt="테스트용"></a>
	         </div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg2.jpg'/>" width="300" height="200"></a></div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg2.jpg'/>" width="300" height="200"></a></div>
	         <div class="swiper-slide"><a href="">
	            <img src="<c:url value='/images/testImg2.jpg'/>" width="300" height="200"></a></div>
	      </div>
	      
	      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	      
	      <div class="swiper-pagination"></div>
	   </div>
	   <hr>
	   
	   <!-- 건강 미디어 -->
	   <br>
	    <div  class="fs-4"  id="main_title">오늘의 건강 이슈</div>
	    
<!-- 	      <div align="left"> -->
<!-- 	      <button name="media_diabetes" class="disease_btn" onClick=""> 당뇨 </button> -->
<!-- 	      <button name="media_high_pressure" class="disease_btn" onClick=""> 고혈압 </button> -->
<!-- 	      <button name="media_low_pressure" class="disease_btn" onClick=""> 저혈압 </button> -->
<!-- 	      <button name="media_hyperlipidemia" class="disease_btn" onClick=""> 고지혈증 </button> -->
<!-- 	      <button name="media_etc" class="disease_btn" onClick=""> 기타 </button> -->
<!-- 	   	  </div> -->

	   <div class="swiper-container">
	      <div class="swiper-wrapper">
	         <c:forEach var="list" items="${medias}">
		      		<div class="swiper-slide" >
			       		<table>
			        		<tr><td style="text-align: center;"><a href="${list.url}" ><img class="img" src="<c:url value='${list.image}'/>" ></a></td></tr>
			        		<tr><th style="padding:5px; font-size:1vw;">${list.title}</th></tr>
			        		<tr><td style="font-size:1vw">${list.source}&nbsp;&nbsp;&nbsp;&nbsp;${list.time}</td></tr>
			        	</table>
		      		</div>
		      	</c:forEach>
	      </div>
	      
	      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	      
	      <div class="swiper-pagination"></div>
		</div>
	</div>   
   
   <script>
   new Swiper('.swiper-container', {
      slidesPerView : 4, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 10, // 슬라이드 간 간격
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