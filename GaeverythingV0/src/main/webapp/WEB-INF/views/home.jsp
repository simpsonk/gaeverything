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


<!-- Banner
================================================== -->
<form action="/map/homeSearchResult" method="post">
<div class="main-search-container" data-background-image="/resources/images/main-search-background-03.jpg">
	<div class="main-search-inner">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h2>Find Nearby Attractions</h2>
					<h4>Explore top-rated dog cares, events and more!</h4>

					<div class="main-search-input">
						<div class="main-search-input-item">
							<input type="text" placeholder="What are you looking for?" name = "searchWord" value=""/>
						</div>
						
						<div class="main-search-input-item">
							<select data-placeholder="All Categories" class="chosen-select" name="searchOption">
								<option value="1">Name</option>
								<option value="2">Location</option>
							</select>
						</div>

						<button class="button">Search</button>
					</div>
					<div class="main-search-input" style="margin-top: 10px;width: 518px;">
						<div class="panel-dropdown-content checkboxes categories" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;font-size:16px;">
							<span style="padding-right: 10px;padding-left: 20px;">Categories : </span>  
							<input id="check-1" type="checkbox" name="check" checked="checked" value="5 449 776">
							<label for="check-1">Hospital</label>
	
							<input id="check-2" type="checkbox" name="check">
							<label for="check-2">Event</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<!-- Content
================================================== -->
<div class="container">
	<div class="row">

		<div class="col-md-12">
			<h3 class="headline centered margin-top-75">
				Popular Categories
				<span>Browse <i>the most desirable</i> categories</span>
			</h3>
		</div>

	</div>
</div>


<!-- Categories Carousel -->
<div class="fullwidth-carousel-container margin-top-25">
	<div class="fullwidth-slick-carousel category-carousel">

		<!-- Item -->
		<div class="fw-carousel-item">

			<!-- this (first) box will be hidden under 1680px resolution -->
			<div class="category-box-container half">
				<a href="listings-half-screen-map-grid-1.html" class="category-box" data-background-image="/resources/images/category-box-01.jpg">
					<div class="category-box-content">
						<h3>Hotels</h3>
						<span>64 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>

			<div class="category-box-container half">
				<a href="listings-half-screen-map-grid-1.html" class="category-box" data-background-image="/resources/images/category-box-02.jpg">
					<div class="category-box-content">
						<h3>Shops</h3>
						<span>14 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>
		</div>

		<!-- Item -->
		<div class="fw-carousel-item">
			<div class="category-box-container">
				<a href="listings-half-screen-map-grid-1.html" class="category-box" data-background-image="/resources/images/category-box-03.jpg">
					<div class="category-box-content">
						<h3>Events</h3>
						<span>67 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>
		</div>

		<!-- Item -->
		<div class="fw-carousel-item">
			<div class="category-box-container">
				<a href="listings-half-screen-map-grid-1.html" class="category-box" data-background-image="/resources/images/category-box-04.jpg">
					<div class="category-box-content">
						<h3>Fitness</h3>
						<span>27 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>
		</div>

		<!-- Item -->
		<div class="fw-carousel-item">
			<div class="category-box-container">
				<a href="listings-half-screen-map-list.html" class="category-box" data-background-image="/resources/images/category-box-05.jpg">
					<div class="category-box-content">
						<h3>Nightlife</h3>
						<span>22 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>
		</div>

		<!-- Item -->
		<div class="fw-carousel-item">
			<div class="category-box-container">
				<a href="listings-half-screen-map-list.html" class="category-box" data-background-image="/resources/images/category-box-06.jpg">
					<div class="category-box-content">
						<h3>Eat & Drink</h3>
						<span>130 listings</span>
					</div>
					<span class="category-box-btn">Browse</span>
				</a>
			</div>
		</div>

	</div>
</div>
<!-- Categories Carousel / End -->



<!-- Fullwidth Section1: 가장 리뷰 수 많은 곳 -->
<section class="fullwidth margin-top-65 padding-top-75 padding-bottom-70" data-background-color="#f8f8f8">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="headline centered margin-bottom-45">
					Most Reviewed Places
					<span>Discover most-reviewed local places</span>
				</h3>
			</div>

			<div class="col-md-12">
				<div class="sim" id="mostReviewed">

				<!-- Listing Item -->
				<!-- Listing Item / End -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Fullwidth Section / End -->


<!-- Fullwidth Section2: 가장 별점 많이 받은 곳 -->
<section class="fullwidth margin-top-65 padding-top-75 padding-bottom-70" data-background-color="#f8f8f8">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="headline centered margin-bottom-45">
					Most Rated Places
					<span>Discover most-rated local places</span>
				</h3>
			</div>

			<div class="col-md-12">
				<div class="sim" id="mostRated">

				<!-- Listing Item -->
				<!-- Listing Item / End -->
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Fullwidth Section / End -->



<!-- Info Section -->

<!-- Info Section / End -->


