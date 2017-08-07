<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Page Needs
================================================== -->
<title>gaeverything</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">





</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container" class="fixed fullwidth dashboard">
	<!-- Header -->
	<%@include file = "../../header.jsp" %>
	<!-- Header / End -->
</header>
<div class="clearfix"></div>
<!-- Header Container / End --> 


<!-- Dashboard -->
<div id="dashboard">

	<!-- Navigation
	================================================== -->

	<!-- Responsive Navigation Trigger -->
	<%@include file= "../../navigation_triger.jsp" %>
	<!-- Navigation / End -->


	<!-- Content
	================================================== -->
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<h2>Calendar</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Calendar</a></li>
							<li>Calendar</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

			<!-- Profile -->
			<div class="row">

					<!-- Profile -->
					<div class="col-lg-6 col-md-12">
						<div class="dashboard-list-box margin-top-0">
							<h4 class="gray">일정 등록</h4>
							<div class="dashboard-list-box-static">

								<!-- Avatar -->
								<form action="" id="calendarAdd" method="post">

									<label>제목</label> 
									<input type='text' id='title' size=30px
										name='title' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사" value='${dto.title }'>
									 
									<label>시작시간</label> 
									<input type="time" id='startTime' name='startTime' value='${dto.startTime }'> 
									
									<label>시작날짜</label> 
									<input class='form-control startDate' type="date" id='startDate' 
										readonly="readonly" name='startDate' value='${dto.startDate }'> 
										
									<label>종료시간</label>
									<input class='' type="time" id='endTime' name='endTime' value='${dto.endTime }'> 
									
									<label>종료날짜</label> 
									<input class='form-control startDate' type="date" id='endDate'
										name='endDate' value='${dto.endDate }'> 
										
									<label>장소</label> 
									<input type='text' class='form-control' id='place' name='place'
										placeholder="예: 강남구 서초동" value='${dto.place }'> 
										
									<label>내용</label>
									<textarea name="message" id="" cols="30" rows="10">${dto.message }</textarea>

									<div class="col-md-2">
											<div>요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="resultValue" name="repeatview" value="${dto.repeatview }"></div>
            						</div>
            						<div class="col-md-2">
											<div>히든 요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="resultHiddenValue" name="repeatdata" value="${dto.repeatdata }"></div>
            						</div>
            						<input type="hidden" id="calendarseq" name="calendarseq" value="${dto.calendarseq }">

									<button class="button margin-top-15" onclick="schedule(2)">수정</button>
									<button class="button margin-top-15" onclick="schedule(3)">삭제</button>
									<button class="button margin-top-15" onclick="schedule(1)">확인</button>
								</form>

							</div>
						</div>
					</div>

					<!-- Change Password -->
					<div class="col-lg-6 col-md-12">
						<div class="dashboard-list-box margin-top-0">
							<h4 class="gray">장소</h4>
							<div class="dashboard-list-box-static">

								<!-- Change Password -->
								<div class="my-profile">

									<!-- Location -->
									<input type="hidden" id="longitude" value="${longitude}">
									<input type="hidden" id="latitude" value="${latitude}">
									
									<div id="Location" class="listing-section">
							
										<div id="singleListingMap-container" align="center">
											<div id="singleListingMap"></div>
										</div>
									</div>
									
            						
								</div>

							</div>
						</div>
					</div>
			
					
	
						


			<!-- Change Password -->
			


			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="copyrights">© 2017 Listeo. All Rights Reserved.</div>
			</div>

		</div>

	</div>
	<!-- Content / End -->


</div>
<!-- Dashboard / End -->


</div>
<!-- Wrapper / End -->


<!-- Scripts
================================================== -->
<script type="text/javascript" src="<c:url value = '/resources/scripts/jquery-2.2.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/jpanelmenu.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/chosen.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/slick.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/rangeslider.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/magnific-popup.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/waypoints.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/counterup.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/jquery-ui.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/tooltips.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/custom.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/maps-detailpage.js'/>"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebfbfbd7a5ec71c10c63936dd90beb22"></script>


<script type="text/javascript">
var longitude = document.getElementById('longitude').value;
var latitude = document.getElementById('latitude').value;

var mapContainer = document.getElementById('singleListingMap'), // 지도를 표시할 div
	mapOption = { 
		center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		
		level: 3 // 지도의 확대 레벨
	};


// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

var markerPosition  = new daum.maps.LatLng(latitude, longitude); 
	
    // 마커를 생성합니다
var marker = new daum.maps.Marker({
	position: markerPosition
});
map.setCenter(new daum.maps.LatLng(latitude, longitude));
marker.setMap(map);
</script>

