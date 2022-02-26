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
<link rel=stylesheet href="<c:url value='/css/all.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/swiper.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/content.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/btns.css'/>" type="text/css">

	<title>커뮤니티 글쓰기 </title>

	<style>
	
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; } 

	.main_title1 {
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
	margin: 0px auto 0px auto;
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
		border:none;
		font-size: 25px;
		padding: 30px 10px 0px 10px;
		width: 100%;
	}
	
	.post_content{
		border:none;
		font-size: 18px;
		width: 100%;
		padding: 10px;
		resize: none;
	/* 	overflow-y:scroll; */
		word-wrap: break-word;
		word-break: break-word;
	
		overflow: hidden;
	}
	
	input:focus {outline:none;}
	
	input::placeholder {color:#AAA;}
	input::-webkit-input-placeholder {color:#AAA;}
	input:-ms-input-placeholder {color:#AAA;}
 
	textarea::placeholder {color:#AAA;}
	textarea::-webkit-input-placeholder {color:#AAA;}
	textarea:-ms-input-placeholder {color:#AAA;}

	
	</style>
	<script type="text/javascript" src="./jquery-3.3.1.min.js"></script>
</head>

<body style="width: 70%; margin: 0 auto 50px auto;" >
	<div class="main_title1"> 커뮤니티 글쓰기 </div>
	<hr>
	<div class="post_border">
		<div>
			<button class="single_round_btn" style="font-size: 14px;" disabled>${sick}</button>
			<font style="color: #B0B0B0">&nbsp; > &nbsp;</font> <font style="font-size: 14px; font-weight: 600">${post.commu_name}</font>
		</div>
		<form name="form" method="POST" action="<c:url value='/community/post/upload.do' />" enctype="multipart/form-data">
		<input type="hidden" name="commu_code" value="${post.commu_code}" readonly>
			<table>
				<tr>
					<td><input class="post_title" type="text" name="post_title" required="required" placeholder="제목을 입력해주세요.">  </td> 
				</tr>
				<tr><td><hr></td></tr>
				<tr>
					<td> 
					
					<div class="input-group">
			  <input type="file" class="form-control" name="img_file" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
			</div>
					
				</tr>
				<tr>
					<td><!-- <input class="post_content" type="text" name="post_content" required="required" placeholder="내용을 입력하세요. ">  -->
						<textarea rows="" cols="" class="post_content" name="post_content" required="required" placeholder="내용을 입력하세요. "></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="submit" class="single_square_btn" value="등록" onclick="">	</td>
				</tr>
			</table>
		</form>
	</div>

</body>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		  var $textarea = document.querySelector("textarea");
		  $textarea.addEventListener('keyup', function(e) {
		    this.style.height = "auto";
		    this.style.height = this.scrollHeight + "px";
		  });$textarea.dispatchEvent(new Event('keyup'));
		});
</script>

</html>
<%@ include file="../main/bottom_footers.jsp"%> 