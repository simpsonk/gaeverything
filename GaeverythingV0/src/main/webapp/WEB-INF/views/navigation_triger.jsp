<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
	
	<a href="" class="dashboard-responsive-nav-trigger"><i class="fa fa-reorder"></i> MyPage Navigation</a>
	
	<div class="dashboard-nav">
		<div class="dashboard-nav-inner">

			<ul data-submenu-title="Main">
				<li><a href="/mypage/viewMypageDashboard"><i class="sl sl-icon-settings"></i> Dashboard</a></li>
			</ul>
			
			<ul data-submenu-title="Listings">
				<li><a href="/mypage/calendar/viewCalendar"><i class="fa fa-calendar"></i> Calendar</a></li>
				<li class="active"><a><i class="sl sl-icon-layers"></i> My Listings</a>
					<ul>
						<li><a href="/mypage/viewMypageList">Active <span class="nav-tag green">6</span></a></li>
						<li><a href="/mypage/viewMypageList">Pending <span class="nav-tag yellow">1</span></a></li>
						<li><a href="/mypage/viewMypageList">Expired <span class="nav-tag red">2</span></a></li>
					</ul>	
				</li>
				<li><a href="/mypage/viewMypageReviews/"><i class="sl sl-icon-star"></i>Reviews</a></li>
				<li><a href="/mypage/viewMypageBookmarks"><i class="sl sl-icon-heart"></i>Bookmarks</a></li>
				<li><a href="#"><i class="sl sl-icon-plus"></i>Add Listing</a></li>
			</ul>	

			<ul data-submenu-title="Account">
				<li><a href="/mypage/viewMypageProfile"><i class="sl sl-icon-user"></i> My Profile</a></li>
				<li><a href="/mypage/viewMypagePetProfile"><i class="im im-icon-Dog"></i> Pet Profile</a></li>
				
				<li><a href="/logout"><i class="sl sl-icon-power"></i> Logout</a></li>
			</ul>

		</div>
	</div>
