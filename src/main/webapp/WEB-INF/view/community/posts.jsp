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

	.post_tr{
	}

	.post_img{
	max-width: 80%;
	height: auto;
	border-radius: 6px;
	margin: 10px auto 10px auto;
	}

	.post_title{
	margin: 10px 20px 10px auto;
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: 500;
	font-size: 18px;
	line-height: 15px;
	color: #8E8E8E;
	}

	.post_add{
	margin: 10px 20px 0px auto;
	font-family: 'Nanum Gothic', sans-serif;
	font-style: normal;
	font-weight: 500;
	font-size: 14px;
	line-height: 15px;
	color: #8E8E8E;
	}

	.post_comment_num{
	color: #FF0000;
	font-weight: 600;
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


		<table>
			<colgroup>
				<col width="50%"/>
				<col width="50%"/>
			</colgroup>
			<tr>
				<td><div class="main_title1">${c.commu_name}</div>
					<div class="add">${c.commu_introduce} </div></td>
					
				<td style="text-align: right"> <!-- 내가 가입한 커뮤니티가 아니라면 글쓰기 버튼이 안보여야 할 듯  -->
					<c:if test="${writeOk == 1}">  <!-- 내가 가입한 커뮤니티일 경우 true 반환해서 글쓰기 버튼 보임  -->
					<input type ="button" value="글쓰기" class="single_square_btn" style="margin-left: 30%;"
					onclick="location.href='<c:url value='/community/post/upload'>
					<c:param name="commu_code" value="${c.commu_code}"></c:param></c:url>'"> </c:if> </td>
			</tr>
		</table>
		

		<table class="post_table">
			<colgroup>
				<col width="20%"/>
				<col width="70%"/>
				<col width="*"/>
			</colgroup>
	   		<c:forEach var="posts" items="${posts}">
				<tr class="post_tr" style="cursor:pointer" onclick="location.href='<c:url value='/community/post/detail'>
						<c:param name="post_code" value="${posts.post_code}"></c:param> </c:url>'">
					<td ><img class="post_img" src="<c:url value="/images/"/>${posts.post_img}"/>  </td>	
					<td>
   					<div class="post_title">${posts.post_title}</div>
   					<font class="post_add">${posts.member_nickName} </font>
	   				<font class="post_add"><fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${posts.post_uploadDate}"/></font>
	   				<font class="post_add">조회수 ${posts.post_hits} </font></td>
   					<td style="font-size: 18px; font-weight: 600;">댓글 &nbsp; <font class="post_comment_num">${posts.commentNum}</font></td>
   				</tr>
   				<tr><td colspan="3"><hr></td></tr>
			</c:forEach>
   	</table>


</body>
</html>