<script type="text/javascript">
	function schedule(type) {
		var url = "/mypage/calendar/viewCalendar";
		var ds = document.getElementById("calendarAdd");
		if (type == 2) {
			url = "/mypage/calendar/modify";
		} else if (type == 3) {
			url = "/mypage/calendar/remove";
		} else if (type == 1) {
			url = "/mypage/calendar/regist";
		}
		ds.action = url;
		ds.submit();
	}
	function repeatAdd(){
		var repeat = document.getElementById("resultValue").value = document.getElementById("result").value; 
		var repeatHidden = document.getElementById("resultHiddenValue").value = document.getElementById("resultHidden").value; 
		
	}
	function selectBox(){
		var select = repeatWeek.value;
		document.getElementById("result").value = select;
	}
		
	$(document).ready(function(){
		var selData="매주 ";
		var selDataNum="2, ";
		var selCountData="매주 ";
		var selCountDataNum="1, ";
		var DATA="";
		var data="";
		var dataNum="";
		//반복 빈도
		$("#repeatWeek").on('change', function() {
			selData="";
			selDataNum="";
			selCountDataNum="1, ";
	      $('#repeatWeek[name=repeatWeek]').each(function() {
	         if($(this).prop("selected", true)){
	        	 var select = $(this).val();
	        	 for(var i=1;i<5;i++){
	        		 var week = ["매일 ","매주 ","매월 ","매년 "];
	        	      if(select==i){
	        	           document.getElementById('repeatCount'+i).style.display='block';
	        	           selData = week[i-1];
	        	           selDataNum = i+", ";
	        	      }else{
	        	           document.getElementById('repeatCount'+i).style.display='none';
	        	      }
	        	      if(select==2){
	        	    	   document.getElementById('weekCheck').style.display='block';
	        	    	   data="월요일";
	        	      }else{
	        	           document.getElementById('weekCheck').style.display='none';
	        	      }
	        	      if(select==3||select==4){
	        	    	  var dateForm = document.getElementById("repeatStartDate").value.split("-");
	        	    	  var dateInt = parseInt(dateForm[2]);
	        	    	  data = dateInt + "일";
	        	    	  dataNum = dateInt;
	        	      }else if(select==2){
	        	    	  data = "월요일";
	        	    	  dataNum = "월, ";
	        	      }else{
	        	    	  data = "";
	        	    	  dataNum = "";
	        	      }
	        	 }
	        	 
	        	 document.getElementById("result").value = selData+selCountData+data;
	   	     	 document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
	         }
	      });
	      document.getElementById("result").value = selData+data;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
		});
		//반복 주기  [매일]
		$("#repeatWeekCount1").on('change', function() {
			selCountData="매일";
			selCountDataNum="1, ";
	      $('#repeatWeekCount1[name=repeatWeekCount1]').each(function() {
	         if($(this).prop("selected", true)){
	        	 var sel = $(this).val();
	        	 if(sel==1){
	        		 selCountData = "매일 ";
	        		 selCountDataNum = sel+", ";
	        	 }else{
	        		 selCountData = sel+"일 마다 ";
	        		 selCountDataNum = sel+", ";
	        	 }
	         }
	      });
	      document.getElementById("result").value = selCountData;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum;
		});
		//반복 주기  [매주]
		$("#repeatWeekCount2").on('change', function() {
			selCountData="매주 월요일";
			selCountDataNum="2, ";
	      $('#repeatWeekCount2[name=repeatWeekCount2]').each(function() {
	         if($(this).prop("selected", true)){
	        	 var sel = $(this).val();
	        	 if(sel==1){
	        		 selCountData = "매주 ";
	        		 selCountDataNum = sel+", ";
	        	 }else{
	        		 selCountData = sel+"주 마다 ";
	        		 selCountDataNum = sel+", ";
	        	 }
	         }
	      });
	      document.getElementById("result").value = selCountData+data;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
		});
		//반복 주기  [매월]
		$("#repeatWeekCount3").on('change', function() {
			selCountData="";
			selCountDataNum="";
			
	      $('#repeatWeekCount3[name=repeatWeekCount3]').each(function() {
	         if($(this).prop("selected", true)){
	        	 var sel = $(this).val();
	        	 if(sel==1){
	        		 selCountData = "매월 ";
	        		 selCountDataNum = sel+", ";
	        	 }else{
	        		 selCountData = sel+"개월 마다 ";
	        		 selCountDataNum = sel+", ";
	        	 }
	         }
	      });
	      document.getElementById("result").value = selCountData+data;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
		});
		//반복 주기  [매년]
		$("#repeatWeekCount4").on('change', function() {
			selCountData="";
			selCountDataNum="";
	      $('#repeatWeekCount4[name=repeatWeekCount4]').each(function() {
	         if($(this).prop("selected", true)){
	        	 var sel = $(this).val();
	        	 if(sel==1){
	        		 selCountData = "매년 ";
	        		 selCountDataNum = sel+", ";
	        	 }else{
	        		 selCountData = sel+"년 마다 ";
	        		 selCountDataNum = sel+", ";
	        	 }
	         }
	      });
	      document.getElementById("result").value = selCountData+data;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
		});
		//반복일
		$("input:checkbox").on('click', function() {
			DATA="";
	      $('input:checkbox[name=check]').each(function() {
	         if($(this).is(':checked')){
	        	 DATA += ","+($(this).val());
	         }
	      });
	      data="";
	      dataNum="";
	      var splitDATA = DATA .split(",");
	      for (var i=1; i<splitDATA .length; i++) {
	         if(i==(splitDATA.length-1)){
	            data+=splitDATA[i]+"요일";
	            dataNum+=splitDATA[i];
	         }else{
	            data+=splitDATA[i]+", ";
	            dataNum+=splitDATA[i]+", ";
	         } 
	      } 
	      document.getElementById("result").value = selCountData+data;
	      document.getElementById("resultHidden").value = selDataNum+selCountDataNum+dataNum;
		});
	});
	
	    
	
</script>

</body>
</html>
