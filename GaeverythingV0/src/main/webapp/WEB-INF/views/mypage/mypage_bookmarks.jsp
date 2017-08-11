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
					<h2>Bookmarks (${member.bookmarkReviewSize+member.bookmarkMapSize+member.bookmarkEventSize})</h2>
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
			<div class="col-lg-4 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #fa5b0f; color: white;">Reviews (${reviewList.size()})</h4>
					<ul>						
						<c:choose>
						<c:when test="${reviewList.size()==0}">
						<li>
						<span>북마크한 리뷰가 없습니다.</span>
						</li>
						</c:when>
						</c:choose>
						<c:forEach var="list" items="${reviewList}" varStatus="status">        
						<c:if test="${status.index<3}">	
						<li>							
							<div class="list-box-listing">
								<div class="list-box-listing-img"><a href="/review/readPost?boardNo=${list.boardNo}&page=1">
								<c:choose>
								<c:when test="${list.uploadImg!=null}">
											<img src="/resources/upload/${list.uploadImg}" alt="">	
											</c:when>	
											<c:otherwise>
											<img src="/resources/images/hospital.jpg" alt="">	
											</c:otherwise></c:choose>	</a></div>
								<div class="list-box-listing-content">
									<div class="inner">
										<h3>${list.title}</h3>
										<span>${list.address}</span>
										<div class="star-rating" data-rating="${list.rating}">
											<div class="rating-counter">(${list.numOfCmt} comments)</div>
										</div>
									</div>
								</div>
							</div>
							<div class="buttons-to-right">
							 	<a href="/mypage/deleteBookmarks?contentno=${list.boardNo}" class="button gray"> 
							 	<i class="sl sl-icon-close"></i> Delete
							 	</a> 
							 </div>
							 
						</li>
						</c:if>
						</c:forEach>
						<c:choose>
						<c:when test="${fn:length(reviewList) > 3}">
						<li>						
								<a href="/mypage/viewMypageBookmarks?category=1" class="read-more">Read More <i class="fa fa-angle-right"></i></a>		
						</li>				
						</c:when>
						</c:choose>


					</ul>
				</div>
			</div>
			
			<div class="col-lg-4 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #37b6bd; color: white;">Hospitals (${mapList.size()})</h4>
					<ul>
						<c:choose>
						<c:when test="${mapList.size()==0}">
						<li>
						<span>북마크한 병원이 없습니다.</span>
						</li>
						</c:when>
						</c:choose>
						<c:forEach var="list" items="${mapList}" varStatus="status">        
						<c:if test="${status.index<3}">	    
						<li>							
							<div class="list-box-listing">
								<div class="list-box-listing-img"><a href="/map/detail/viewDetailPage?locationSeq=${list.locationSeq}">
								<c:choose>
								<c:when test="${list.imageUrl!=null}">
											<img src="${list.imageUrl}" alt="">	
											</c:when>	
											<c:otherwise>
											<img src="/resources/images/hospital.jpg" alt="">	
											</c:otherwise></c:choose>	</a></div>
								<div class="list-box-listing-content">
									<div class="inner">
										<h3>${list.title}</h3>
										<span>${list.address}</span>
										 <div class="star-rating" data-rating="${list.averageRatings}">
											<div class="rating-counter">(${list.countRatings} ratings)</div>
										</div> 
									</div>
								</div>
							</div>
							<div class="buttons-to-right">
							 	<a href="/mypage/deleteShopBookmarks?contentno=${list.locationSeq}" class="button gray"> 
							 	<i class="sl sl-icon-close"></i> Delete
							 	</a> 
							 </div>
						</li>
						</c:if>
						</c:forEach>
						<c:choose>
						<c:when test="${fn:length(mapList) > 3}">
						<li>						
								<a href="/mypage/viewMypageBookmarks?category=2" class="read-more">Read More <i class="fa fa-angle-right"></i></a>		
						</li>				
						</c:when>
						</c:choose>

					</ul>
				</div>
			</div>
			
 			 <div class="col-lg-4 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #F91942; color: white;">Events (${eventList.size()})</h4>
					<ul>
						<c:choose>
						<c:when test="${eventList.size()==0}">
						<li>
						<span>북마크한 이벤트가 없습니다.</span>
						</li>
						</c:when>
						</c:choose>
						<c:forEach var="list" items="${eventList}" varStatus="status">        
						<c:if test="${status.index<3}">	     
						<li>							
							<div class="list-box-listing">
								<div class="list-box-listing-img"><a href="/event/detail/view?no=${list.eventNo}">
								<img src="/resources/images/event/${list.thumbnail}" alt=""></a></div>
								<div class="list-box-listing-content">
									<div class="inner">
										<h3>${list.eventName}</h3>
										<span>${list.location}</span>
										<span><i class="fa fa-calendar-check-o"></i>${list.startDate} ~ ${list.endDate}</span>
										<%--  <div class="star-rating" data-rating="${list.averageRatings}">
											<div class="rating-counter">(${list.countRatings} ratings)</div>
										</div> 아직 아래에 하드코딩으로 돼있음 --%>
										<div class="star-rating" data-rating="3.5">
											<div class="rating-counter">(12 ratings)</div>
										</div>
									</div>
								</div>
							</div>
							<div class="buttons-to-right">
							 	<a href="/mypage/deleteEventBookmarks?contentno=${list.eventNo}" class="button gray"> 
							 	<i class="sl sl-icon-close"></i> Delete
							 	</a> 
							 </div>
						</li>
						</c:if>
						</c:forEach>
						<c:choose>
						<c:when test="${fn:length(eventList) > 3}">
						<li>						
								<a href="/mypage/viewMypageBookmarks?category=3" class="read-more">Read More <i class="fa fa-angle-right"></i></a>		
						</li>				
						</c:when>
						</c:choose>

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
