<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>나의 다이어리 구글링해서 형태만 가져옴</title>

  <style>
  body {
  font-family: Tahoma;
}
header {
  text-align: center;
}
#calendar {
  width: 100%;
}
#calendar a {
  color: #8e352e;
  text-decoration: none;
}
#calendar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  width: 100%;
}
#calendar li {
  display: block;
  float: left;
  width: 14.342%;
  padding: 5px;
  box-sizing: border-box;
  border: 1px solid #ccc;
  margin-right: -1px;
  margin-bottom: -1px;
}
#calendar ul.weekdays {
  height: 40px;
  background: #8e352e;
}
#calendar ul.weekdays li {
  text-align: center;
  text-transform: uppercase;
  line-height: 20px;
  border: none !important;
  padding: 10px 6px;
  color: #fff;
  font-size: 13px;
}
#calendar .days li {
  height: 180px;
}
#calendar .days li:hover {
  background: #d3d3d3;
}
#calendar .date {
  text-align: center;
  margin-bottom: 5px;
  padding: 4px;
  background: #333;
  color: #fff;
  width: 20px;
  border-radius: 50%;
  float: right;
}
#calendar .event {
  clear: both;
  display: block;
  font-size: 13px;
  border-radius: 4px;
  padding: 5px;
  margin-top: 40px;
  margin-bottom: 5px;
  line-height: 14px;
  background: #e4f2f2;
  border: 1px solid #b5dbdc;
  color: #009aaf;
  text-decoration: none;
}
#calendar .event-desc {
  color: #666;
  margin: 3px 0 7px 0;
  text-decoration: none;
}
#calendar .other-month {
  background: #f5f5f5;
  color: #666;
}
/* ============================
                Mobile Responsiveness
   ============================*/
@media (max-width: 768px) {
  #calendar .weekdays, #calendar .other-month {
    display: none;
  }
  #calendar li {
    height: auto !important;
    border: 1px solid #ededed;
    width: 100%;
    padding: 10px;
    margin-bottom: -1px;
  }
  #calendar .date {
    float: none;
  }
}
</style>
 </head>
 <body>
 










 </body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 