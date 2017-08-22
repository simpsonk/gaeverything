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

				<h2>Top-Listed Places</h2><span>Find the most reviewed, rated and bookmarked places!</span>

				<!-- Breadcrumbs -->
	
				</nav>

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
			<div class="main-search-input gray-style margin-top-0 margin-bottom-10  col-md-4">
				<div class="main-search-input-item col-md-12">
					<select data-placeholder="All Categories" class="chosen-select" >
						<option>Latest</option>	
						<option>Most Reviewed places</option>
						<option>Most Rated Places</option>
						<option>Most Bookmarked Posts</option>
					</select>
				</div>
				<button class="button">Search</button>	
			</div>
		</div>
		<!-- Search Section / End -->


		<div class="col-md-12">
			<!-- Sorting - Filtering Section -->
			<!-- Sorting - Filtering Section / End -->

			<div class="row">
				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-01.jpg" alt="">

							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="3.5"></div>
								<h3>Tom's Restaurant</h3>
								<span>964 School Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-02.jpg" alt="">
							<div class="listing-item-details">
								<ul>
									<li>Friday, August 10</li>
								</ul>
							</div>
							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="5.0"></div>
								<h3>Sticky Band</h3>
								<span>Bishop Avenue, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->		

				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-03.jpg" alt="">
							<div class="listing-item-details">
								<ul>
									<li>Starting from $59 per night</li>
								</ul>
							</div>
							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="2.0"></div>
								<h3>Hotel Govendor</h3>
								<span>778 Country Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>

					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-04.jpg" alt="">

							<div class="listing-badge now-open">Now Open</div>

							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="5.0"></div>
								<h3>Burger House</h3>
								<span>2726 Shinn Street, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-05.jpg" alt="">
							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="3.5"></div>
								<h3>Airport</h3>
								<span>1512 Duncan Avenue, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

				<!-- Listing Item -->
				<div class="col-lg-4 col-md-6">
					<a href="listings-single-page.html" class="listing-item-container compact">
						<div class="listing-item">
							<img src="images/listing-item-06.jpg" alt="">

							<div class="listing-badge now-closed">Now Closed</div>

							<div class="listing-item-content">
								<div class="numerical-rating" data-rating="4.5"></div>
								<h3>Think Coffee</h3>
								<span>215 Terry Lane, New York</span>
							</div>
							<span class="like-icon"></span>
						</div>
					</a>
				</div>
				<!-- Listing Item / End -->

			</div>

			<!-- Pagination -->
			<div class="clearfix"></div>
			<div class="row">
				<div class="col-md-12">
					<!-- Pagination -->
					<div class="pagination-container margin-top-20 margin-bottom-40">
						<nav class="pagination">
							<ul>
								<li><a href="#" class="current-page">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
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
	
	
	//starRating('.star-rating');
});

function no_login_like(){
	alert("로그인을 해주세요!");
	location.href = "/viewLogin?url=/home";
}

</script>
</body>
</html>
