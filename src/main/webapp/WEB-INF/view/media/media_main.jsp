<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">
<title>미디어 메인페이지</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

.main_title1 {
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.main_title2 {
margin: 30px 0 0 0;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
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

.img {
width: 223px;
height: 152px;
border-radius: 6px;}

</style>

</head>

<body>

<div class="content-start">
  
  	<div align="left">
		<div class="main_title1">이번 주 인기글</div>
		<div class="swiper-container">
   			<div class="swiper-wrapper">		
   				<c:forEach var="list" items="${medias}">
		        	<div class="swiper-slide">
			        	<table style="text-align:left">
	        				<tr><td colspan="2"><a href="${list.url}"><img class="img" src="<c:url value='${list.image}'/>" ></a></td></tr>
	        				<tr><th colspan="2">${list.title}</th></tr>
	        				<tr>
	        					<td >${list.source}</td>
	        					<td style="text-align:right"> ${list.time}&nbsp; </td>
	        				</tr>
	        			</table>
		            </div>         
	            </c:forEach>
	         </div>
	         
      		<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
      		<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 -->
      		<br><br><br>
      		<div align="center" class="swiper-pagination"></div>	<!-- 페이징 -->
   		</div>
   	<div>   
   	
   	<h2>질병별 건강뉴스</h2>
		<div>     
			<table> 
				<tr>
					<c:forEach var="illness" items="${sicks}">
					 	<th >
					 		<div class="sick_box">
					 			<a href='
					 			<c:url value='/media/crawling'>
					 				<c:param name="sick_code" value="${illness.sick_code}"></c:param> 
					 			</c:url>' >
					 			 <span class="sick_box_font"> ${illness.sick_name} </span> </a>  
					 		</div>
						</th>
					</c:forEach>
				</tr>
				
			</table>
   			
		</div>
        <table> 
        	<c:forEach var="list" items="${medias2}">
        		<tr>
        			<td rowspan="2">
        				<a href="${list.url}">
        				<img class="img" src="<c:url value='${list.image}'/>" width="300" height="200" alt="테스트용" ></a>
        			</td>
            		<th colspan="2">
            			${list.title}
            		</th>
            		<td>
            		</td>
            	</tr>
            	<tr>
            		<td>
            			${list.source}
            		</td>
            		<td>
            		${list.time}
            		</td></tr>
           </c:forEach>
         </table>
 	</div>
 	
	</div>
	
   <script>
   new Swiper('.swiper-container', {
      slidesPerView : 4, // 동시에 보여줄 슬라이드 rotn
      spaceBetween : 20, // 슬라이드 간 간격
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