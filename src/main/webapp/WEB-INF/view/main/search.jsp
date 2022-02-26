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
</style>

<title>키워드 검색</title>
</head>

<body>
<div class="content_start">
	<div class="row"> 
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10"> 
			총 <font color="red">${sum}</font>건의 검색결과가 있습니다.
		</div>
	</div>
	<br><br>
	
	<!-- 레시피 부분 -->
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">레시피 추천</div>
			<div class="news-div">
				<c:forEach var="list" items="${recipeByKeyword}" begin="0" end="4" step="1" varStatus="status">
				<table id="news-one">
					<tr>
						<td rowspan="3" style="width:22%; height:100%">
							<a href=""><img class="img2" src="<c:url value='${list.recipe_img}'/>" ></a>
						</td>
						<td class="news-title">${list.recipe_title}</td>
					</tr>
					<tr>
						<td id="news-contents">${list.recipe_memo}
						</td>
					</tr>
					<tr>
						<td class="news-info" align="right">조회수 ${list.recipe_hits}회</td>
					</tr>
				</table>
				</c:forEach>
				<div class="fs-4" align="right">
					<a href="<c:url value='/recipe'/>" >검색결과 더보기</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	
	<!-- 홈트 부분 -->
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">홈트레이닝 추천</div>
			<div class="news-div">
				<c:forEach var="list" items="${exerciseByKeyword}" begin="0" end="4" step="1" varStatus="status">
				<table id="news-one">
					<tr>
						<td rowspan="3" style="width:22%; height:100%">
							<a href="<c:url value='${list.exercise_url}'/>">
							<img class="img2" src="<c:url value='${list.exercise_thumb}'/>" ></a>
						</td>
						<td class="news-title">${list.exercise_title}</td>
					</tr>
					<tr>
						<td id="news-contents">채널명: ${list.exercise_channel} <br>
							조회수: ${list.exercise_views} <br>
						</td>
					</tr>
					<tr>
						<td class="news-info" align="right"> ${list.exercise_length}분</td>
					</tr>
				</table>
				</c:forEach>
				<div class="fs-4" align="right">
					<a href="<c:url value='/exercise/sick'/>" >검색결과 더보기</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	
	<!-- 현대 사회 -->
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">현대 사회</div>
			<div class="news-div">
				<c:forEach var="list" items="${commuByKeyword}" begin="0" end="4" step="1" varStatus="status">
				<table id="news-one">
					<tr>
						<td rowspan="3" style="width:22%; height:100%"></td>
						<td class="news-title">${list.commu_name }</td>
					</tr>
					<tr>
						<td class="news-contents">${list.commu_introduce }</td>
					</tr>
				</table>
				</c:forEach>
				<div class="fs-4" align="right">
					<a href="<c:url value='/community'/>" >검색결과 더보기</a>
				</div>
			</div>
		</div>
	</div>
	<br>
	
</div>

</body>
</html>