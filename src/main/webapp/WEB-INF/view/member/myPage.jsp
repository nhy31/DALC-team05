<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- 하윤 0208 부트스트랩 하는중 -->
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

<title>회원정보 수정</title>  
</head>

<body>
<!-- 카카오, 네이버 연동 추가해야함  -->
<div class = "content">
	<h2> 회원 가입 </h2>
	<p class="hr_write">나의 정보</p>
	
	<form name="form" method="POST" action="<c:url value='/member/my/update.do' />" enctype="multipart/form-data">
		<table>
			<tr>
				<th> 이름 </th>
				<td> <input type="text" name="member_name" value="${me.member_name}" readonly>  </td>
			</tr>
			<tr>
				<th> 아이디(이메일) </th>
				<td> <input type="email" name="member_id" readonly value="${me.member_id}"> 
				</td>
			</tr>
			<tr>
				<th> 닉네임 </th>
				<td> <input type="text" name="member_nickName" value="${me.member_nickName}" required="required"> 
					 <input type="button" onclick="<c:url value='/member/checkNickName' /> " value="중복확인" > 
					 <input type="hidden" name="idDulipcate" value="idDulipcate">
				</td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td> <input type="password" name="member_pw" placeholder="비밀번호" value="${me.member_pw}"required="required"> </td>
			</tr>
			<tr>
				<th> 비밀번호 확인 </th>
				<td> <input type="text" placeholder="비밀번호 확인" required="required"> </td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td> <input type="text" name="member_phone" value="${me.member_phone}" required="required"></td>				
			</tr>
			<tr>
				<th>생년월일</th>
				<td> <input type="text" name="member_birth" value="${me.member_birth}" readonly>	</td>
			</tr>
			<tr>
				<th>현재 질환 및 관심 질병</th>
				<td> 
					<select name="sick_code">
						<option value="${me.sick_code}" selected>${me.sick_name}</option>
						<c:forEach var="illness" items="${sicks}">
							<option value="${illness.sick_code}">${illness.sick_name}</option>
						</c:forEach>
					</select>
				</td>			
			</tr>
		</table>
		
			<p class="hr_write">추가정보</p>
			<div>
				<div>성별  :  
				정보 미제공<input type="radio" name="member_sex" value="정보 미제공" 
				<c:if test="${me.member_sex == '정보 미제공'}">checked</c:if>>
				
               	남자<input type="radio" name="member_sex" value="남자" 
				<c:if test="${me.member_sex == '남자'}">checked</c:if>>
				
				여자<input type="radio" name="member_sex" value="여자" 
				<c:if test="${me.member_sex == '여자'}">checked</c:if>>
				</div>
				<div>음식 알레르기
					<input type="text" name="member_allergy" value="${me.member_allergy}">
				<div>사진등록
					<input type="text" name="member_image" value="${me.member_image}">
				</div>	
			</div>
	
			
		</div>	
		<input type="submit" value="정보 업데이트">
	</form>
</div>
			
</body>
</html>