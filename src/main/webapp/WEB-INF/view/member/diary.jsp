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
 










  <div id="calendar-wrap">
            <header>
                <h1>August 2014</h1>
            </header>
            <div id="calendar">
                <ul class="weekdays">
                    <li>Sunday</li>
                    <li>Monday</li>
                    <li>Tuesday</li>
                    <li>Wednesday</li>
                    <li>Thursday</li>
                    <li>Friday</li>
                    <li>Saturday</li>
                </ul>
                <!-- Days from previous month -->
                <ul class="days">
                    <li class="day other-month">
                        <div class="date">27</div>                     
                    </li>
                    <li class="day other-month">
                        <div class="date">28</div>
                        <div class="event">
                            <div class="event-desc">
                                HTML 5 lecture with Brad Traversy from Eduonix
                            </div>
                            <div class="event-time">
                                1:00pm to 3:00pm
                            </div>
                        </div>                     
                    </li>
                    <li class="day other-month">
                        <div class="date">29</div>                     
                    </li>
                    <li class="day other-month">
                        <div class="date">30</div>                     
                    </li>
                    <li class="day other-month">
                        <div class="date">31</div>                     
                    </li>
                    <!-- Days in current month -->
                    <li class="day">
                        <div class="date">1</div>                      
                    </li>
                    <li class="day">
                        <div class="date">2</div>
                        <div class="event">
                            <div class="event-desc">
                                Career development @ Community College room #402
                            </div>
                            <div class="event-time">
                                2:00pm to 5:00pm
                            </div>
                        </div>                     
                    </li>
                </ul>
                    <!-- Row #2 -->
                <ul class="days">
                    <li class="day">
                        <div class="date">3</div>                      
                    </li>
                    <li class="day">
                        <div class="date">4</div>                      
                    </li>
                    <li class="day">
                        <div class="date">5</div>                      
                    </li>
                    <li class="day">
                        <div class="date">6</div>                      
                    </li>
                    <li class="day">
                        <div class="date">7</div>
                        <div class="event">
                            <div class="event-desc">
                                Group Project meetup
                            </div>
                            <div class="event-time">
                                6:00pm to 8:30pm
                            </div>
                        </div>                     
                    </li>
                    <li class="day">
                        <div class="date">8</div>                      
                    </li>
                    <li class="day">
                        <div class="date">9</div>                      
                    </li>
                </ul>
                    <!-- Row #3 -->
                <ul class="days">
                    <li class="day">
                        <div class="date">10</div>                     
                    </li>
                    <li class="day">
                        <div class="date">11</div>                     
                    </li>
                    <li class="day">
                        <div class="date">12</div>                     
                    </li>
                    <li class="day">
                        <div class="date">13</div>                     
                    </li>
                    <li class="day">
                        <div class="date">14</div><div class="event">
                            <div class="event-desc">
                                Board Meeting
                            </div>
                            <div class="event-time">
                                1:00pm to 3:00pm
                            </div>
                        </div>                     
                    </li>
                    <li class="day">
                        <div class="date">15</div>                     
                    </li>
                    <li class="day">
                        <div class="date">16</div>                     
                    </li>
                </ul>
                    <!-- Row #4 -->
                <ul class="days">
                    <li class="day">
                        <div class="date">17</div>                     
                    </li>
                    <li class="day">
                        <div class="date">18</div>                     
                    </li>
                    <li class="day">
                        <div class="date">19</div>                     
                    </li>
                    <li class="day">
                        <div class="date">20</div>                     
                    </li>
                    <li class="day">
                        <div class="date">21</div>                     
                    </li>
                    <li class="day">
                        <div class="date">22</div>
                        <div class="event">
                            <div class="event-desc">
                                Conference call
                            </div>
                            <div class="event-time">
                                9:00am to 12:00pm
                            </div>
                        </div>                     
                    </li>
                    <li class="day">
                        <div class="date">23</div>                     
                    </li>
                </ul>
                        <!-- Row #5 -->
                <ul class="days">
                    <li class="day">
                        <div class="date">24</div>                     
                    </li>
                    <li class="day">
                        <div class="date">25</div>
                        <div class="event">
                            <div class="event-desc">
                                Conference Call
                            </div>
                            <div class="event-time">
                                1:00pm to 3:00pm
                            </div>
                        </div>                     
                    </li>
                    <li class="day">
                        <div class="date">26</div>                     
                    </li>
                    <li class="day">
                        <div class="date">27</div>                     
                    </li>
                    <li class="day">
                        <div class="date">28</div>                     
                    </li>
                    <li class="day">
                        <div class="date">29</div>                     
                    </li>
                    <li class="day">
                        <div class="date">30</div>                     
                    </li>
                </ul>
                <!-- Row #6 -->
                <ul class="days">
                    <li class="day">
                        <div class="date">31</div>                     
                    </li>
                    <li class="day other-month">
                        <div class="date">1</div> <!-- Next Month -->                      
                    </li>
                    <li class="day other-month">
                        <div class="date">2</div>                      
                    </li>
                    <li class="day other-month">
                        <div class="date">3</div>                      
                    </li>
                    <li class="day other-month">
                        <div class="date">4</div>                      
                    </li>
                    <li class="day other-month">
                        <div class="date">5</div>                      
                    </li>
                    <li class="day other-month">
                        <div class="date">6</div>                      
                    </li>
                </ul>
            </div><!-- /. calendar -->
        </div><!-- /. wrap -->
 </body>
</html>
<%@ include file="../main/bottom_footers.jsp"%> 