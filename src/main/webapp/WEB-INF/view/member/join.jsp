<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="<c:url value='/css/main.css'/>" type="text/css">
<link rel=stylesheet href="<c:url value='/css/join.css'/>" type="text/css">

<title>회원가입 페이지</title>  <!-- 소셜가입 연동 JS 코드필요  -->
</head>

<body>
	<!-- 기본 상단바 -->
	<nav class="dalcbar">
		<div class="dalc_name">
			<h2><a href="<c:url value='/main'/>">로고 이미지</a></h2>
		</div>
      
      <div align = "center">
      	<form name="mainSearch" action="/main/search" method="GET">
      		<input type="text" name="searchView" placeholder="검색어를 입력하세요." width="500" height="40">
      		<input type="image" src="<c:url value='/images/search.png'/>" alt="검색버튼" width="15" height="15">
      	</form>
      </div>
      
      <ul class="dalc_menu">
      	<c:if test="${ses == 0}"> 
      		<li><a href="<c:url value="/main/login" />">로그인</a></li>
      		<li><a href="<c:url value="/main/join" />">회원가입</a></li>
      	</c:if>
      	<c:if test="${ses == 1}"> 
      		<li>${member_nickName}님 </li>
            <li><a href="<c:url value='/member/logout.do'/>">로그아웃</a></li>
            <li><a href="<c:url value="/member/delete.do" />">탈퇴</a></li> <!-- 탈퇴기능만 한번테스트해보려고 잠깐삽입 -->
        </c:if>
      </ul>
   </nav>
   <hr>
   
<!-- 카카오, 네이버 연동 추가해야함  -->
<div class = "content">
	<h2> 회원 가입 </h2>
	<p class="hr_write">필수정보</p>
	
	<form name="form" method="POST" action="<c:url value='/member/join.do' />" enctype="multipart/form-data">
		<table>
			<tr>
				<th> 이름 </th>
				<td> <input type="text" name="member_name" placeholder="이름" required="required"> </td>
			</tr>
			<tr>
				<th> 아이디(이메일) </th>
				<td> <input type="email" name="member_id" placeholder="이메일" required="required">
					 <input type="button" onclick="<c:url value='/member/checkId' /> " value="중복확인" >
					 <input type="hidden" name="idDulipcate" value="idDulipcate">
				</td>
			</tr>
			<tr>
				<th> 닉네임 </th>
				<td> <input type="text" name="member_nickName" placeholder="닉네임" required="required"> 
					 <input type="button" onclick="<c:url value='/member/checkNickName' /> " value="중복확인" > 
					 <input type="hidden" name="idDulipcate" value="idDulipcate">
				</td>
			</tr>
			<tr>
				<th> 비밀번호 </th>
				<td> <input type="password" name="member_pw" placeholder="비밀번호" required="required"> </td>
			</tr>
			<tr>
				<th> 비밀번호 확인 </th> <!-- js 함수필요 -->
				<td> <input type="text" placeholder="비밀번호 확인" required="required"> </td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td> <input type="text" name="member_phone" placeholder="휴대폰(-없이 숫자만 입력)" required="required"></td>				
			</tr>
			<tr>
				<th>생년월일</th>
				<td> <input type="date" name="member_birth" placeholder="생년월일" required="required">	</td>
			</tr>
			<tr>
				<th>현재 질환 및 관심 질병</th> <!-- 수정사항 선택입력 -> 필수정보 -> 제공안하거나 기타질병을 default 감기로 -->
				<td> 
					<select name="sick_code">
						<option selected value="0">정보미제공</option>
							<c:forEach var="illness" items="${sicks}">
								<option value="${illness.sick_code}">${illness.sick_name}</option>
							</c:forEach>
					</select>
				</td>			
			</tr>
		</table>
		
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
			
			<p class="hr_write">추가정보</p>
			<div>
				<div>성별  :      
					정보 미제공 <input type="radio" name="member_sex" value="999" checked />  
                	남성 <input type="radio" name="member_sex" value="0" />
                	여성 <input type="radio" name="member_sex" value="1" />
				</div>
				<div>음식 알레르기
					<input type="text" name="member_allergy">
				
				<div>사진등록
					<input type="text" name="member_image">
				</div>	
			</div>
	
			<p class="hr_last"/>
			<div>
				전체동의 <input type="text"> <br>
				서비스 이용약관 동의(필수) <input type="checkbox">
				<input type="text">
				<input type="text">
			</div>
		</div>	
		<input type="submit" value="회원가입">
	</form>
</div>
			
</body>
</html>