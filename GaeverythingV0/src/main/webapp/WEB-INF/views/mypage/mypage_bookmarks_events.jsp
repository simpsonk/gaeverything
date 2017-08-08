<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
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
					<h2>Bookmarks</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>Bookmarks</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
		<div class="row">
			
			<!-- Listings -->
				<div class="col-lg-12 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4>Events (${eventList.size()})</h4>
					<ul>
						<c:choose>
						<c:when test="${eventList.size()==0}">
						<li>
						<span>북마크한 이벤트가 없습니다.</span>
						</li>
						</c:when>
						</c:choose>
						<c:forEach var="list" items="${eventList}">        
						<li>							
							<div class="list-box-listing">
								<div class="list-box-listing-img"><a href="/event/detail/viewDetailPage?eventNo=${list.eventNo}">
								<img src="/resources/images/event/${list.thumbnail}" alt=""></a></div>
								<div class="list-box-listing-content">
									<div class="inner">
										<h3>${list.eventName}</h3>
										<span>${list.location}</span>
										<span><i class="fa fa-calendar-check-o"></i>${list.startDate} ~ ${list.endDate}</span>
										 <%-- <div class="star-rating" data-rating="${list.averageRatings}">
											<div class="rating-counter">(${list.countRatings} ratings)</div>
										</div> 아직 아래에 하드코딩으로 돼있음--%>
										<div class="star-rating" data-rating="3.5">
											<div class="rating-counter">(12 ratings)</div>
										</div>
									</div>
								</div>
							</div>
							<div class="buttons-to-right">
							 	<a href="/mypage/deleteEventBookmarks?contentno=${list.eventNo}&category=3" class="button gray"> 
							 	<i class="sl sl-icon-close"></i> Delete
							 	</a> 
							 </div>
						</li>
						</c:forEach>
			
					</ul>
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
