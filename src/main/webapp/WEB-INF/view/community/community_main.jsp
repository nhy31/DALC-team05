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

	@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
	* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 

	.main_title1 {
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: bold;
	font-size: 22px;
	line-height: 26px;
	color: #000000;
	margin: 30px auto 8px auto;
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

	table{
		table-layout: auto; 
		width: 100%; 
		table-layout: fixed; 
		word-break:break-all;
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
	
	.commu{
		padding: 10px 20px 10px 0;
	}

	</style>
</head>

<body style="width: 70%; margin: 0 auto 50px auto;" >
	<div class="main_title1">이번 주 인기글</div>
	<div class="add">매주 업데이트 되는 인기글을 확인하세요.</div>
		<div class="bestPosts">
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
		<div class="bestPosts">
		<table>
			<colgroup>
				<col width="15%"/>
				<col width="*"/>
				<col width="50%"/>
			</colgroup>
			
			<c:forEach var="my" items="${MyCommuList}">
			<tr>
				<td class="commu">
					<button onclick="location.href='<c:url value='/community/join/cancel'>
							<c:param name="commu_code" value="${my.commu_code}"></c:param> </c:url>'"
					type="button" class="single_round_btn" style="font-size: 13px; "
					onMouseOver='this.innerHTML="삭제 "; this.style.backgroundColor="#757575"' 
					onMouseOut='this.innerHTML="${my.sick_name}"; this.style.backgroundColor=""'>
					${my.sick_name}</button> </td>
						 
				<td class="commu" style="font-size: 16px; cursor:pointer;" 
					onclick="location.href='<c:url value='/community/posts'>
					<c:param name="commu_code" value="${my.commu_code}"></c:param></c:url>'">
					${my.commu_name}   </td> 
				
				<td class="commu" style="font-size: 15px; cursor:pointer;"
					onclick="location.href='<c:url value='/community/posts'>
					<c:param name="commu_code" value="${my.commu_code}"></c:param></c:url>'">
					${my.commu_introduce}</td>
			</tr>	
			</c:forEach>
			
			
		</table>
	</div>
				
	
	<div class="main_title1">전체 커뮤니티 </div>
		<div class="bestPosts">
		<table>
			<colgroup>
				<col width="15%"/>
				<col width="*%"/>
				<col width="50%"/>
			</colgroup>
			
			<c:forEach var="list" items="${CommuList}">
							
			<tr style="cursor:pointer;">
				<td class="commu">
					<button onclick="location.href='<c:url value='/community/join'>
						<c:param name="commu_code" value="${list.commu_code}"></c:param> </c:url>'"
						type="button" class="single_round_btn" style="font-size: 13px; background-color:#757575 !important;"
						onMouseOver='this.innerHTML="가입"; this.style.backgroundColor=""' 
						onMouseOut='this.innerHTML="${list.sick_name}"; this.style.backgroundColor="#757575"'>
					${list.sick_name}	</button> </td>
					
				<td class="commu" style="font-size: 16px"
					onclick="location.href='<c:url value='/community/posts'>
					<c:param name="commu_code" value="${list.commu_code}"></c:param></c:url>'">
					${list.commu_name}</td>
				
				<td class="commu" style="font-size: 15px"
					onclick="location.href='<c:url value='/community/posts'>
					<c:param name="commu_code" value="${list.commu_code}"></c:param></c:url>'">
					${list.commu_introduce}</td>
			</tr>	
			</c:forEach>
		
		</table>
	</div>
	
	<div style="cursor:pointer;">
		<div class="main_title1" onclick="location.href='<c:url value='/community/create' />'">커뮤니티 생성 &nbsp; ></div>
		<div class="add" onclick="location.href='<c:url value='/community/create' />'">관심있는 커뮤니티를 직접 생성하세요. </div>
	</div>


</body>
</html>
