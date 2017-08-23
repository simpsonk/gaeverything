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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">
<script type="text/javascript">
</script>
</head>

<body>
<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container">
	<%@include file = 'header.jsp' %>
</header>
<div class="clearfix"></div>
<!-- Header Container / End -->

<!-- Titlebar
================================================== -->
<div id="titlebar" class="gradient">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Top-Listed Places</h2><span>Find <strong> the 20 most reviewed, rated and bookmarked</strong> places!</span>
			</div>
		</div>
	</div>
</div>


<!-- Content
================================================== -->
<div class="container">
	<div class="row">
		<!-- Search -->
		<div class="col-md-6">
			<div class="main-search-input gray-style margin-top-0 margin-bottom-10  col-md-2">
				<div class="main-search-input-item col-md-12">
					<select data-placeholder="All Categories" class="chosen-select" name ="categories" id="categories">
						<option value ="reviewed" ${sort == 'reviewed'?'selected="selected"':''}>Most Reviewed places</option>
						<option value ="rated" ${sort == 'rated'?'selected="selected"':''}>Most Rated Places</option>
						<option value ="bookmarked" ${sort == 'bookmarked'?'selected="selected"':''}>Most Bookmarked Posts</option>
					</select>
				</div>
				
			</div>
		</div>
		<!-- Search Section / End -->


		<div class="col-md-12">
			<!-- Sorting - Filtering Section -->
			<!-- most reviewd places -->
			<c:if test="${sort == 'reviewed'}">
			<c:forEach items ="${list1}" var="review" begin="0" end="19" >
				<div class="col-lg-4 col-md-6">
						<c:choose>
							<c:when test="${review.category == 'HP8'}">
								<a href="/map/detail/viewDetailPage?locationSeq=${review.no}" class="listing-item-container">
							</c:when>
							<c:otherwise>
								<a href="/event/detail/view?no=${review.no}" class="listing-item-container">
							</c:otherwise>
						</c:choose>
									<div class="listing-item">
										<c:choose>
											<c:when test="${(empty review.image) and (review.category == 'HP8')}">
												<img src="/resources/images/hospital.jpg" alt="">
											</c:when>
											<c:when test="${(empty review.image) and (review.category == 'event1')}">
												<img src="/resources/images/dogevent.jpg" alt="">
											</c:when>
											<c:when test="${(!empty review.image) and (review.category == 'HP8')}">
												<img src="${review.image}" alt="">
											</c:when>
											<c:otherwise>
												<img src="/resources/images/event/${review.image}" alt="">
											</c:otherwise>
										</c:choose>	
					
									<div class="listing-item-details">
										<ul>
											<li><h1><strong>${review.totalReview}</strong></h1> reviews</li>
										</ul>
									</div>
									<div class="listing-item-content">
									<c:choose>
									<c:when test="${review.category =='HP8'}">
										<span class="tag" style="background: #f91942;">Hospital</span>
									</c:when>
									<c:otherwise>
										<span class="tag" style="background: #f91942;">Event</span>
									</c:otherwise>
									</c:choose> 
					 					<h3>${review.title}</h3>
									 	<span>${review.address}</span>
					  				</div>
					   				<span class="like-icon" onclick = "no_login_like()"></span>
					  			</div>
					   			<div class="star-rating" data-rating="${review.avgRating}">
					  			 	<div class="rating-counter"> 평균 ${review.avgRating} 점</div>
					  			 </div>
					 		 </a>
					
					  </div>	
				</c:forEach>
				</c:if>
				
				
				<c:if test="${sort == 'rated'}">
				<c:forEach items="${list2}" var="rate" begin="0" end="19">
				<div class="col-lg-4 col-md-6">
					
						<c:choose>
						<c:when test="${rate.category == 'HP8'}">
							<a href="/map/detail/viewDetailPage?locationSeq=${rate.no}" class="listing-item-container compact">
						</c:when>
						<c:otherwise>
							<a href="/event/detail/view?no=${rate.no}" class="listing-item-container compact">
						</c:otherwise>
						</c:choose>
								<div class="listing-item">
									<c:choose>
										<c:when test="${(empty rate.image) and (rate.category == 'HP8')}">
											<img src="/resources/images/hospital.jpg" alt="">
										</c:when>
										<c:when test="${(empty rate.image) and (rate.category == 'event1')}">
											<img src="/resources/images/dogevent.jpg" alt="">
										</c:when>
										<c:when test="${(!empty rate.image) and (rate.category == 'HP8')}">
											<img src="${rate.image}" alt="">
										</c:when>
										<c:otherwise>
											<img src="/resources/images/event/${rate.image}" alt="">
										</c:otherwise>
									</c:choose>	
								<div class="listing-item-content">
					 				<div class="star-rating" data-rating="${rate.avgRating}">
					 					<div class="numerical-rating" data-rating="${rate.avgRating}"></div></div>
					 				<h3>${rate.title}</h3>
									<span>${rate.address}</span>
								</div>
									<span class="like-icon" onclick = "no_login_like()"></span>
								</div>
							</a>
						</div>
						</c:forEach>
				</c:if>		
				
				<c:if test="${sort == 'bookmarked'}">
				<c:forEach items ="${list3}" var="like" begin="0" end="19">
				<div class="col-lg-4 col-md-6">
							
							<c:choose>
							<c:when test="${like.category == 'HP8'}">
								<a href="/map/detail/viewDetailPage?locationSeq=${like.no}" class="listing-item-container">
							</c:when>
							<c:when test="${like.category == 'review'}">
								<a href="/review/readPost?boardNo=${like.no}" class="listing-item-container">
							</c:when>
							<c:otherwise>
								<a href="/event/detail/view?no=${like.no}" class="listing-item-container">
							</c:otherwise>
							</c:choose>
									<div class="listing-item">
									<c:choose>
										<c:when test="${(empty like.image) and (like.category == 'HP8')}">
											<img src="/resources/images/hospital.jpg" alt="">
										</c:when>
										<c:when test="${(empty like.image) and (like.category == 'event1')}">
											<img src="/resources/images/dogevent.jpg" alt="">
										</c:when>
										<c:when test="${(!empty like.image) and (like.category == 'HP8')}">
											<img src="${like.image}" alt="">
										</c:when>
										<c:otherwise>
											<img src="/resources/images/event/${like.image}" alt="">
										</c:otherwise>
									</c:choose>	
					
									<div class="listing-item-details">
										<ul>
											<li><i class="im im-icon-Heart" style="color:#f91942; font-size: 50px;"></i>${like.countLike}</li>
										</ul>
									</div>
									<div class="listing-item-content">
									<c:choose>
									<c:when test="${like.category =='HP8'}">
										<span class="tag" style="background: #f91942;">Hospital</span>
									</c:when>
									<c:when test= "${like.category =='review'}">
										<span class="tag" style="background: #f91942;">Review</span>
									</c:when>
									<c:otherwise>
										<span class="tag" style="background: #f91942;">Event</span>
									</c:otherwise>
									</c:choose> 
					 					<h3>${like.title}</h3>
									 	<span>${like.address}</span>
					  				</div>
					   				<span class="like-icon" onclick = "no_login_like()"></span>
					  			</div>
					   			<div class="star-rating" data-rating="${like.avgRating}">
					  			 	<div class="rating-counter"> 평균 ${like.avgRating} 점</div>
					  			 </div>
					 		 </a>
					  </div>				
				</c:forEach>
				</c:if>		
			<!-- Sorting - Filtering Section / End -->

			<!-- <div class="row">-->
				<!-- Listing Item -->
			<!--  </div> -->
  
			<!-- Pagination -->
				<!-- ////삭제//// -->
			<!-- Pagination / End -->

		</div>

	</div>
</div>

<!-- Footer
================================================== -->
<%@include file = "footer.jsp" %>
<!-- Footer / End -->


<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>


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
<script type="text/javascript" src="<c:url value = '/resources/scripts/home-list.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/jQuery.dotdotdot-master/src/jquery.dotdotdot.js'/>"></script>


<script>

$(document).ready(function(){
	//mostReviewed();
	//mostRated();
	//newestReview();
	$('.preview_box').dotdotdot({
		ellipis : '...',
		wrap    : 'word',
		height  : '100px',
		callback	: function( isTruncated, orgContent ) {},
		lastCharacter : {
			remove : ['','.',';','!','?'],
			noEllipis: []
		}
	});
	
	$('#categories').change(function(){
		var opt = $('select[name="categories"]').val();
		var url = '/viewMore?sort='+opt;
		location.href = url;
	});

});

function no_login_like(){
	alert("로그인을 해주세요!");
	location.href = "/viewLogin?url=/home";
}

</script>
</body>
</html>
