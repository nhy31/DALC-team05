<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
<!-- 카카오, 네이버 연동 추가해야함  -->
	<form name="form" method="POST" action="<c:url value='/member/join.do' />" enctype="multipart/form-data">
		<div>현대인의 간편한 건강 관리
			<div>필수정보 입력
				<div>
					<input type="text" name="member_name" placeholder="이름" required="required">
				</div>
				<div>
					<input type="email" name="member_email" placeholder="이메일" required="required">
					<button>인증메일 발송</button> 우선 버튼만
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
			<hr>
			<div>추가정보 입력
				<div>성별
					<input type="text" name="member_sex" value=1>
				</div>
				<div>음식 알레르기
					<input type="text" name="bad_ingredient_code" value=0000>
				<div>현재 질환 및 관심 질병
					<input type="text" name="sick_code" value=0000>
				</div>
				<div>사진등록
					<input type="text" name="member_image" value=0000>
				</div>	
			</div>
			<hr>
			<div>전체동의
				<input type="text">서비스 이용약관 동의(필수)
				<input type="check">
				<input type="text">
				<input type="text">
			</div>
		</div>	
		<input type="submit" value="회원가입">
	</form>
			
</body>
</html>