<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Header -->
	<div id="header">
		<div class="container">
			
			<!-- Left Side Content -->
			<div class="left-side" style="
			    height: 80px;
			    padding-top: 10px;
			    padding-bottom: 10px;">
	
				<!-- Logo -->
				<!-- <div id="logo">
					<a href="/"><img src="/resources/images/logo_gae.png" alt=""></a>
					<a href="/" class="dashboard-logo"><img src="/resources/images/logo_gae.png" alt=""></a>
				</div> -->
				
			
				
				<div id="logo">
				</div>  
				<script type="text/javascript">
					var logo = document.getElementById("logo");
					if(location.pathname.includes("mypage")){
						logo.innerHTML = '<a href="/" class="dashboard-logo"><img src="/resources/images/1_white.png" alt=""></a>';
					}else{
						logo.innerHTML = '<a href="/"><img src="/resources/images/1_black.png" alt=""></a>';
					}
				</script>

				<!-- Mobile Navigation -->
				<div class="menu-responsive">
					<i class="fa fa-reorder menu-tr	igger"></i>
				</div>

				<!-- Main Navigation -->
				<nav id="navigation" class="style-1" style="
				    padding-top: 5px;">
					<ul id="responsive">
						<div></div>
						<li><a href="/">Home</a></li>
						<li><a href="/map/viewMapList">Map</a></li>
						<li><a href="/event/viewEventList">Event</a></li>
						<li><a href="/review/viewReviewList">Review</a>
							<ul>
								<li><a href="/review/viewReviewList">Map</a></li>
								<li><a href="/review/viewReviewList">Event</a></li>
							</ul>
						</li>
						<li><a href="/mypage/viewMypageDashboard">MyPage</a>
							<ul>
								<li><a href="/mypage/viewMypageDashboard">Dashboard</a></li>
								<li><a href="/mypage/calendar/viewCalendar">Calendar</a></li>
								<li><a href="/mypage/viewMypageList">My Listings</a></li>
								<li><a href="/mypage/viewMypageReviews">Reviews</a></li>
								<li><a href="/mypage/viewMypageBookmarks">Bookmarks</a></li>
								<li><a href="#">Add Listing</a></li>
								<li><a href="/mypage/viewMypageProfile">My Profile</a></li>
								<li><a href="/mypage/viewPetList">Pet Profile</a></li>
							</ul>
						</li>
					</ul>
				</nav>
				<div class="clearfix"></div>
				<!-- Main Navigation / End -->
			</div>
			<!-- Left Side Content / End -->

			<c:choose>
				<c:when test="${empty member}">
					<!-- Right Side Content / End -->
					<div class="right-side" style= 'padding-top: 5px;'>
						<div class="header-widget" >
							<a href="#sign-in-dialog" class="sign-in popup-with-zoom-anim"><i class="sl sl-icon-login"></i> Sign In</a>
						</div>
					</div>
					<!-- Right Side Content / End -->
		
					<!-- Sign In Popup -->
					<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		
						<div class="small-dialog-header">
							<h3>Sign In</h3>
						</div>
		
						<!--Tabs -->
						<%@include file="login_register_tap.jsp" %>
						</div>
					</div>
				</c:when>
 				<c:otherwise>
					<!-- Right Side Content / End -->
					<div class="right-side">
						<!-- Header Widget -->
						<div class="header-widget" style="padding-top: 10px;"	>
							
							<!-- User Menu -->
							<div class="user-menu">
								<div class="user-name"><span><img src="/resources/upload/${member.photo}" alt=""></span>${member.nickname}</div>
								<ul>
									<li><a href="/mypage/viewMypageDashboard"><i class="sl sl-icon-settings"></i> Dashboard</a></li>
									<li><a href="/mypage/viewMypageProfile"><i class="sl sl-icon-user"></i> My Profile</a></li>
									<li><a href="/mypage/viewPetList"><i class="im im-icon-Dog"></i> Pet Profile</a></li>
									<li><a href="/logout"><i class="sl sl-icon-power"></i> Logout</a></li>
								</ul>
							</div>
						</div>
						<!-- Header Widget / End -->
					</div>
					<!-- Right Side Content / End -->
			</c:otherwise>		
 			</c:choose>
			<!-- Sign In Popup / End -->
		</div>
	</div>
	<!-- Header / End -->
