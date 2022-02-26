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
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);

* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 

.content_start {
padding: 10px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

.issue-title {
font-style: normal;
font-size: 0.95vw;
color: #4E4E4E;
padding: 5px 10px 0px 10px;
}

.issue-info {
font-style: normal;
font-size: 0.9vw;
color: #4E4E4E;
padding: 5px 10px 0px 10px;
}

.img1 {
height: 100%;
width:100%;
border-radius: 6px;
}

.img2 {
max-height: 100%;
max-width:100%;
border-radius: 6px;
}

.sick_btns {
margin:10px 0px 0px 10px;
}

.news-div {
margin: 10px 10px 0px 10px;
}

#news-one {
margin: 0px 10px 25px 0px;
}

.news-title {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: bold;
font-size: 1.2vw;
color: #4E4E4E;
}

#news-contents {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
background: #E1E1E1;
}

.news-info {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

.single_btn{
background-color: #851BD8;
border: none;
color: #ffffff;
font-size: 12px;
font-weight: bold;
text-align: center;
padding: 7px 15px;
border-radius: 79px;
}

.box-radio-input input[type="radio"]{
display: none;
}

.box-radio-input input[type="radio"] + span{
display: inline-block;
background: none;
border: 1.5px solid #DDDDDD;
color: #4E4E4E;
padding: 7px 15px;
font-family: -apple-system;
font-size: 12px;
text-align: center;
border-radius: 79px;
cursor: pointer;
}

.box-radio-input input[type="radio"]:checked + span{
border:1px solid #851BD8;
background:#851BD8;
color:#fff;
font-weight: bold;
}


</style>

</head>

<body>

<div class="row" style="height: 300px; width:100%">
	<div class="col-md-2"></div>
    <div class="col-md-8" style="height: 300px;" >
   		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel" style="height:300px; text-align:center;">
  			<div class="carousel-inner"style="height: 300px;">
    			<div class="carousel-item active" style="height: 300px;">
      				<img style="height: 400px; object-fit: cover; align: center;" src="<c:url value='/images/mainImage1.jpg'/>" class="d-block w-100" alt="...">
    			</div>
    			<div class="carousel-item">
     				<img style="height: 400px; object-fit: cover; align: center;" src="<c:url value='/images/mainImage2.jpg'/>" class="d-block w-100" alt="...">
   			 	</div>
    			<div class="carousel-item">
      				<img style="height: 400px; object-fit: cover; align: center;" src="<c:url value='/images/mainImage3.jpg'/>" class="d-block w-100" alt="...">
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


<div class="content"> <br><br><br>

	<!-- 질병 별 추천 레시피 -->
	<div class="fs-4" id="main_title"> 오늘의 인기 레시피</div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="list" items="${bestsR}">
				<div class="swiper-slide" >
					<table>
						<tr><td style="text-align: center;"><a href="<c:url value="/recipe/recipe_detail"><c:param name="recipe_code" value="${list.recipe_code}">
				     				</c:param></c:url>" >
						<img class="img1" src="<c:url value='${list.recipe_img}'/>" ></a></td></tr>
			        	<tr><th style="padding:5px; font-size:1vw;">${list.recipe_title}</th></tr>
			        	<tr><td style="font-size:1vw">조회수 ${list.recipe_hits}회</td></tr>
			        </table>
		      	</div>
		     </c:forEach> 
	      </div>
	      
	      <div class="swiper-button-next"></div><!-- 다음 버튼 (오른쪽에 있는 버튼) -->
	      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	      <div class="swiper-pagination"></div>
    </div>
   	<hr><br><br>
   
	<!-- 질병 별 추천 홈트레이닝 -->
	<div class="fs-4" id="main_title"> 오늘의 인기 홈트레이닝 </div>
	<div class="swiper-container">
		<div class="swiper-wrapper">
			<c:forEach var="list" items="${bestsE}">
				<div class="swiper-slide" >
					<table>
						<tr><td style="text-align: center;"> <a href="${list.exercise_url}" >
							<img class="img" style="width:300px; height: 200px; margin:10px; padding:10px; object-fit: cover; align: center;" src="<c:url value='${list.exercise_thumb}'/>" ></a>
						</td></tr>
			        	<tr><th style="padding:10px; font-size:1vw;">${list.exercise_title}</th></tr>
			        	<tr><td style="font-size:1vw;"> ${list.exercise_channel}</td></tr>
			        </table>
		      	</div>
		     </c:forEach> 
	      </div>
	      
	      <div class="swiper-button-next"></div><!-- 다음 버튼 -->
	      <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	      <div class="swiper-pagination"></div>
    </div>
   	<hr><br><br>
   	
   	<!-- 건강 미디어 -->
   	<div class="fs-4" id="main_title"> 오늘의 건강 이슈 </div>
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
		</div> <br><br>
		<div class="swiper-button-next"></div><!-- 다음 버튼 -->
	    <div class="swiper-button-prev"></div><!-- 이전 버튼 -->
	    <div class="swiper-pagination"></div>
    </div>
   	<br>
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