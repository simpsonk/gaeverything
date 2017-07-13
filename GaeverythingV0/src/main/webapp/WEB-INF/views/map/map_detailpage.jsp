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
<div class="listing-slider mfp-gallery-container margin-bottom-0">
	<a href="/resources/images/single-listing-01.jpg" data-background-image="/resources/images/single-listing-01.jpg" class="item mfp-gallery" title="Title 1"></a>
	<a href="/resources/images/single-listing-02.jpg" data-background-image="/resources/images/single-listing-02.jpg" class="item mfp-gallery" title="Title 3"></a>
	<a href="/resources/images/single-listing-03.jpg" data-background-image="/resources/images/single-listing-03.jpg" class="item mfp-gallery" title="Title 2"></a>
	<a href="/resources/images/single-listing-04.jpg" data-background-image="/resources/images/single-listing-04.jpg" class="item mfp-gallery" title="Title 4"></a>
</div>


<!-- Content
================================================== -->
<div class="container">
	<div class="row sticky-wrapper">
		<div class="col-lg-12 col-md-12 padding-right-100 padding-left-100 ">

			<!-- Titlebar -->
			<div id="titlebar" class="listing-titlebar " style="padding-bottom: 30px;">
				<div class="listing-titlebar-title">
					<h2>Burger House <span class="listing-tag">Eat & Drink</span></h2>
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
							2726 Shinn Street, New York
						</a>
					</span>
				</div>
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span><i class="fa fa-phone"></i></span>			
				</div>			
			</div>
			
			
			<!-- regist photo -->
			<div id="regist-photo" class="listing-section">
				<h3 class="listing-desc-headline margin-top-70 margin-bottom-30">Photo</h3>
				<!-- Uplaod Photos -->
				<div class="col-lg-12">
					<span>이 장소의 사진을 첫 번째로 등록해주세요.</span>
				
					<div class="add-review-photos" style="position:static;">
						<div class="photoUpload">
							<span><i class="sl sl-icon-arrow-up-circle"></i> Upload Photos</span>
						</div>
					</div>
				</div>
			</div>
			<!-- regist photo / End -->
			
			<!-- regist photo test push case1-->
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
			<!-- regist photo / End -->

		
			<!-- Location -->
			<div id="Location" class="listing-section">
				<h3 class="listing-desc-headline margin-top-60 margin-bottom-30">Location</h3>

				<div id="singleListingMap-container" align="center">
					<div id="singleListingMap" style="width: 750px; "></div>
				</div>
			</div>
				
			<!-- Comment -->
			<div id="listing-reviews" class="listing-section">
				<h3 class="listing-desc-headline margin-top-75 margin-bottom-20">Comment <span>(12)</span></h3>

				<div class="clearfix"></div>
				<!-- Add Review Box -->
				<div id="add-review" class="add-review-box" style="margin-top: 0px;">
	
					<!-- Add Review -->
					<h3 class="listing-desc-headline margin-bottom-20">Add Comment</h3>
					
					<span class="leave-rating-title">Your rating for this listing</span>
					
					<!-- Rating / Upload Button -->
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
					<form id="add-comment" class="add-comment">
						<fieldset>
							<div>
								<label>Comment:</label>
								<textarea cols="40" rows="3"></textarea>
							</div>
	
						</fieldset>
	
						<button class="button">Submit Comment</button>
						<div class="clearfix"></div>
					</form>
	
				</div>
				<!-- Add Review Box / End -->
				<!-- Reviews -->
				<section class="comments listing-reviews">

					<ul>
						<li>
							<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">Kathy Brown<span class="date">June 2017</span>
									<div class="star-rating" data-rating="5"></div>
								</div>
								<p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus</p>
							</div>
						</li>

						<li>
							<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /> </div>
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">John Doe<span class="date">May 2017</span>
									<div class="star-rating" data-rating="4"></div>
								</div>
								<p>Commodo est luctus eget. Proin in nunc laoreet justo volutpat blandit enim. Sem felis, ullamcorper vel aliquam non, varius eget justo. Duis quis nunc tellus sollicitudin mauris.</p>
							</div>
						</li>

						<li>
							<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">Kathy Brown<span class="date">June 2017</span>
									<div class="star-rating" data-rating="5"></div>
								</div>
								<p>Morbi velit eros, sagittis in facilisis non, rhoncus et erat. Nam posuere tristique sem, eu ultricies tortor imperdiet vitae. Curabitur lacinia neque non metus</p>
							</div>
						</li>

						<li>
							<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /> </div>
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">John Doe<span class="date">May 2017</span>
									<div class="star-rating" data-rating="5"></div>
								</div>
								<p>Commodo est luctus eget. Proin in nunc laoreet justo volutpat blandit enim. Sem felis, ullamcorper vel aliquam non, varius eget justo. Duis quis nunc tellus sollicitudin mauris.</p>
							</div>

						</li>
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
	var mapContainer = document.getElementById('singleListingMap'), // 지도를 표시할 div
		mapOption = { 
			center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level: 4 // 지도의 확대 레벨
		};
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
</script>

</body>
</html>
