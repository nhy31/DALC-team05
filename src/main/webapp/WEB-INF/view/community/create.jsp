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

<title>커뮤니티 만들기</title>

<style>

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
height: 100%;
width:100%;
border-radius: 6px;
}

.sick_btns {
margin:10px 0px 0px 0px;
}

.news-div {
margin: 25px 10px 0px 10px;
}

#news-one {
margin: 0px 10px 25px 10px;
}

.news-title {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: bold;
font-size: 1.3vw;
color: #4E4E4E;
}

#news-contents {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

.news-info {
padding: 0px 25px 0px 25px;
font-style: normal;
font-weight: normal;
font-size: 0.9vw;
color: #4E4E4E;
}

.single_btn{
margin: 0 0px 0 0;
background-color: #851BD8;
border: none;
color: #ffffff;
font-size: 12px;
font-weight: bold;
text-align: center;
padding: 7px 15px;
border-radius: 6px;
}
	
.add {
font-family: 'Nanum Gothic', sans-serif;
font-style: normal;
font-weight: 500;
font-size: 13px;
line-height: 15px;
color: #8E8E8E;
/* width: 60%; */
}
.create_form {
margin: 20px 10px 100px 10px;
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
<div class="content-start">
	<div class="row">
		<div class="col-lg-2 col-md-1 col-1"></div>
		<div align="left" class="col-lg-8 col-md-10 col-10">
		<div class="fs-4" id="main_title">커뮤니티 생성하기</div>
			<div class="add">관심있는 커뮤니티를 직접 생성하세요.</div>
			<div class="create_form">
				<form action="<c:url value='/community/create.do' />" enctype="multipart/form-data">
					<div align="right"> <input class="single_btn" type="submit" value="완료"> </div>
					<div class="mb-3">
						<label class="form-label">관심질병 선택</label>
						<div class="sick_btns">     
							<c:forEach var="illness" items="${sicks}">
							<label class="box-radio-input">
							<input type="radio" name="sick_code" value="${illness.sick_code}" 
								<c:if test="${illness.checked == 1}"> checked="checked"</c:if>>
							<span>${illness.sick_name}</span></label>
							</c:forEach>	
						</div>
					</div>

					<div class="mb-3">
 						<label for="exampleFormControlInput1" class="form-label">커뮤니티 이름</label>
  						<input type="text" name="commu_name" required="required" class="form-control" id="exampleFormControlInput1" style="width:40%">
					</div>
			
					
					<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">소개글</label>
  					<textarea name="commu_introduce"  required="required" style="width:70%" class="form-control" id="exampleFormControlTextarea1" rows="5"></textarea>
					</div>
				
				</form>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>

</body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 