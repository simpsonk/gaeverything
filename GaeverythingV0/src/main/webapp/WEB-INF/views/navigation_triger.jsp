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
				<li class="active"><a href="/mypage/viewMypageList"><i class="sl sl-icon-layers"></i> My Listings</a>
					<ul>						
						<li><a href="/mypage/viewMypageList?category=2">Comments <span class="nav-tag yellow">${commentList.size()}</span></a></li>
						<li><a href="/mypage/viewMypageList?category=1">Reviews <span class="nav-tag green">${reviewList.size()}</span></a></li>
					</ul>	
				</li>
				<li class="active"><a href="/mypage/viewMypageBookmarks"><i class="sl sl-icon-heart"></i>Bookmarks</a>
					<ul>
						<li><a href="/mypage/viewMypageBookmarks?category=1">Reviews <span class="nav-tag green">6</span></a></li>
						<li><a href="/mypage/viewMypageBookmarks?category=2">Hospitals <span class="nav-tag yellow">1</span></a></li>
						<li><a href="/mypage/viewMypageBookmarks?category=3">Events <span class="nav-tag red">2</span></a></li>
					</ul>	
				</li>			
			</ul>	

			<ul data-submenu-title="Account">
				<li><a href="/mypage/viewMypageProfile"><i class="sl sl-icon-user"></i> My Profile</a></li>
				<li><a href="/mypage/viewPetList"><i class="im im-icon-Dog"></i> Pet Profile</a></li>
				
				<li><a href="/logout"><i class="sl sl-icon-power"></i> Logout</a></li>
			</ul>

		</div>
	</div>
