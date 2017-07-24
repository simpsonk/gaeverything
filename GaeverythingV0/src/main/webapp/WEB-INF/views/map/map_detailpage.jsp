<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
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
<header id="header-container">
<%@include file = "../header.jsp" %>
</header>
<div class="clearfix"></div>
<!-- Header Container / End -->

<!-- Content
================================================== -->
<!-- Slider
================================================== -->



<!-- Content
===============================	=================== -->
<div class="container">
	<div class="row sticky-wrapper">
		<div class="col-lg-12 col-md-12 padding-right-100 padding-left-100 ">

			<!-- Titlebar -->
			<div id="titlebar" class="listing-titlebar " style="padding-bottom: 30px;">
				<div class="listing-titlebar-title">
					<h2>${detail.title} <span class="listing-tag"> Hospital </span></h2>
					<div>
						<span>average rating: 0 (0)</span><span style="margin-left: 20px;">12 Reviews</span><span style="margin-left: 20px;">159 people bookmarked this place</span>
					</div>					
				</div>
			</div>
			<div class="listing-share margin-bottom-20 no-border" style="text-align: left;">
					<button class="like-button"><span class="like-icon"></span> Bookmark this listing</button> 
			</div>
		
			
			<!-- Overview -->
			<div id="detail-Info" class="listing-section">
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span style="font-size: 16px;">
						<a href="#location" class="listing-address">
							<i class="fa fa-map-marker"></i>
							${detail.address}
						</a>
					</span>
				</div>
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span>
						<i class="fa fa-phone"></i>
						${detail.phone}
					</span>			
				</div>			
			</div>
						
			<!-- regist photo -->
			<div id="regist-photo" class="listing-section margin-top-70 margin-bottom-30">
				<div class="col-lg-12" style="padding-left: 0px;">
					<div class="col-lg-2" style="padding-left: 0px;">
						<h3 class="listing-desc-headline ">Photo</h3>
					</div>
					<!-- Uplaod Photos -->
					<div class="col-lg-10">
						<div style="height: 50px;margin-top: 34px;">
							<div class = "col-lg-8" style="padding-top: 8px;">
								<span>이 장소의 사진을 첫 번째로 등록해주세요.</span>
							</div>
							<div class="add-review-photos col-lg-4" style="position:static;">
								<div class="photoUpload">
									<span><i class="sl sl-icon-arrow-up-circle"></i> Upload Photos</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- regist photo / End -->
			
			<!-- regist photo test push case-->
			<div id="regist-review" class="listing-section margin-top-70 margin-bottom-30">
				<div class="col-lg-12" style="padding-left: 0px;">
					<div class="col-lg-2" style="padding-left: 0px;">
						<h3 class="listing-desc-headline ">Review</h3>
					</div>
					<!-- Uplaod Photos -->
					<div class="col-lg-10">
						<div style="height: 50px;margin-top: 34px;">
							<div class = "col-lg-8" style="padding-top: 8px;">
								<span>이 장소의 사진을 첫 번째로 등록해주세요.</span>
							</div>
							<div class="add-review-photos col-lg-4" style="position:static;">
								<div class="photoUpload">
									<span><i class="im im-icon-Pencil"></i> Write Review</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- write Review / End -->

		
			<!-- Location -->
			<input type="hidden" id="longitude" value="${detail.longitude}">
			<input type="hidden" id="latitude" value="${detail.latitude}">
			
			<div id="Location" class="listing-section">
				<h3 class="listing-desc-headline margin-top-60 margin-bottom-30">Location</h3>
	
				<div id="singleListingMap-container" align="center">
					<div id="singleListingMap" style="width: 750px; "></div>
				</div>
			</div>
				
			<!-- Comment -->
			<div id="listing-reviews" class="listing-section">
				<h3 class="listing-desc-headline margin-top-75 margin-bottom-20">Comment <span>(12)</span></h3>

				<!-- Add Review Box -->
				<div id="add-review" class="add-review-box" style="margin-top: 0px;">
	
					<!-- Add Review -->
					<h3 class="listing-desc-headline margin-bottom-20">Add Comment</h3>
					
					<span class="leave-rating-title">Your rating for this listing</span>
					
					<!-- Rating / Upload Button -->
					<form id="add-comment" action="/map/detail/addComment" class="add-comment" method="post">
						<input type="hidden" id="locationSeq" name="locationSeq" value="${detail.locationSeq}">
					
					<div class="row">
						<div class="col-md-6">
							<!-- Leave Rating -->
							<div class="clearfix"></div>
											   		
							<div class="leave-rating margin-bottom-30">
								<input type="radio" name="rating" id="rating-1" value="1"/>
								<label for="rating-1" class="fa fa-star"></label>
								<input type="radio" name="rating" id="rating-2" value="2"/>
								<label for="rating-2" class="fa fa-star"></label>
								<input type="radio" name="rating" id="rating-3" value="3"/>
								<label for="rating-3" class="fa fa-star"></label>
								<input type="radio" name="rating" id="rating-4" value="4"/>
								<label for="rating-4" class="fa fa-star"></label>
								<input type="radio" name="rating" id="rating-5" value="5"/>
								<label for="rating-5" class="fa fa-star"></label>
							</div>
							<div class="clearfix"></div>
						</div>
	
					</div>
		
					<!-- Review Comment -->
					
						<fieldset>
							<div>
								<label>Comment:</label>
								<textarea name="message" cols="40" rows="3"></textarea>
							</div>
	
						</fieldset>						
						<input type="button" id="registComment" value="Submit Comment">
						<div class="clearfix"></div>
					</form>
	
				</div>
				<!-- Add Review Box / End -->
				<!-- Reviews -->

				<section class="comments listing-reviews">
 				
					 <ul>
					  <c:forEach var="comm" items="${commentlist}">
						<li>
							 <div class="avatar"><img src="/resources/upload/${comm.photo}" alt="" /></div> 
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">${comm.nickname}<span class="date">${comm.regiDate}</span>
									<div class="star-rating" data-rating="${comm.rating}"></div>
								</div>
								<p>${comm.message}</p>
							</div>
						</li>
				  </c:forEach>
						
					 </ul>
			 
				</section> 

				<!-- Pagination -->
				<div class="clearfix"></div>
				<div class="row">
					<div class="col-md-12">
						<!-- Pagination -->
						<div class="pagination-container margin-top-30">
							<nav class="pagination">
								<ul>
									<li><a href="#" class="current-page">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#"><i class="sl sl-icon-arrow-right"></i></a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<!-- Pagination / End -->
			</div>
		</div>


	</div>
</div>
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
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=fa1e9654d15cae4c8c5f39d8b36f7984"></script>

<script type="text/javascript">
	var longitude = document.getElementById('longitude').value;
	var latitude = document.getElementById('latitude').value;
	
	var mapContainer = document.getElementById('singleListingMap'), // 지도를 표시할 div
		mapOption = { 
			center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
			
			level: 3 // 지도의 확대 레벨
		};
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	var markerPosition  = new daum.maps.LatLng(latitude, longitude); 
		
	    // 마커를 생성합니다
	var marker = new daum.maps.Marker({
		position: markerPosition
	});
	map.setCenter(new daum.maps.LatLng(latitude, longitude));
	marker.setMap(map);
	

//댓글 등록 버튼 클릭시
$('#registComment').click(function(){
	$('#add-comment').submit();
});
	
	
</script>

</body>
</html>
