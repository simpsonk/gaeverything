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
					<h2>My Listings</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>Comments</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row">

			<!-- Listings --><!-- 맵디테일의 코멘트 -->
			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #F91942; color: white;">Comments in Map (${commentList.size()})</h4>
					<ul>
						<li>
							<div class="comments listing-reviews">
								<ul>
								<c:choose>
								<c:when test="${commentList.size()==0}">
								<li>
								<span>작성한 댓글이 없습니다.</span>
								</li>
								</c:when>
								</c:choose>	
									<c:forEach var="list" items="${commentList}">        								
									<li>										
											<div class="comment-by">Your Comments <div class="comment-by-listing own-comment">on <a href="/map/detail/viewDetailPage?locationSeq=${list.locationSeq}"><b>${list.address}</b></a></div> <span class="date">${list.regiDate}</span>
												<div class="star-rating" data-rating="${list.rating}"></div>
											</div>
											<p>${list.message}</p>
											<a href="#" class="rate-review"><i class="sl sl-icon-note"></i> Edit</a>										
											<a href="#" class="rate-review"><i class="sl sl-icon-close"></i> Delete</a>						
									</li>
									</c:forEach>
								</ul>
							</div>
						</li>

					</ul>
				</div>
			</div>


	 		<!-- Listings --><!-- 리뷰게시판의 코멘트 -->
			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #F91942; color: white;">Comments in Review (${bCommentList.size()})</h4>
					<ul>
						<li>
							<div class="comments listing-reviews">
								<ul>
								<c:choose>
								<c:when test="${bCommentList.size()==0}">
								<li>
								<span>작성한 댓글이 없습니다.</span>
								</li>
								</c:when>
								</c:choose>	
									<c:forEach var="list" items="${bCommentList}" varStatus="loop">									        								
									<form action="" method="post" id="listOfComment${loop.index}">
									<li>																					
											<div class="comment-by">Your Comments <div class="comment-by-listing own-comment">on <a href="/review/readPost?boardNo=${list.groupNo}&page=1"><b>${list.title}</b></a></div> <span class="date">${list.regiDate}</span>
											</div>
											<p>${list.commentBody}</p>
											<a class="rate-review" onclick="cmt_url(1, ${loop.index},1);"><i class="sl sl-icon-note"></i> Edit</a>										
											<a href="/mypage/removeMyBoardCmt?commentNo=${list.commentNo}&category=2" class="rate-review"><i class="sl sl-icon-close"></i> Delete</a>						
											<input type="hidden" name="commentNo" value ="${list.commentNo}">
											<input type="hidden" name="groupNo" value ="${list.groupNo}">
									</li>
									</form>
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
<script>
function cmt_url(type, index, page){
		var data = document.getElementById("listOfComment"+index);	
		if(type == 1){
			url = "/mypage/modifyCmt?page="+page;
		}
		data.action = url;
		data.submit();
	}
</script>
</body>
</html>
