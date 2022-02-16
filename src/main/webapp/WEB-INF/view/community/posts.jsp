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

<title>아아현 커뮤니티</title>
<style>

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

.main_title1 {
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.main_title2 {
margin: 50px 0 25 0; /*hr존재x, 60-> 50으로 수정*/
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: bold;
font-size: 22px;
line-height: 26px;
color: #000000;
}

.add {
margin: 6px 0 0 3px;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: 500;
font-size: 13px;
line-height: 15px;
color: #8E8E8E;
}

.bestPosts {
align: left;
margin: 16px;
width: 100%;
height: 200px;
background: #FFFFFF;
border: 2px solid #E7E7E7;
box-sizing: border-box;
border-radius: 6px;
}

.two-box {
}

ol {
list-style-type: decimal;
padding: 35px 30px 35px 30px;
}

li {
margin: 12px;
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: normal;
font-size: 15px;
line-height: 18px;
color: #000000;
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

   .sick_box {
        background-color: #851BD8;
        border: none;
        color: #ffffff;
        font-size: 12px;
        font-weight: bold;
        text-align: center;
        padding: 7px 13px;
        border-radius: 79px;
      }

.commu_box {
align: left;
background: #FFFFFF;
border: 2px solid #E7E7E7;
box-sizing: border-box;
border-radius: 6px;
padding: 15px 20px 15px 20px;
}
</style>
</head>

<body>

<div class="content-start">

	<div class="row">
	
		<div class="col-md-2"></div>
		<div class="col-md-8 col-12">
			<div class="commu_box">
				<div align="left" class="fs-4" id="main_title">${c.commu_name}</div>
				<div style="margin-top:10px; margin-left:20px;">소개글 : ${c.commu_introduce}</div>
				<div style="margin-top:10px; margin-left:20px;">관련질병 : 
					<span style="background-color: #851BD8; border: none; color: #ffffff; font-size: 12px; font-weight: bold; text-align: center; padding: 7px 14px; border-radius: 79px;">${c.sick_name}</span>
				</div>
			</div>
				
				<table>
   					<c:forEach var="posts" items="${posts}">
						<tr>
			   				<td>${posts.post_title}</td>
			   				<td>${posts.post_uploadDate}</td>
			   				<td>${posts.member_nickName}</td>
			   				<td>${posts.post_content}</td>
			   				<td>${posts.post_hits}</td>
			   				<td>댓글수</td>
	   					</tr>
					</c:forEach>	
   				</table>
		
		<div class="col-md-2"></div>

	</div>
</div>
					


   	
</div>

</body>
</html>