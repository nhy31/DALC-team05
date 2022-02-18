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

<title>커뮤 게시글 자세히..</title>

	<style>

	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

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

	.post_border {
	text-align:-webkit-auto;
	margin: 20px auto 0px auto;
	padding: 30px;
	background: #FFFFFF;
	border: 1.5px solid #E7E7E7;
	box-sizing: border-box;
	align: center;
	/* width: 60%; */
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
	</style>
</head>

<body style="width: 70%; margin: 0 auto 50px auto;" >

	<div class="post_border">
		<div>
			<button class="single_round_btn" style="font-size: 14px;">${post.commu_code}</button>
			<font style="color: #B0B0B0">&nbsp; > &nbsp;</font> <font style="font-size: 14px; font-weight: 600">${post.commu_name}</font>
		</div>

		<table>
			<colgroup>
				<col width="50%"/>
				<col width="50%"/>
			<tr>
				<td class="post_title" colspan="2">${post.post_title}</td>
			</tr>
			<tr><td colspan="2"><hr></td></tr>
			<tr>
				<td colspan="2" style="font-size: 17px; font-weight: 600;">${post.member_nickName}</td>
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
				<td colspan="2"><div style="font-size: 18px; margin-top: 20px;">${post.post_content}</div></td>
			</tr>
		</table>

		<hr>
		<div style="font-size: 22px;">댓글 </div>
		<table>
			<tr>
				<td rowspan="3">이미지 </td>
				<td>유저 닉네임  </td>
				<td rowspan="3">신고 </td>
			</tr>
			<tr>
				<td>댓글 내용  </td>
			</tr>
			<tr>
				<td>날짜  </td>
			</tr>
		</table>
	</div>


	<br>==============<br>
	<!-- 기능test 임시테스트 -->
	post.post_title: ${post.post_title} <br>
	post.post_title: ${post.post_title}<br>
	post.post_title: ${post.post_title}<br>
	post.commu_code:: ${post.commu_code}<br>
	post.commu_name: ${post.commu_name}<br>
	post.member_code: ${post.member_code}
	post.post_hits: ${post.post_hits}<br>
	post.post_uploadDate: ${post.post_uploadDate} <br>
	post.member_nickName: ${post.member_nickName} <br>
	myNick: ${myNick} <br>



	<div>댓글</div>

	<!-- 기능test 임시로쓴거 table -->
	<div> 나의댓글창
	<form action="">
	<table style="border: 1px solid blue;">
	<tr >
	<td style="border: 1px solid blue;" rowspan="2">내 프로필 이미지: ${me.member_image}</td>
	<td style="border: 1px solid blue;">내 닉네임: ${me.member_nickName}</td>
	</tr>
	<tr>
	<td style="border: 1px solid blue;" ><input type="text" name="comment_content">
	<input type="submit" value="댓글업로드" onclick=""></td>
	</tr>
	</table>
	</form>
	</div>
	<div>

	</div>
</body>
</html>
