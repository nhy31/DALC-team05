<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">

<title>아아현 레시피추천</title>

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
margin-top: 10px;
background-color:#ffffff;;
border: 1px solid #DDDDDD;
color:#4E4E4E;
font-size: 0.7vw;
text-align: center;
padding: 3px 9px;
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
<div class="content_start">
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">오늘의 인기 레시피</div>
			<div class="swiper-container" >
	   			<div class="swiper-wrapper"> <c:forEach var="r" items="${bests}">
		        	<div class="swiper-slide">
			        	<table style="text-align:left;">
			        		<tr><td style="text-align: center; width: 300px; height: 200px;">
			        		<a href="<c:url value="/recipe/recipe_detail"><c:param name="recipe_code" value="${r.recipe_code}">
				     				</c:param></c:url>"><img class="img1" src="<c:url value='${r.recipe_img}'/>"></a></td></tr>
			        		<tr><th class="issue-title">${r.recipe_title}</th></tr>
			        		<tr><td class="issue-info">조회수 ${r.recipe_hits}회</td></tr>
			        	</table>
		            </div>
		        </c:forEach></div>
		        
				<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
      			<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 --> <br><br>
      			<div class="swiper-pagination"></div>	<!-- 페이징 -->
   	 		</div>
   	 		
			<div class="fs-4" id="main_title">질병별 추천레시피 &nbsp;&nbsp;
			<a href="<c:url value='/recipe/all'/>" ><font style="font-size: 0.8vw; color: #4E4E4E; font-weight: normal;">레시피 모두보기 click!</font></a></div>
				<div class="news-info" align="right">
					
				</div>
			 	<div class="sick_btns">     
					<c:forEach var="illness" items="${sicks}">
							<label class="box-radio-input">
							<input type="radio" onclick="location.href='<c:url value='/recipe/sick'>
							<c:param name="sick_code" value="${illness.sick_code}"></c:param></c:url>'" 
							name="sick_code" value="${illness.sick_code}" <c:if test="${illness.checked == 1}"> checked="checked"</c:if>>
							<span>${illness.sick_name}</span></label>
					</c:forEach>	
				</div>
			<div class="news-div"> 
			    <c:forEach var="list" items="${recipes}"> 
					<div>
						<table id="news-one">
				        		<tr>
				        			<td rowspan="3" style="width:22%; height:100%">
				        				<a href="">
				        				<img class="img2" src="<c:url value='${list.recipe_img}'/>" ></a> 
				        				
				        			</td>
				            		<td class="news-title">
				            			${list.recipe_title}&nbsp;&nbsp;<button type="button" 
				     				onclick="location.href='<c:url value="/recipe/recipe_detail"><c:param name="recipe_code" value="${list.recipe_code}">
				     				</c:param></c:url>'" class="single_btn">레시피 보러가기</button>
				            		</td>
				     			</tr>
				     		
				            	<tr>
				            		<td id="news-contents">
				            			[레시피 한줄소개] ${list.recipe_memo}
				            		</td>
				            	</tr>
				            
				            	<tr>
				     				<td class="news-info">
				     					<div>약 ${list.recipe_person}</div>
				     					<div>소요시간 : ${list.recipe_time} 예상</div>  
				            	</tr>			       		
						</table>					
					</div>
				</c:forEach>
			</div>
			
 		</div>
 		<div class="col-lg-2 col-md-1 col-1"></div>
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
<%@ include file="../main/bottom_footers.jsp"%> 