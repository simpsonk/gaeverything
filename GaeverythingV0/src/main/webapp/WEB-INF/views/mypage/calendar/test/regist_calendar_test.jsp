<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">



<script type="text/javascript">

function schedule(type){
	var url = "/calendar/regist";
	var ds = document.getElementById("calendarAdd");
	if(type==2){
		url = "/calendar/modify";
	}else if(type==3){
		url = "/calendar/remove";
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
	<%-- <%@include file = "../../header.jsp" %> --%>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard -->
<div id="dashboard">

	<!-- Navigation
	================================================== -->

	<!-- Responsive Navigation Trigger -->
	<%-- <%@include file= "../../navigation_triger.jsp" %> --%>
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
			
			
			
					<h4>일정등록</h4>
					
						<!-- Details -->
						<form action="" id="calendarAdd" method="post">
						
							<label>제목</label> 
							<input type='text' id='title' size=30px name='title' 
							placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사" value=''>
							
							<label>강아지 선택</label> <select id='dogid' name='dogid' >
							<option value="1" selected='selected'>1번개
							<option value="2">2번개
							<option value="3">3번개
							</select>
							
							<label>시작시간</label> <input type="time"
							id='startTime' name='startTime' value='00:00'>
							
							<label>시작날짜</label> <input class='form-control startDate'
							type="date" id='startDate' readonly="readonly" name='startDate' value='${sd }'>
							
							<label>종료시간</label> <input class='' type="time"
							id='endTime' name='endTime' value='00:00'>
							
							<label>종료날짜</label> <input class='form-control startDate'
							type="date" id='endDate' name='endDate' value='${sd }'>
							
							<label>장소</label> <input type='text' class='form-control'
							id='place' name='place' placeholder="예: 강남구 서초동" value=''>
														
							<label>내용</label>
							<textarea name="message" id="" cols="30" rows="10"></textarea>
							
							<label>강아지 선택</label> <select id='dogid' name='dogid' >
							<option value="1" selected='selected'>1번개
							<option value="2">2번개
							<option value="3">3번개
							</select>
						
						<button class="button margin-top-15" onclick="schedule(1)">등록</button>
						</form>	
	
						


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
