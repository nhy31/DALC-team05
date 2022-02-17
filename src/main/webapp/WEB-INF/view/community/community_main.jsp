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

<!-- 외부 스타일 링크 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- 내부 스타일 링크 -->
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btns.css'/>" type="text/css">

	<title>아아현 커뮤니티</title>
	
	<style>
	
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
	
	.main_title1 {
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: bold;
	font-size: 22px;
	line-height: 26px;
	color: #000000;
	margin: 30px auto 5px auto;
	/* width: 60%; */
	}
	
	.main_title2 {
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: bold;
	font-size: 22px;
	line-height: 26px;
	color: #000000;
	margin: 50px auto 0px auto;
	/* width: 60%; */
	}
	
	.add {
	margin: 0px auto 15px auto;
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: 500;
	font-size: 13px;
	line-height: 15px;
	color: #8E8E8E;
	/* width: 60%; */
	}
	
	.bestPosts {
	text-align:-webkit-auto;
	margin: 0px auto 0px auto;
	padding: 30px;
	background: #FFFFFF;
	border: 1.5px solid #E7E7E7;
	box-sizing: border-box;
	border-radius: 6px;
	align: center;
	/* width: 60%; */
	}
	
	.rank_num{
		font-size: 17px;
		font-weight: 600;
	}
	
	td {
	/* margin: 12px;
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: normal;
	line-height: 18px;
	color: #000000; */
	font-size: 15px;
	text-align: -webkit-auto;
	}
	
	.post_table{
	border: 3;
	bordercolor: blue;
	frame: void;
	rules: rows;
	}
	
	.post_tr{
		margin: 30px;
		padding: 30px;
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

<body style="width: 70%; margin: 0 auto 50px auto;" >
	<div class="main_title1">이번 주 인기글</div>
	<div class="add">매주 업데이트 되는 인기글을 확인하세요.</div>
		<div  class="bestPosts">		
		<table>
			<colgroup>
				<col width="4%"/>
				<col width="48%"/>
				<col width="*"/>
				<col width="4%"/>
				<col width="48%"/>
			</colgroup> 
			<c:forEach var="i" begin="0" end="4">
			<tr>
				<td class="rank_num"  style="cursor:pointer;" onclick="location.href='<c:url value='/community/post/detail'>
					<c:param name="post_code" value="${BestPosts[i].post_code}"></c:param> </c:url>'">${i+1 } &nbsp;</td>
				<td style="cursor:pointer;" onclick="location.href='<c:url value='/community/post/detail'>
					<c:param name="post_code" value="${BestPosts[i].post_code}"></c:param> </c:url>'">
					${BestPosts[i].post_title}</td>
					
				<td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				
				<td class="rank_num" style="cursor:pointer;" onclick="location.href='<c:url value='/community/post/detail'>
					<c:param name="post_code" value="${BestPosts[i].post_code}"></c:param> </c:url>'">${i+6 } &nbsp;</td>
				<td style="cursor:pointer;" onclick="location.href='<c:url value='/community/post/detail'>
					<c:param name="post_code" value="${BestPosts[i+5].post_code}"></c:param> </c:url>'">
					${BestPosts[i+5].post_title}</td>
			</tr>
			</c:forEach>
		</table>
		</div>


	<div class="main_title1">나의 커뮤니티 </div>
	<div class="add">관심있는 커뮤니티를 편집하세요.</div>
	<div  class="bestPosts">		
		<table>
			<colgroup>
				<col width="30%"/>
				<col width="40%"/>
				<col width="50"/>
			</colgroup>
		</table>
	</div>	

</body>
</html>