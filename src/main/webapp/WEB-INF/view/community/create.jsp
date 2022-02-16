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
.content_start {
padding: 10px 10px 5px 10px;
}

#main_title {
font-style: normal;
font-weight: bold;
color: #000000;
}

table, th, tr, td {
border: 1px solid black;
}

.single_btn {
        background-color: #851BD8;
        border: none;
        color: #ffffff;
        font-size: 17px;
        font-weight: bold;
        text-align: center;
        padding: 10px 23px;
        border-radius: 79px;
      }


</style>


    
</head>

<body >
<div class="content-start">
	<div class="row">
		<div class="col-md-1"></div>
		<div align="center" class="col-md-10 col-12">
			<div style="margin:20px 10px 20px 10px;" align="center" class="fs-4" id="main_title">커뮤니티 만들기</div>
			<div style="margin-top:20px">
				<form action="<c:url value='/community/create.do' />" enctype="multipart/form-data">
					<div class="mb-3">
						<label class="form-label">관련질병 선택</label><br>
						<select name="sick_code">
							<c:forEach var="illness" items="${sicks}">
								<option value="${illness.sick_code}">${illness.sick_name}</option>
							</c:forEach>
						</select>
					</div>
					<div class="mb-3">
						<label class="form-label">커뮤니티 이름</label><br>
						<input style="width:40%;" type="text" name="commu_name" required="required">
					</div>
					<div class="mb-3">
						<label class="form-label">소개글</label><br>
						<input  style="width:40%; height:100px" type="text" name="commu_introduce" required="required">
					</div>
					<input class="single_btn" type="submit" value="완료">
				</form>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
</div>

</body>
</html>