<!-- Recent Blog Posts -->
<section class="fullwidth border-top margin-top-70 padding-top-75 padding-bottom-75" data-background-color="#fff">
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<h3 class="headline centered margin-bottom-45">
					From The Blog
				</h3>
			</div>
		</div>

		<div class="row">
			<!-- Blog Post Item -->
			<div class="col-md-4">
				<a href="pages-blog-post.html" class="blog-compact-item-container">
					<div class="blog-compact-item">
						<img src="/resources/images/blog-compact-post-01.jpg" alt="">
						<span class="blog-item-tag">Tips</span>
						<div class="blog-compact-item-content">
							<ul class="blog-post-tags">
								<li>22 August 2017</li>
							</ul>
							<h3>Hotels for All Budgets</h3>
							<p>Sed sed tristique nibh iam porta volutpat finibus. Donec in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
						</div>
					</div>
				</a>
			</div>
			<!-- Blog post Item / End -->

			<!-- Blog Post Item -->
			<div class="col-md-4">
				<a href="pages-blog-post.html" class="blog-compact-item-container">
					<div class="blog-compact-item">
						<img src="/resources/images/blog-compact-post-02.jpg" alt="">
						<span class="blog-item-tag">Tips</span>
						<div class="blog-compact-item-content">
							<ul class="blog-post-tags">
								<li>18 August 2017</li>
							</ul>
							<h3>The 50 Greatest Street Arts In London</h3>
							<p>Sed sed tristique nibh iam porta volutpat finibus. Donec in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
						</div>
					</div>
				</a>
			</div>
			<!-- Blog post Item / End -->

			<!-- Blog Post Item -->
			<div class="col-md-4">
				<a href="pages-blog-post.html" class="blog-compact-item-container">
					<div class="blog-compact-item">
						<img src="/resources/images/blog-compact-post-03.jpg" alt="">
						<span class="blog-item-tag">Tips</span>
						<div class="blog-compact-item-content">
							<ul class="blog-post-tags">
								<li>10 August 2017</li>
							</ul>
							<h3>The Best Cofee Shops In Sydney Neighborhoods</h3>
							<p>Sed sed tristique nibh iam porta volutpat finibus. Donec in aliquet urneget mattis lorem. Pellentesque pellentesque.</p>
						</div>
					</div>
				</a>
			</div>
			<!-- Blog post Item / End -->

			<div class="col-md-12 centered-content">
				<a href="pages-blog.html" class="button border margin-top-10">View Blog</a>
			</div>

		</div>

	</div>
</section>
<!-- Recent Blog Posts / End -->


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
<script>

$(document).ready(function(){
	mostReviewed();
	mostRated();
});


	//most reviewed 
	function mostReviewed(){
		$.ajax({
			url 	 : "/mostReviewed",
			dataType : "json", 
			type	 : 'post',
			success  : function(hList){
				makeMostReviewdList(hList);
				nearbySlide();
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	function nearbySlide(){
		$('.sim').slick({
			infinite: true,
			slidesToShow: 3,
			slidesToScroll: 3,
			
			});
	}
	
	
	
	function makeMostReviewdList(hList){
		var ele = document.getElementById("mostReviewed");
		var fragment = document.createDocumentFragment();
		for(var i=0; i<3; i++){
			var itemEle = document.createElement("div");
			var item = "";
						if(hList[i].category == 'HP8'){
							item = 	'	<a href="/map/detail/viewDetailPage?locationSeq='+hList[i].no+'" class="listing-item-container">'+
							  		'		<div class="listing-item">';
						}else{
							item = 	'	<a href="/event/detail/view?no='+hList[i].no+'" class="listing-item-container">'+
							   		'		<div class="listing-item">';
						}

					   if(hList[i].image== null && hList[i].category == "HP8"){
						   item +='	<img src="/resources/images/hospital.jpg" alt="">';
					   }else if(hList[i].image == null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/dogevent.jpg" alt="">';
					   }else if(hList[i].image != null && hList[i].category == "HP8"){
						   item +='	<img src="'+hList[i].image+'" alt="">';
					   }else if(hList[i].image != null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/'+hList[i].image+'" alt="">';
					   }
					   
					   item +=
							'<div class="listing-item-details">'+
							'	<ul>'+
							'		<li><h1><strong>'+hList[i].totalReview+'</strong></h1> reviews</li>'+
							'	</ul>'+
							'</div>'+
					 		'<div class="listing-item-content">';
					   if(hList[i].category == 'HP8'){
						   item +=	 '<span class="tag" style="background: #f91942;">Hospital</span>';
					   }else if(hList[i].category == 'event1'){
						   item +=	 '<span class="tag" style="background: #f91942;">Event</span>';
					   }
					   item +=
					 /*  '		<span class="tag">Eat & Drink</span>'+ */
					   '		<h3>'+hList[i].title+'</h3>'	+
					   '		<span>'+hList[i].address+'</span>'+
					   '	</div>'+
					   '	<span class="add-schedule"></span>'+
					   '</div>'+
					   '<div class="star-rating" data-rating="'+hList[i].avgRating+'">'+
					   '	<div class="rating-counter"> 평균 '+ hList[i].avgRating+' 점</div>'+
					   '</div>'+
					   '</a>';
			itemEle.innerHTML = item;
			itemEle.className = 'carousel-item';
			fragment.appendChild(itemEle);
		}
		ele.appendChild(fragment);
		starRating('.star-rating');
		return ele;	   
	}
		
	//most rated
	function mostRated(){
		$.ajax({
			url 	 : "/mostRated",
			dataType : "json", 
			type	 : 'post',
			success  : function(hList){
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	//newest reviews
	function newestReview(){
		$.ajax({
			url 	 : "/mostReviewed",
			dataType : "json", 
			type	 : 'post',
			success  : function(data){
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	//most bookmarked
	function mostBookmarked(){
		$.ajax({
			url 	 : "/mostReviewed",
			dataType : "json", 
			type	 : 'post',
			success  : function(data){
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}


</script>
</body>
</html>
