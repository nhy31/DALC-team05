<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="../main/top_temp.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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

<style  type="text/css">
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
<div class="content_start">
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">오늘의 건강 이슈</div>
			<div class="swiper-container" >	
	    		<div class="swiper-wrapper"> <c:forEach var="list" items="${medias}">
		      		<div class="swiper-slide" >
			       		<table>
			        		<tr><td style="text-align: center;"><a href="${list.url}" ><img class="img1" src="<c:url value='${list.image}'/>" ></a></td></tr>
			        		<tr><th class="issue-title">${list.title}</th></tr>
			        		<tr><td class="issue-info ">${list.source}&nbsp;&nbsp;&nbsp;&nbsp;${list.time}</td></tr>
			        	</table>
		      		</div>
		      	</c:forEach> </div>

	   			<div class="swiper-button-next"></div>	<!-- 오른쪽 버튼 -->
	   			<div class="swiper-button-prev"></div>	<!-- 왼쪽 버튼 --> <br>
	   			<div align="center" class="swiper-pagination"></div>	<!-- 페이징 -->

 			</div>
 			<div class="fs-4" id="main_title">질병별 건강뉴스</div>
			 	<div class="sick_btns">     
					<c:forEach var="illness" items="${sicks}">
							<label class="box-radio-input">
							<input type="radio" onclick="location.href='<c:url value='/media/crawling'>
							<c:param name="sick_code" value="${illness.sick_code}"></c:param></c:url>'" 
							name="sick_code" value="${illness.sick_code}" <c:if test="${illness.checked == 1}"> checked="checked"</c:if>>
							<span>${illness.sick_name}</span></label>
					</c:forEach>	
				</div>
		    <div class="news-div"> 
		    	<c:forEach var="list" items="${medias2}"> 
					<table id="news-one">
				        		<tr>
				        			<td rowspan="3" style="width:22%; height:100%">
				        				<a href="${list.url}">
				        				<img class="img2" src="<c:url value='${list.image}'/>" ></a>
				        			</td>
				            		<td class="news-title">
				            			${list.title}
				            		</td>
				            	<tr>
				            		<td id="news-contents">
				            			${list.contents}
				            		</td>
				            	</tr>
				            	<tr>
				            		<td align="right" class="news-info" >
				            			${list.source} 	${list.time}
				            		</td>     
				            	</tr>
				      </table>
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