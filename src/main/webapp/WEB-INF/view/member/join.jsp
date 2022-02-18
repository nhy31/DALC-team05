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

</head>

<body>
<!-- 부트스트랩 input group, dropdown (이메일) 등 필요 -->
<!-- 카카오, 네이버 연동 추가해야함  -->
<div class = "content">
	<div class="col-md-12">
	<h2 class="mb-3"> 회원 가입 </h2>
	
	<form class="needs-validation" name="form" method="POST" action="<c:url value='/member/join.do' />" enctype="multipart/form-data" novalidate>
	<div class="row">
		<h6 class="hr_write">필수정보</h6>
		<p/>
		<p/>
	
		<div class="col-sm-12">
              <label for="name" class="form-label">이름</label>
              <input type="text" class="form-control"  name="member_name" id="firstName" placeholder="홍길동" required>
              <div class="invalid-feedback">
              	이름을 입력해주세요
              </div>
         </div>
         
         <p/>
         <div class="col-sm-10">
         	  <input type="email" class="form-control"  name="member_id" id="email" placeholder="you@example.com(이메일 입력)" required>
              <div class="invalid-feedback">
              	email을 입력해주세요
              </div>
         </div>
         <div class="col-sm-2">
   			 <input type="button" class="w-100 btn btn-primary sm-2" onclick="<c:url value='/member/checkId' /> " value="중복확인" >
					 <input type="hidden" name="idDulipcate" value="idDulipcate">
		 </div>
		 
		<p/>
		 <div class="col-sm-10">
              <input type="text" class="form-control"  name="member_nickName" id="nickName" placeholder="닉네임" required>
              <div class="invalid-feedback">
              	닉네임을 입력해주세요
              </div>
         </div>
         <div class="col-sm-2">
   			 <input type="button" class="w-100 btn btn-primary sm-2" onclick="<c:url value='/member/checkNickName' /> " value="중복확인" > 
					 <input type="hidden" name="idDulipcate" value="idDulipcate"> 
		 </div>
		 <p/>
		 
		  <div class="mb-3 row">
   			 <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
   			 <div class="col-sm-10">
    		  <input type="password" name="member_pw"  class="form-control" id="inputPassword" required>
  			  </div>
		  </div>
		  
		  <div class="mb-3 row">
   			 <label for="inputPassword2" class="col-sm-2 col-form-label">비밀번호 확인 </label>
   			 <div class="col-sm-10">
    		  <input type="password" name="member_pw2"  class="form-control" id="inputPassword2" value="" required>
  			  </div>
		  </div>
		  
		   <div class="mb-3 row">
   			 <label for="phone" class="col-sm-2 col-form-label">휴대전화 번호 </label>
   			 <div class="col-sm-10">
    		  <input type="text" name="member_phone"  class="form-control" placeholder="휴대폰(-없이 숫자만 입력)" id="phone" required>
  			  </div>
		  </div>
		  
		  <div class="mb-3 row">
   			 <label for="birthday" class="col-sm-2 col-form-label">생년월일</label>
   			 <div class="col-sm-10">
    		  <input type="date" name="member_birth"  class="form-control" placeholder="생년월일" id="birthday" required>
  			  </div>
		  </div>
		  
		  <div class="mb-3 row">
   			 <label for="sick" class="col-sm-2 col-form-label">현재 질환 및 관심 질병</label>
   			 <div class="col-sm-10">
    		 <select class="form-select" aria-label="Default select example" name="sick_code">
    		 	<option selected value="0">정보 미제공</option>
    		 		<c:forEach var="illness" items="${sicks}">
								<option value="${illness.sick_code}">${illness.sick_name}</option>
					</c:forEach>
			 </select>
  			  </div>
		  </div>
		  <hr/>
		  
		  <h6 class="hr_write">추가정보</h6>
		  <p/>
		  <p/>
		
		<div class="col-sm-2">
		 <label for="member_sex" class="form-label">성별</label>
		</div>
		
		<div class="col-sm-10">
			<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex" id="flexRadioDefault1" checked>
		  <label class="form-check-label" for="flexRadioDefault1">
		    정보 미제공
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex" id="flexRadioDefault2">
		  <label class="form-check-label" for="flexRadioDefault2">
		   남성
		  </label>
		</div>
		<div class="form-check">
		  <input class="form-check-input" type="radio" name="member_sex"   id="flexRadioDefault3">
		  <label class="form-check-label" for="flexRadioDefault3">
		   여성
		  </label>
		</div>
		</div>
		
		<p/>
		 <div class="mb-3 row">
		 <div class="col-sm-2">
		 <label for="photo" class="form-label">이미지</label>
		</div>
		<div class="col-sm-10">
		<div class="input-group">
		  <input type="file" class="form-control" name="img_file" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		</div>
		</div>
		 </div>
		
		<div class="mb-3 row">
			<div class="col-sm-2">
	              <label for="member_allergy" class="form-label">음식 알레르기</label>
	        </div>
	        <div class="col-sm-10">
	              <input type="text" class="form-control"  name="member_allergy" id="allergy" placeholder="가지고 있는 알러지" value="">
	         </div>
		</div>		
            
		<p class="hr_last"/>
		<div>
			전체동의 <input type="text"> <br>
			서비스 이용약관 동의(필수) <input type="checkbox">
			<input type="text">
			<input type="text">
		</div>
		
		<input class="w-100 btn btn-primary" type="submit" value="회원가입">
	</form>
	</div>
</div>
			
</body>
</html>
			
	
		<!-- 테이블 미사용(기존 코드) -->
		<!--  
				<div>
					<input type="text" name="member_name" placeholder="이름" required="required">
				</div>
				<div>
					<input type="email" name="member_email" placeholder="이메일" required="required">
				//tddsssssssss인증메일 발송</button> 우선 버튼만
				<div>
					<input type="text" name="member_id" placeholder="아이디" required="required">
					<button>중복확인</button> 우선버튼만, 아이디 중복됐는지 테이블에서 확인 후 다시하라고 알림창
				</div>
				<div>
					<input type="text" name="member_nickName" placeholder="닉네임" required="required">
					<button>중복확인</button> 우선버튼만, 아이디 중복됐는지 테이블에서 확인 후 다시하라고 알림창		
				</div>
				<div>
					<input type="text" name="member_phone" placeholder="휴대폰(-없이 숫자만 입력)" required="required">		
				</div>
				<div>
					<input type="date" name="member_birth" placeholder="생년월일" required="required">	
				</div>
				<div>
					<input type="text" name="member_pw" placeholder="비밀번호" required="required">
					<div>영문 대문자/영문 소문자/숫자/특수문자 중 2가지 이상 조합, 8자~32자</div>		
				</div>
				<div>
					<input type="text" placeholder="비밀번호_확인" required="required">
					<div>비밀번호가 일치하지않습니다</div> 우선대충		
				</div>
			</div>
			-->