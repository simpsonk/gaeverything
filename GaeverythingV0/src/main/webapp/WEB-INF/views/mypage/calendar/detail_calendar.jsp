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



<script type="text/javascript">

function schedule(type){
	var url = "/mypage/calendar/viewCalendar";
	var ds = document.getElementById("calendarAdd");
	if(type==2){
		url = "/mypage/calendar/modify";
	}else if(type==3){
		url = "/mypage/calendar/remove";
	}
	ds.action = url;
	ds.submit();
}

</script>


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

									<label>강아지 선택</label> 
									<select id='dogid' name='dogid'>
										<option value="1" ${dto.dogid=='1'?'selected="selected"':''}>1번개
										<option value="2" ${dto.dogid=='2'?'selected="selected"':''}>2번개
										<option value="3" ${dto.dogid=='3'?'selected="selected"':''}>3번개
										
									</select>
									 
									<label>시작시간</label> 
									<input type="time" id='startTime' name='startTime' value='00:00'> 
									
									<label>시작날짜</label> 
									<input class='form-control startDate' type="date" id='startDate' 
										readonly="readonly" name='startDate' value='${dto.startDate }'> 
										
									<label>종료시간</label>
									<input class='' type="time" id='endTime' name='endTime' value='00:00'> 
									
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
											<div><input id="resultValue" name="resultValue" value="${dto.repeatview }"></div>
            						</div>
            						<div class="col-md-2">
											<div>히든 요약</div>
            						</div>
            						<div class="col-md-10">
											<div><input id="resultHiddenValue" name="repeatdata" value="${dto.repeatdata }"></div>
            						</div>

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
            						<div class="col-md-10">
											<select id="repeatWeekCount" name="repeatWeekCount">
												<option value="1" selected="selected">1주</option>
												<option value="2">2주</option>
												<option value="3">3주</option>
												<option value="4">4주</option>
												<option value="5">5주</option>
												<option value="6">6주</option>
											</select>
            						</div>
									<div class="col-md-12">
										<div class="panel-dropdown-content checkboxes" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
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
											<div><input id="resultHidden" name="resultHidden" value="1,"></div>
            						</div>

									<button class="button margin-top-15" onclick="repeatAdd()">적용</button>
									
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



</body>
</html>
