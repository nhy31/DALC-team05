<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top.jsp"%>

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
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">


<title>아아현 건강미디어</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

* {
font-family: 'Nanum Gothic', sans-serif;

}

.content_start {
padding: 5px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

table, th, tr, td {
table-layout: fixed;
border: 0px solid blue;
}

.news-div {
margin: 30px 0px 0px 5px;
}

.news {
margin: 0px 0px 20px 0px;
}

.img {
height: 50%;
border-radius: 6px;
}

.news-title {
padding: 0px 0px 0px 27px;
font-style: normal;
font-weight: bold;
font-size: 19px;
line-height: 22px;
color: #4E4E4E;
}

.news-contents {
padding: 0px 27px 0px 27px;
font-style: normal;
font-weight: normal;
font-size: 14px;
line-height: 16px;
color: #4E4E4E;
background: #E1E1E1;
}

.news-info {
padding: 0px 0px 0px 27px;
font-style: normal;
font-weight: normal;
font-size: 14px;
line-height: 16px;
color: #4E4E4E;
background: #E1E1E1;
}


</style>

</head>

<body>

<div class="content_start">
	
	<div class="row">
		<div class="col-md-1"></div>
		<div align="left" class="col-md-10 col-12">
			<div class="fs-4" id="main_title">오늘의 건강 이슈</div>
			<div class="swiper-container" >
	    		
	    		<div class="swiper-wrapper"> <c:forEach var="list" items="${medias}">
		      		<div class="swiper-slide" >
			       		<table>
			        		<tr><td style="text-align: center;"><a href="${list.url}" ><img class="img" src="<c:url value='${list.image}'/>" ></a></td></tr>
			        		<tr><th style="padding:5px; font-size:1vw;">${list.title}</th></tr>
			        		<tr><td style="font-size:1vw">${list.source}&nbsp;&nbsp;&nbsp;&nbsp;${list.time}</td></tr>
			        	</table>
		      		</div>
		      	</c:forEach> </div>
	   
	   			<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
	   			<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 --> <br><br>
	   			<div align="center" class="swiper-pagination"></div>	<!-- 페이징 -->
 			</div>
 		</div>
 		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
 		<div align="left" class="col-md-10 col-12">
    		<div class="fs-4" id="main_title">질병별 건강뉴스
    			<div class="btn-group" style="margin-left:15px">
  					<button class="btn btn-secondary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false"> 질병선택 </button>
  					<ul class="dropdown-menu"></ul>
				</div>
			</div>
			<div style="margin-top:30px;"> 
     			<c:forEach var="list" items="${medias2}">
      				
      				<div class="row">
    
      					<div class="col-sm-4"><a href="${list.url}"><img src="<c:url value='${list.image}'/>" ></a></div>
      
      					<div class="col-sm-8" style="background-color:red;"> </div>
      				</div>
      				<table> 
       					<tr>
        					<td  rowspan="3"><a href="${list.url}"><img class="img" src="<c:url value='${list.image}'/>" ></a></td>
       						<td  style="font-size:1vw" class="news-title">${list.title}</td>
      					</tr>
      					<tr>
       						<td  style="font-size:1vw" class="news-contents">${list.contents}</td>
      					</tr>
      					<tr>
       						<td  style="font-size:1vw" class="news-info" >${list.source}    ${list.time}</td>     
      					</tr>
     				</table> <br><br>
     			</c:forEach>   
     		</div>
  		</div>
  		<div class="col-md-1"></div>
  	</div></div>


        



   <script>
   
   new Swiper('.swiper-container', {
      slidesPerView : 3, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 10, // 슬라이드 간 간격
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