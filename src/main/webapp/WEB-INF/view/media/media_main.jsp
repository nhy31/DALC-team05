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
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css"> 
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">

<title>아아현 건강미디어</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

* {
font-family: 'Nanum Gothic', sans-serif;

}
.main_title1 {
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.main_title2 {
margin: 30px 0 10px 0; /*hr 기준으로 위아래 30px씩*/
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

table, th, tr, td {
table-layout: fixed;
border: 0px solid blue;
}

.article-img {
width: 223px;
height: 152px;
table-layout: fixed;
}

.article-title {
padding: 7px;
height: 50px;
text-align: left;
word-break:break-all;
table-layout: fixed;
/* font-style: normal; */
/* font-weight: normal; */
/* font-size: 13px; */
}

.article-info1 {
padding: 0px 0px 0px 15px;
height: 0px;
text-align: left;
word-break:break-all;
table-layout: fixed;
font-style: normal;
font-weight: 300;
font-size: 12px;
line-height: 14px;
}

.article-info2 {
padding: 0px 22px 0px 0px;
text-align: right;
font-style: normal;
font-weight: 300;
font-size: 12px;
line-height: 14px;
text-align: right;
}

.sick_box {
width: 67px;
height: 31px;
background: #851BD8;
border-radius: 79px; 
text-align:center;
display:table-cell;
vertical-align:middle;

}

.sick_box_font {
font-style: normal;
font-weight: bold;
font-size: 15px;
line-height: 20px;
text-align: center;
color: #FFFFFF;
text-align: center;
}

.news-div {
margin: 30px 0px 0px 5px;
}

.news {
margin: 0px 0px 20px 0px;
}

.img {
width: 223px;
height: 152px;
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

.btn btn-primary {
width: 67px;
height: 31px;
background: #851BD8;
border-radius: 79px; 
text-align:center;
display:table-cell;
vertical-align:middle;
}

</style>

</head>

<body>

<div class="content-start">

<div> <!-- 질병버튼 이걸로 쓸것임 -->
<a class="btn btn-primary" href="#" role="button">Link</a>
<button class="btn btn-primary" type="submit">Button</button>
<input class="btn btn-primary" type="button" value="Input">
<input class="btn btn-primary" type="submit" value="Submit">
<input class="btn btn-primary" type="reset" value="Reset">
</div>
  
  	<div align="left">
		<div class="main_title1">오늘의 건강 이슈</div>
		
		<div class="swiper-container">
   			<div class="swiper-wrapper">		
   				<c:forEach var="list" items="${medias}">
		        	<div class="swiper-slide">
			        	<table>
	        				<tr><td colspan="2" style="text-align: center;"><a href="${list.url}" >
	        					<img class="img" src="<c:url value='${list.image}'/>" ></a></td></tr>
	        				<tr><th colspan="2" class="article-title">${list.title}</th></tr>
	        				<tr>
	        					<td class="article-info1">${list.source}</td>
	        					<td  class="article-info2">${list.time}</td>
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
   	
   	<div align="left">
	<div class="main_title2">질병별 건강뉴스</div>
		<div>     
			<table> 
				<tr>
					<c:forEach var="illness" items="${sicks}">
					 	<th>
					 		<input class="btn btn-primary" type="button" value="${illness.sick_name}" 
					 		onclick="location.href='<c:url value='/media/crawling2'>
					 				<c:param name="sick_code" value="${illness.sick_code}"></c:param> 
					 			</c:url>'" />
						</th>
					</c:forEach>
				</tr>
				
			</table>
		</div>
		
        <div class="news-div"> 
        	<c:forEach var="list" items="${medias2}">
			<table class="news">
        		<tr>
        			<td rowspan="3">
        				<a href="${list.url}">
        				<img class="img" src="<c:url value='${list.image}'/>" ></a>
        			</td>
            		<td class="news-title">
            			${list.title}
            		</td>
            	<tr>
            		<td class="news-contents"> 
            			${list.contents}
            		</td>
            	</tr>
            	<tr>
            		<td class="news-info" >
            			${list.source} 	${list.time}
            		</td>     
            	</tr>
            	
            </table>
           </c:forEach>
      
 	</div>
 	</div>
 	</div>
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