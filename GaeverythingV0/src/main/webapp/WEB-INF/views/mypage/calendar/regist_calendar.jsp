<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet"
	href="<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/colors/main.css'/>" id="colors">





<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header Container
================================================== -->
		<header id="header-container" class="fixed fullwidth dashboard">

		<!-- Header --> <%@include file="../../header.jsp"%>
		<!-- Header / End --> </header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->


		<!-- Dashboard -->
		<div id="dashboard">

			<!-- Navigation
	================================================== -->

			<!-- Responsive Navigation Trigger -->
			<%@include file="../../navigation_triger.jsp"%>
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
										name='title' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사" value=''>

									<label>강아지 선택</label> 
									<select id='dogid' name='dogid'>
										<option value="1" selected='selected'>1번개
										<option value="2">2번개
										<option value="3">3번개
									</select> 
									
									<label>시작시간</label> 
									<input type="time" id='startTime'
										name='startTime' value='00:00'> 
									
									<label>시작날짜</label> 
									<input class='form-control startDate' type="date" id='startDate'
										readonly="readonly" name='startDate' value='${sd }'> 
									
									<label>종료시간</label>
									<input class='' type="time" id='endTime' name='endTime'
										value='00:00'> 
									
									<label>종료날짜</label>
									<input class='form-control startDate' type="date" id='endDate'
										name='endDate' value='${sd }'> 
									
									<label>장소</label> 
									<input type='text' class='form-control' id='place' name='place'
										placeholder="예: 강남구 서초동" value=''> 
										
									<label>내용</label>
									<textarea name="message" id="" cols="30" rows="10"></textarea>

									<div class="col-md-2">
											<div>요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="resultValue" name="repeatview" value=""></div>
            						</div>
            						<div class="col-md-2">
											<div>히든 요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="resultHiddenValue" name="repeatdata" value=""></div>
            						</div>

									<button class="button margin-top-15" onclick="schedule(1)">등록</button>
								</form>

							</div>
						</div>
					</div>

					<!-- Change Password -->
					<div class="col-lg-6 col-md-12">
						<div class="dashboard-list-box margin-top-0">
							<h4 class="gray">반복</h4>
							<div class="dashboard-list-box-static">

								<!-- Change Password -->
								<div class="my-profile">

									
									
            						<div class="col-md-2">
											<div>반복 빈도</div>
            						</div>
            						<div class="col-md-10">
											<select id="repeatWeek" name="repeatWeek">
											<!--  <select id="repeatWeek" name="repeatWeek" onchange="alert(this.options[this.selectedIndex].text)"> -->
												<option value="1">매일
												<option value="2" selected='selected'>매주
												<option value="3">매월
												<option value="4">매년
											</select>
            						</div>
            						<div class="col-md-2">
											<div>반복 주기</div>
            						</div>
            						<div class="col-md-10" id="repeatCount1" style="display: none">
											<select id="repeatWeekCount1" name="repeatWeekCount1">
												<option value="1" selected="selected">1일</option>
												<option value="2">2일</option>
												<option value="3">3일</option>
												<option value="4">4일</option>
												<option value="5">5일</option>
												<option value="6">6일</option>
												<option value="7">7일</option>
												<option value="8">8일</option>
												<option value="9">9일</option>
												<option value="10">10일</option>
											</select>
            						</div>
            						<div class="col-md-10" id="repeatCount2" style="display: block">
											<select id="repeatWeekCount2" name="repeatWeekCount2">
												<option value="1" selected="selected">1주</option>
												<option value="2">2주</option>
												<option value="3">3주</option>
												<option value="4">4주</option>
												<option value="5">5주</option>
												<option value="6">6주</option>
												<option value="7">7주</option>
												<option value="8">8주</option>
												<option value="9">9주</option>
												<option value="10">10주</option>
											</select>
            						</div>
            						<div class="col-md-10" id="repeatCount3" style="display: none">
											<select id="repeatWeekCount3" name="repeatWeekCount3">
												<option value="1" selected="selected">1개월</option>
												<option value="2">2개월</option>
												<option value="3">3개월</option>
												<option value="4">4개월</option>
												<option value="5">5개월</option>
												<option value="6">6개월</option>
												<option value="7">7개월</option>
												<option value="8">8개월</option>
												<option value="9">9개월</option>
												<option value="10">10개월</option>
												<option value="11">11개월</option>
												<option value="12">12개월</option>
											</select>
            						</div>
            						<div class="col-md-10" id="repeatCount4" style="display: none">
											<select id="repeatWeekCount4" name="repeatWeekCount4">
												<option value="1" selected="selected">1년</option>
												<option value="2">2년</option>
												<option value="3">3년</option>
												<option value="4">4년</option>
												<option value="5">5년</option>
												<option value="6">6년</option>
												<option value="7">7년</option>
												<option value="8">8년</option>
												<option value="9">9년</option>
											</select>
            						</div>
									<div class="col-md-12">
										<div class="panel-dropdown-content checkboxes" id="weekCheck"
											style="display: block; padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
											<span style="padding-right: 10px;">반복일 : </span> 
											<input id="check-1" type="checkbox" name="check" value="월" checked="checked">
											<label for="check-1">월</label> 
											<input id="check-2" type="checkbox" name="check" value="화">
											<label for="check-2">화</label>
											<input id="check-3" type="checkbox" name="check" value="수">
											<label for="check-3">수</label>
											<input id="check-4" type="checkbox" name="check" value="목">
											<label for="check-4">목</label>
											<input id="check-5" type="checkbox" name="check" value="금"> 
											<label for="check-5">금</label>
											<input id="check-6" type="checkbox" name="check" value="토"> 
											<label for="check-6">토</label>
											<input id="check-7" type="checkbox" name="check" value="일"> 
											<label for="check-7">일</label>
										</div>
									</div>
									<div class="col-md-2">
											<div>시작 날짜</div>
            						</div>
            						<div class="col-md-10">
											<input class='form-control startDate' type="date" id='repeatStartDate' name='repeatStartDate' value='${sd }'>
            						</div>
            						<div class="col-md-2">
											<div>종료일</div>
            						</div>
            						<div class="col-md-10">
											<input class='form-control startDate' type="date" id='repeatEndDate' name='repeatEndDate' value='${sd }'>
											
            						</div>
            						<div class="col-md-2">
											<div>요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="result" name="result" value="매주 월요일"></div>
											<div><input id="resultHidden" name="resultHidden" value="2, 1,"></div>
            						</div>

									<button class="button margin-top-15" onclick="repeatAdd()">적용</button>
									
								</div>

							</div>
						</div>
					</div>


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
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jquery-2.2.0.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jpanelmenu.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/chosen.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/slick.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/rangeslider.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/magnific-popup.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/waypoints.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/counterup.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jquery-ui.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/tooltips.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/custom.js'/>"></script>
		
<script type="text/javascript">
	function schedule(type) {
		var url = "/mypage/calendar/regist";
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


</head>
</body>
</html>
