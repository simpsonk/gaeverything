<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<%@include file = "../header.jsp" %>
</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard -->
<div id="dashboard">

	<!-- Navigation
	================================================== -->

	<!-- Responsive Navigation Trigger(Side Bar) -->
	<%@include file= "../navigation_triger.jsp" %>
	<!-- Navigation / End -->


	<!-- Content
	================================================== -->
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<h2>Dashboard</h2> <span>User Panel Dashboard</span>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li>Dashboard</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<!-- Notice -->
		<!-- <div class="row">
			<div class="col-md-12">
				<div class="notification success closeable margin-bottom-30">
					<p>Your listing <strong>Hotel Govendor</strong> has been approved!</p>
					<a class="close" href="#"></a>
				</div>
			</div>
		</div> -->

		<!-- Content -->
		<div class="row">

			<!-- Item -->
			<div class="col-lg-4 col-md-6">
				<div class="dashboard-stat color-1">
					<div class="dashboard-stat-content"><h4>${countLocReviews}</h4> <span>Active Locations</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Map-Marker2"></i></div>
				</div>
			</div>

			<!-- Item -->
			<a href="/mypage/viewMypageList">
			<div class="col-lg-4 col-md-6">
				<div class="dashboard-stat color-3">
					<div class="dashboard-stat-content"><h4>${member.myCommentSize+member.myReviewSize}</h4> <span>Times Reviewed</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Pencil"></i></div>
				</div>
			</div>
			</a>

			<!-- Item -->
			<a href="/mypage/viewMypageBookmarks">
			<div class="col-lg-4 col-md-6">
				<div class="dashboard-stat color-4">
					<div class="dashboard-stat-content"><h4>${member.bookmarkReviewSize+member.bookmarkMapSize+member.bookmarkEventSize}</h4> <span>Times Bookmarked</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Heart"></i></div>
				</div>
			</div>
			</a>
		</div>


		<!-- Content -->
		<%-- <div class="row">

			<!-- Item -->
			<div class="col-lg-3 col-md-6">
				<div class="dashboard-stat color-1">
					<div class="dashboard-stat-content"><h4>${countLocReviews}</h4> <span>Active Listings</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Map2"></i></div>
				</div>
			</div>

			<!-- Item -->
			<div class="col-lg-3 col-md-6">
				<div class="dashboard-stat color-2">
					<div class="dashboard-stat-content"><h4>${countRead}</h4> <span>Total Views</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Line-Chart"></i></div>
				</div>
			</div>

			
			<!-- Item -->
			<div class="col-lg-3 col-md-6">
				<div class="dashboard-stat color-3">
					<div class="dashboard-stat-content"><h4>${countReviewCmt}</h4> <span>Times Replied</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Add-UserStar"></i></div>
				</div>
			</div> 

			<!-- Item -->
			<div class="col-lg-3 col-md-6">
				<div class="dashboard-stat color-4">
					<div class="dashboard-stat-content"><h4>${countReviewBookmark}</h4> <span>Times Bookmarked</span></div>
					<div class="dashboard-stat-icon"><i class="im im-icon-Heart"></i></div>
				</div>
			</div>
		</div>	--%>

		<div class="row">
			
			<%-- <!-- Recent Activity -->
			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box with-icons margin-top-20">
					<h4 style="background:#37b6bd; color:white"> News Of Bookmark</h4>
					<ul>
					<c:choose>
					<c:when test="${commentList.size()==0}">
						<li>
							<span>표시할 알림이 없습니다.</span>
						</li>
					</c:when>
					
					<c:otherwise>
					<c:forEach var="list" items="${commentList}" varStatus="status">
						
						<li>
							<i class="list-box-icon sl sl-icon-star"></i>${list.nickname}  left a comment <div class="numerical-rating" data-rating="${list.rating}"></div> on <strong><a href="/map/detail/viewDetailPage?locationSeq=${list.locationSeq}">${list.address}</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>
					</c:forEach>
					</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div> --%>
			
			
			<!-- Invoices -->
			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box invoices with-icons margin-top-20">
					<h4 style="background:#fa5b0f; color:white">Reactions</h4>
					<ul>
					<c:choose>
					<c:when test="${reactions.size()==0}">
						<li>
							<span>표시할 알림이 없습니다.</span>
						</li>
					</c:when>
					
					<c:otherwise>
					<c:forEach var="list" items="${reactions}" varStatus="status"> 
						<c:choose>
						<c:when test="${list.type=='B'}">
						<li>
							<i class="list-box-icon sl sl-icon-heart"></i><b> ${list.nicknameReact}</b> bookmarked your <strong><a href="/review/readPost?boardNo=${list.groupNo}&page=1">${list.title}</a></strong> listing!
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>
						</c:when>
						<c:otherwise>
						<li>
							<i class="list-box-icon sl sl-icon-pencil"></i><b>${list.nicknameReact}</b> left a comment on <strong><a href="/review/readPost?boardNo=${list.groupNo}&page=1"">${list.title}</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>
						</c:otherwise>
						</c:choose>
						
						
					</c:forEach> 
					</c:otherwise>
					</c:choose>
					</ul>
				</div>
			</div>

			<!-- Recent Activity -->
			<!-- <div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box with-icons margin-top-20">
					<h4 style="background:#37b6bd; color:white">Recent Activities</h4>
					<ul>
						<li>
							<i class="list-box-icon sl sl-icon-layers"></i> Your listing <strong><a href="#">Hotel Govendor</a></strong> has been approved!
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-star"></i> Kathy Brown left a review <div class="numerical-rating" data-rating="5.0"></div> on <strong><a href="#">Burger House</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-heart"></i> Someone bookmarked your <strong><a href="#">Burger House</a></strong> listing!
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-star"></i> Kathy Brown left a review <div class="numerical-rating" data-rating="3.0"></div> on <strong><a href="#">Airport</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-heart"></i> Someone bookmarked your <strong><a href="#">Burger House</a></strong> listing!
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-star"></i> John Doe left a review <div class="numerical-rating" data-rating="4.0"></div> on <strong><a href="#">Burger House</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>

						<li>
							<i class="list-box-icon sl sl-icon-star"></i> Jack Perry left a review <div class="numerical-rating" data-rating="2.5"></div> on <strong><a href="#">Tom's Restaurant</a></strong>
							<a href="#" class="close-list-item"><i class="fa fa-close"></i></a>
						</li>
					</ul>
				</div>
			</div> -->
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


</body>
</html>
