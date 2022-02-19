<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../main/top_temp.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

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
		<div align="left" class="col-lg-8 col-md-10 col-10"> 총 ${sum}건의 검색결과가 있습니다.</div>
	</div>
	<br><br>
	
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">레시피 추천</div>
			<div class="news-div">
				<c:forEach var="list" items="${recipeByKeyword}">
				<table id="news-one">
					<tr>
						<td rowspan="3" style="width:22%; height:100%">
							<a href=""><img class="img2" src="<c:url value=''/>" ></a>
						</td>
						<td class="news-title"></td>
					</tr>
					<tr>
						<td id="news-contents">채널명: 
						</td>
					</tr>
					<tr>
						<td class="news-info" align="right">분</td>
					</tr>
				</table>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">홈트레이닝 추천</div>
			<div class="news-div">
				<c:forEach var="list" items="${exerciseByKeyword}">
				<table id="news-one">
					<tr>
						<td rowspan="3" style="width:22%; height:100%">
							<a href=""><img class="img2" src="<c:url value='${list.exercise_thumb}'/>" ></a>
						</td>
						<td class="news-title">${list.exercise_title}</td>
					</tr>
					<tr>
						<td id="news-contents">채널명: ${list.exercise_channel} <br>
							조회수: ${list.exercise_views}
						</td>
					</tr>
					<tr>
						<td class="news-info" align="right">${list.exercise_length}분</td>
					</tr>
				</table>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
			<div class="fs-4" id="main_title">건강 미디어</div>
			<div class="news-div">
				<c:forEach var="list" items="${mediaByKeyword}">
				<table id="news-one">
					<tr>
					<td rowspan="3" style="width:22%; height:100%">
						<a href=""><img class="img2" src="<c:url value='${list.url}'/>" ></a>
					</td>
					<td class="news-title">${list.title }</td>
					<td class="news-contents">음식정보</td>
					<td class="news-contents">음식정보</td>
					</tr>
				</table>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="row">
	</div>
	
</div>

</body>
</html>