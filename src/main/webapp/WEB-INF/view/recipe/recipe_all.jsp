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


<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.88.1">

<title>나의 보관함</title>

<link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/album/">
 
<!-- Bootstrap core CSS -->
<link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.1/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">


    <style>
    
       .card{
         width: 223px;
       }

      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
        
      height: 152px;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      
      label {
        /* Presentation */
        font-size: 30px;
        position: relative;
        left: 150px;
      }

      /* Required Styling */
      
      label input[type="checkbox"] {
        display: none;
      }
      
      .custom-checkbox {
        margin-left: 2em;
        position: relative;
        cursor: pointer;
      }
      
      .custom-checkbox .bi {
        color: red;
        position: absolute;
        top: 0.4em;
        left: -1.25em;
        font-size: 0.75em;
      }
      
      .custom-checkbox .bi-heart {
        color: gray;
      }
      
      .custom-checkbox .bi-heart-fill {
        opacity: 0;
        transition: opacity 0.2s ease-in-out;
      }
      
      .custom-checkbox:hover .bi-heart-fill {
        opacity: 0.5;
      }
      
      .custom-checkbox input[type="checkbox"]:checked ~ .bi-heart-fill {
        opacity: 1;
      }
    </style>

  </head>
  <body>
    


<div class="album py-5 bg-light">
<div class="container">
<div class="row row-cols-2 row-cols-sm-2 row-cols-md-4 g-3">
      <c:forEach var="list" items="${list}">
        <div class="col">
          <div class="card shadow-sm">
         <c:if test='${list.chk == 1}'><label for="id-of-input" class="custom-checkbox">
            <input onClick="return false;" type="checkbox" id="id-of-input" />
            
            <i class="bi bi-heart-fill"></i>
         </label></c:if>
            <img src="<c:url value=' ${list.recipe_img}'/>" >
            <div class="card-body">
              <p class="card-text"> 레시피명 : ${list.recipe_title} </p>
              <p class="card-text"> ${list.recipe_memo} </p>
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
                	   <button type="button" class="btn btn-sm btn-outline-secondary" 
                  onclick="location.href='<c:url value='/recipe/recipe_detail'> <c:param name="recipe_code" value="${list.recipe_code}"></c:param> 
                </c:url>'">more...</button>

                </div>
                <small class="text-muted">${list.recipe_person}, ${list.recipe_time} </small>
              </div>
            </div>
          </div>
        </div>
        </c:forEach>
</div>
</div>
</div>
</body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 