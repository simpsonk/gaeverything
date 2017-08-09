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

	<!-- Header -->
	<%@include file = "../header.jsp" %>
	<!-- Header / End -->

</header>
<div class="clearfix"></div>
<!-- Header Container / End -->


<!-- Dashboard -->
<div id="dashboard">

	<!-- Navigation
	================================================== -->

	<!-- Responsive Navigation Trigger -->
	<%@include file= "../navigation_triger.jsp" %>
	<!-- Navigation / End -->


	<!-- Content
	================================================== -->
	<div class="dashboard-content">

		<!-- Titlebar -->
		<div id="titlebar">
			<div class="row">
				<div class="col-md-12">
					<h2>My Reviews</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>Reviews</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row" >
			<!-- Listings -->
			<div class="col-lg-12 col-md-12" >
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #F91942; color: white;">Reviews (${reviewList.size()})</h4>
					<ul>

						<li>
							<div class="comments listing-reviews">
								<ul>
								<c:choose>
								<c:when test="${reviewList.size()==0}">
								<li>
								<span>작성한 리뷰가 없습니다.</span>
								</li>
								</c:when>
								</c:choose>	
									<c:forEach var="list" items="${reviewList}">        								
									<li>
										<div class="list-box-listing">
											<div class="list-box-listing-img"><a href="/review/readPost?boardNo=${list.boardNo}&page=1">
											<c:choose>
											<c:when test="${list.uploadImg!=null}">
											<img src="/resources/upload/${list.uploadImg}" alt="">	
											</c:when>	
											<c:otherwise>
											<img src="/resources/images/hospital.jpg" alt="">	
											</c:otherwise>	
											</c:choose>
											</a></div>
											<div class="list-box-listing-content">
												<div class="inner">
												
										<a href="/review/readPost?boardNo=${list.boardNo}&page=1">
										<span><h3>${list.title}</h3></span></a>
											<div class="comment-by">review <div class="comment-by-listing own-comment">on 
											<a href="/map/detail/viewDetailPage?locationSeq=${list.locationSeq}"><b>${list.address}</b></a></div> 
											<span class="date">${list.regiDate}</span>
											<div class="star-rating" data-rating="${list.rating}"></div>
											</div>
											<p>${list.onlyText}</p>
											<div class="buttons-to-right">
											<a href="/review/clickModify?page=1&boardNo=${list.boardNo}" class="rate-review"><i class="sl sl-icon-note"></i> Edit</a>										
											<a href="/review/delete?boardNo=${list.boardNo}&mylisting=1&page=1" class="rate-review"><i class="sl sl-icon-close"></i> Delete</a>						
											</div>
											</div>
											</div>
										</div>									
										</li>
									
									</c:forEach>
									
								</ul>
							</div>
						</li>

					</ul>
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


</body>
</html>
