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
<link rel=stylesheet href="<c:url value='/css/btns.css'/>" type="text/css">

<title>커뮤 게시글 자세히..</title>

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
	}

	.post_border {
	text-align:-webkit-auto;
	margin: 20px auto 0px auto;
	padding: 30px;
	background: #FFFFFF;
	border: 1.5px solid #E7E7E7;
	box-sizing: border-box;
	align: center;
	}

	table{
	table-layout: auto;
	width: 100%;
	table-layout: fixed;
	word-break:break-all;
	}

	tr{
	margin: 10px auto 10px auto;
	}

	.post_title{
		font-size: 25px;
		padding: 30px 10px 0px 10px;
		width: 100%;
	}

	.post_add_left{
		font-size: 13px;
		color: #595959;
	}
	.post_add_right{
		font-size: 13px;
		color: #000;
	}

	.post_content{
		font-size: 18px;
		width: 100%;
		padding: 10px 10 10px 10;
		resize: none;
		overflow-y:scroll;
		cols: 10;
	}
	
	.member_nickname{
		font-size: 17px; 
		font-weight: 600;
	}
	
	.member_img{
 	max-width: 50%;
	height: auto;
	border-radius: 50%;
	margin: 10px auto 10px auto;
	}
	
	.reply_border{
	text-align:-webkit-auto;
	margin: 20px auto 0px auto;
	padding: 30px;
	background: #FFFFFF;
	border: 1.5px solid #E7E7E7;
	box-sizing: border-box;
	align: center;
	width: 90%;
	border-radius: 6px;
	}
	
	.reply_content{
		border:none;
		font-size: 16px;
		width: 100%;
		padding: 10px;
		resize: none;
		overflow-y:scroll;
		cols: 10;
	}
	
	input::placeholder {color:#727272;}
	input::-webkit-input-placeholder {color:#727272;}
	input:-ms-input-placeholder {color:#727272;}
 
	textarea::placeholder {color:#727272;}
	textarea::-webkit-input-placeholder {color:#727272;}
	textarea:-ms-input-placeholder {color:#727272;}
	</style>
</head>

<body style="width: 70%; margin: 0 auto 50px auto;" >

	<div class="post_border">
		<div>
			<button class="single_round_btn" style="font-size: 14px;" disabled>${sick}</button>
			<font style="color: #B0B0B0">&nbsp; > &nbsp;</font> <font style="font-size: 14px; font-weight: 600">${post.commu_name}</font>
		</div>

		<!-- 게시글 내용  -->
		<table>
			<colgroup>
				<col width="50%"/>
				<col width="50%"/>
			</colgroup>	
			<tr>
				<td class="post_title" colspan="2">${post.post_title}</td>
			</tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr>
				<td colspan="2" class="member_nickname">${post.member_nickName}</td>
			</tr>
			<tr>
				<td><font class="post_add_left"><fmt:formatDate pattern="yyyy.MM.dd" value="${post.post_uploadDate}"/> </font>
					<font style="margin-right: 10px; margin-left: 10px; color: #DBDBDB;"> | </font>
					<font class="post_add_left">조회수 ${post.post_hits}</font></td>
				<td style="text-align:right;"><font class="post_add_right">신고</font>
					<font style="margin-right: 10px; margin-left: 10px; color: #DBDBDB;"> | </font>
					<font class="post_add_right">댓글 ( n )</font>
					<font style="margin-right: 10px; margin-left: 10px; color: #DBDBDB;"> | </font>
					<font class="post_add_right">URL 복사</font> </td>
			</tr>
			<tr>
				<td colspan="2"><div style="font-size: 18px; margin-top: 20px; white-space:pre;">${post.post_content}</div></td>
			</tr>
		</table>

		<!-- 남이 쓴 댓글들   -->
		<hr>
		<div style="font-size: 22px;">댓글</div>
			<c:forEach var="m" items="${comments}">
				<table style="margin-top: 10px;">
				
					<colgroup>
						<col width="10%"/>
						<col width="80%"/>
						<col width="10%"/>
					</colgroup>
					<tr style="vertical-align:top; padding-top: 5px;">
						<td rowspan="3" style="margin: 5px;"><img class="member_img" src="<c:url value='${m.member_image}'/>"/>  </td>
						<td class="member_nickname">${m.member_nickName}</td>
						<td rowspan="3" style="text-align:right; padding-right: 30px;">신고 
					</tr>
					<tr>
						<td style="font-size: 16px; margin-top: 5px;">${m.comment_content}</td>
					</tr>
					<tr>
						<td class="post_add_left" style="margin-top: 10px;"><font style="margin-right: 8px;">
						<fmt:formatDate value="${m.comment_date}" pattern="yy/MM/dd HH:mm"/></font>  
							<font>답글쓰기${m.comment_depth} </font>
							
					
						</td>
					</tr>
				</table>
			</c:forEach>
		<hr>
	
		<!--  내가 댓글 쓰기  -->
		<form action="<c:url value='/community/post/comment/upload' />">
			<table class="reply_border">
				<tr>
					<td class="member_nickname" style="padding: 30px 10px 5px 30px;">${me.member_nickName}
						<input type="hidden" name="post_code" value="${post.post_code}"> </td>
				</tr>		
				<tr>
					<td style="padding: 5px 30px 10px 30px;">	<!-- input type textarea로 바꿔야할듯  -->
						<input class="reply_content" type="text" name="comment_content" placeholder="댓글을 남겨주세요." required></td>
				</tr>
				<tr>
					<td style="text-align: right; padding: 10px 30px 30px 30px"><input class="single_square_btn" type="submit" value="등록" ></td>
				</tr>
			</table>
		</form>
	</div>



</body>
</html>
