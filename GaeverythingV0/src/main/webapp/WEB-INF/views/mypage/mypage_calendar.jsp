<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs push test1
================================================== -->
<title>gaeverything</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">
<link rel='stylesheet' href= "<c:url value = '/resources/css/fullcalendar.css'/>">
<link rel='stylesheet' href= "<c:url value = '/resources/css/fullcalendar.print.css'/>" media='print'>


<style type="text/css">
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	margin-bottom: 0;
	border-radius: 0;
}

/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 450px
}

/* Set gray background color and 100% height */
.sidenav {
	padding-top: 20px;
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}


#top {
	background: #eee;
	border-bottom: 1px solid #ddd;
	padding: 0 10px;
	line-height: 40px;
	font-size: 12px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}
</style>

</head>

<body>

<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container" class="fixed fullwidth dashboard">

	<!-- Header -->
	<%@include file= "../header.jsp" %>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard -->
<div id="dashboard">
	<!-- Navigation
	================================================== -->

	<!-- Responsive Navigation Trigger(Side Bar)-->
	<%@include file= "../navigation_triger.jsp" %>
	<!-- Navigation / End -->


	<!-- Content
	================================================== -->
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<h2>Calender</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>Calendar</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row">
			
			<!-- Listings -->
			<div class="col-lg-12 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<div id='calendar'></div>
				</div>
			</div>


			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="copyrights">© 2017 gaeverything. All Rights Reserved.</div>
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

<script type="text/javascript" src="<c:url value = '/resources/scripts/moment.min.js' />"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/jquery.min.js' />"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/fullcalendar.js' />"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/locale-all.js' />"></script>
<script>
	$(document).ready(
			
			function() {
				var initialLocaleCode = 'ko';

				$.ajax({
			        type: "POST",
			        contentType: "application/json",
			        data: "{}",
			        url: "/mypage/calendar/listAll",
			        dataType: "json",
			        success: function(data) {
			            
			        	$('#calendar').fullCalendar(
								{
									header : {
										left : 'prev,next today',
										center : 'title',
										right : 'month,basicWeek,basicDay'
									},
									defaultDate : moment(),
									locale : initialLocaleCode,
									buttonIcons : false, // show the prev/next text
									weekNumbers : false,
									navLinks : true, // can click day/week names to navigate views
									selectable: true,
									selectHelper: true,
									
									dayClick: function(date, allDay, jsEvent, view) {
										var sdt = date.format();
										var sdd = document.getElementById('startDate').value=date.format();
										sd.action = "/mypage/calendar/viewRegistCalendar";
										sd.submit();
									},
									
									editable : true,
									eventLimit : true, // allow "more" link when too many events
									events : data,
									eventClick: function(calEvent, jsEvent, view) {
										document.getElementById('seq').value=calEvent.seq;
										
										if(calEvent.color=='#0045C6'){//#A20082 #0045C6
											document.getElementById('longitude').value=calEvent.longitude;
											document.getElementById('latitude').value=calEvent.latitude;
											submitSeq.action = "/mypage/calendar/viewDetailCalendarLoc";
											submitSeq.submit();
										}else{
											submitSeq.action = "/mypage/calendar/viewDetailCalendar";
											submitSeq.submit();
										}
										
									}
								});
			      		  }
				    });
			});
</script>
<form method="post" id="sd">
	<input type="hidden" name="startDate" id="startDate" value=''>
</form>
<form method="post" id="submitSeq">
	<input type="hidden" name="seq" id="seq" value=''>
	<input type="hidden" name="longitude" id="longitude" value='0'>
	<input type="hidden" name="latitude" id="latitude" value='0'>
</form>

</body>
</html>
