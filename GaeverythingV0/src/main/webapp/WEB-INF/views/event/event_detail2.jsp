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
		<div class="col-lg-8 col-md-8 padding-right-10 padding-left-10 ">
			<input type="hidden" id = "memberEmail" value="${member.email}" >
			<!-- Titlebar -->
			<div id="titlebar" class="listing-titlebar " style="padding-bottom: 15px;">
				<div class="listing-titlebar-title">
					<h2>${dto.eventName} <span class="listing-tag"> Event </span></h2>
					<div>
						<div class="star-rating" data-rating="${dto.averageRatings}"  style="margin-left: 20px;">
							<span style="margin-left: 15px;"><i class="sl sl-icon-note"></i>${reviewList.size()}</span>
							<span style="margin-left: 15px;"><i class="sl sl-icon-bubble"></i> ${commentlist.size()}</span>	
						</div>
					</div>					
				</div>
			</div>
			
			<c:choose>
				<c:when test="${member.nickname == null }">
					<div class="listing-share margin-bottom-20 no-border col-lg-4" style="text-align: left;">
						<button type="button" class="like-button" onclick="no_login_like()"><span class="like-icon"></span> Bookmark this event</button>
					</div>	
				</c:when>
				<c:otherwise>
					<div class="listing-share margin-bottom-20 no-border col-lg-4" style="text-align: left;">
						<button type="button" class="like-button" onclick="like_clicked()"><span id = "like" class="${dto.userLikeStatus}"></span> Bookmark this event</button>
					</div>	
				</c:otherwise>
			</c:choose>	
			
			
				<div class="listing-share margin-bottom-20 no-border col-lg-6" style="text-align: left; margin-top: 10px;">
					<span id="numOflike">${dto.countLike} people bookmarked this event.</span>
				</div>
			
		
			
			<!-- Overview -->
			<div id="detail-Info" class="listing-section">
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span style="font-size: 16px;"><i class="fa fa-info-circle"></i> ${dto.eventDetail}</span>			
				</div>
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span><a href="#location" class="listing-address"><i class="fa fa-map-marker"></i> ${dto.address}</a></span>
				</div>
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span><i class="fa fa-won"></i> ${dto.fee}
					</span>			
				</div>	
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span><i class="fa fa-smile-o"></i> ${dto.discountInfo}</span>			
				</div>
				<div style="padding-bottom: 30px; padding-left: 30px;">
					<span><i class="fa fa-arrow-circle-o-right"></i> <a href=${dto.regist}>사전접수하러 가기</a> </span>		
				</div>	
			</div>
										
			
			<!-- Location -->
			<input type="hidden" id="longitude" value="${dto.longitude}">
			<input type="hidden" id="latitude" value="${dto.latitude}">
			
			<div id="Location" class="listing-section">
				<h3 class="listing-desc-headline margin-top-60 margin-bottom-30">Location</h3>
	
				<div id="singleListingMap-container" align="center">
					<div id="singleListingMap" style="width: 750px; "></div>
				</div>
			</div>
			
			<!-- nearby -->
			<div id="blog-review" class="listing-section margin-top-20 margin-bottom-30">
				<div class="col-lg-12" style="padding-left: 0px;">	
					<h3 class="listing-desc-headline">Nearby(${nearbyCount})</h3>		
					
					<!-- 리스트 보여줄 곳  -->
						<div class="col-md-12" id="nearby">
							<div class="sim" id = "nearbyList">
							<!-- Listing Item  item -->
							<!--  item -->		
							</div>				
						</div>	
				</div>
			</div>			
						
			<!-- regist photo -->
			<div id="regist-photo" class="listing-section margin-top-70 margin-bottom-30">
				<div class="col-lg-12" style="padding-left: 0px;">
					
					<!-- Uplaod Photos -->
					
					<div class="col-lg-2" style="padding-left: 0px;">
						<h3 class="listing-desc-headline ">Photo <span>(${eventphoto.size()})</span></h3>
					</div>
					
					<div class="col-lg-10">
						<div style="height: 50px;margin-top: 34px;">
						<c:if test="${empty eventphoto}">
							<div class = "col-lg-8" style="padding-top: 8px;">
								<span>이 장소의 사진을 첫 번째로 등록해주세요.</span>
							</div>
						</c:if>
							<div class="add-review-photos col-lg-4" style="position:static;">
								<form id="addPhoto" action="" class="addPhoto" method="post"enctype="multipart/form-data">
									<input type="hidden" id="eventNo" name="eventNo" value="${dto.eventNo}">
									<div class="photoUpload">
										<span><i class="sl sl-icon-arrow-up-circle"></i> Upload Photos</span>
										<input name="photo" type="file" onchange="addEventPhoto()" class="upload" />
									</div>
								</form>
							</div>
						</div>
					</div>
					
					
					<div class="mfp-gallery-container" id="photoMoreView">
						
					</div>
					
					<%-- <c:if test="${fn:length(eventphoto)>4}">
					<input type="button" id="photoMore" value="Read More">
					<input type="button" id="photoHide" value="Hide">
					</c:if> --%>
					<c:if test="${fn:length(eventphoto) > 4}">
					<div class="row">
					<div class="col-lg-12">
					<div class="mfp-gallery-container">
							<c:forEach var="dp" items="${eventphoto}" varStatus="status">
									<a href="/resources/upload/${dp.eventPhoto}" style="display: none" class="mfp-gallery"></a>
									
							</c:forEach>
							<a class="read-more mfp-gallery">View More <i class=""></i></a>
					</div>
					</div>
					</div>
					</c:if>
				</div>
			</div>
			<!-- regist photo / End -->
			
			<!-- regist photo test push case-->
			<div id="regist-review" class="listing-section margin-top-70 margin-bottom-30">
				<div class="col-lg-2" style="padding-left: 0px;">				
					<h3 class="listing-desc-headline ">Review <span>(${reviewList.size()})</span></h3>							
				</div>
				<div class="col-lg-10">
					<div style="height: 50px;margin-top: 34px;">
						<c:if test="${empty reviewList}">
						<div class = "col-lg-8" style="padding-top: 8px;">							
						 	<span>이 장소의 리뷰를 첫 번째로 등록해주세요.</span> 							
						</div>
						</c:if>	
						<div class="add-review-photos col-lg-4" style="position:static;">		
							<div class="photoUpload">
								<span>
								<a href="/review/viewReviewRegist?locationSeq=${dto.eventNo}&boardCategory=EVENT&address=${dto.eventName}"><i class="im im-icon-Pencil"></i> Write Review</span></a>
							</div>
						</div>	
					</div>
				</div>
			<div class="col-lg-12" style="padding-left: 0px;">
					<div class="row">
							<c:forEach var="reviews" items="${reviewList}" varStatus="status">
								<c:if test="${status.index<3}">							

								<!-- Listing Item -->
								<div class="col-md-4">
									<a href="/review/readPost?boardNo=${reviews.boardNo}&page=1" class="listing-item-container">
										<div class="listing-item">
											<c:choose>
											<c:when test="${reviews.uploadImg!=null}">
											<img src="/resources/upload/${reviews.uploadImg}" alt="">	
											</c:when>	
											<c:otherwise>
											<img src="/resources/images/hospital.jpg" alt="">	
											</c:otherwise>	
											</c:choose>				
											<div class="listing-item-content">							
												<h3>${reviews.title}</h3>												
												<span>${reviews.nickname}</span><br>
												<span>${reviews.regiDate}</span>
											</div>
										</div>
										<span class="star-rating" data-rating="${reviews.rating}">(${reviews.numOfCmt} comments)</span>															
								
									</a>
								</div>
								</c:if>
							</c:forEach>	
					</div>
					<c:if test="${fn:length(reviewList) > 3}">
					<div class="row">
						<a href="/review/viewDetailReviews?eventNo=${dto.eventNo}&page=1" class="read-more">Read More <i class="fa fa-angle-right"></i></a>
					</div>
					</c:if>
					</div>
			<!-- write Review / End -->
		
				
			<!-- Comment -->
			<div id="listing-reviews" class="listing-section">
				<h3 class="listing-desc-headline margin-top-75 margin-bottom-20">Comment <span>(${commentlist.size()})</span></h3>

				<!-- Add Review Box -->
				<div id="add-review" class="add-review-box" style="margin-top: 0px;">
	
					<!-- Add Review -->
					<h3 id="ment" class="listing-desc-headline margin-bottom-20">Add Comment</h3>
					
					<span class="leave-rating-title">Your rating for this listing</span>
					
					<!-- Rating / Upload Button -->
					<form id="add-comment" action="" class="add-comment" method="post">
						<input type="hidden" id="eventNo" name="eventNo" value="${dto.eventNo}">
						<input type="hidden" id="commentNo" name = "commentNo" value = "0" >
					
					<div class="row">
						<div class="col-md-6">
							<!-- Leave Rating -->
								<!-- rating -->
						<div class = "rating col-md-12" style="padding-bottom: 10px; padding-left: 0px;">					
								
							<fieldset class="rating">
  								<input type="radio" id="star5" name="rating" value="5.0"  />
  								<label class = "full" for="star5" title="Awesome - 5 stars"></label>
	  								
	   							<input type="radio" id="star4half" name="rating" value="4.5"/>
	   							<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
   							
  								<input type="radio" id="star4" name="rating" value="4.0"  />
  								<label class = "full" for="star4" title="Pretty good - 4 stars"></label>
	  								
	   							<input type="radio" id="star3half" name="rating" value="3.5" />
	   							<label class="half" for="star3half" title="Meh - 3.5 stars"></label>
	   							
	   							<input type="radio" id="star3" name="rating" value="3.0" />
	   							<label class = "full" for="star3" title="Meh - 3 stars"></label>
	   							
	   							<input type="radio" id="star2half" name="rating" value="2.5" />
	   							<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
	   									
  		 						<input type="radio" id="star2" name="rating" value="2.0" />
  		 						<label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
	  		 						
	   							<input type="radio" id="star1half" name="rating" value="1.5" />
	   							<label class="half" for="star1half" title="Meh - 1.5 stars"></label>
	   							
	   							<input type="radio" id="star1" name="rating" value="1.0"/>
	   							<label class = "full" for="star1" title="Sucks big time - 1 star"></label>
	   							
	   							<input type="radio" id="starhalf" name="rating" value="0.5" />
	   							<label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
							</fieldset>
											
						</div>
						</div>
				
					</div>
		
					<!-- Review Comment -->
					
						<fieldset>
							<div>
								<label>Comment:	</label>
								<c:choose>
										<c:when test="${member.nickname == null}">
											<textarea cols="40" rows="3" id="commMsg" name="message" onclick="box_clicked(${dto.eventNo})" placeholder="로그인 후 댓글작성이 가능합니다."></textarea>
										</c:when>
										<c:otherwise>
											<textarea cols="40" rows="3" id="commMsg" name="message" placeholder="댓글을 작성해주세요 :)"></textarea>
										</c:otherwise>
								</c:choose>
						
							</div>
	
						</fieldset>					
						<input type="hidden" id="isLogin" value="${member.nickname}">	
						<button type="button" id="registComment" class = "button margin-top-15" style="height: 50px;">Submit Comment</button>
						<button type="button" id="modifyComment" class = "button margin-top-15" style="height: 50px; display: none;">Modify Comment</button>
						<div class="clearfix"></div>
					</form>
	
				</div>
				<!-- Add Review Box / End -->
				<!-- Reviews -->
			<form id="commentData" method="post">
				<input type="hidden" id="eventNo2" name="eventNo2" value="${dto.eventNo}">
				<section class="comments listing-reviews">
 					
					 <ul>
					 <div class="row fs-listings" id = "replyList" >
					 </div>
				  	<c:if test="${fn:length(commentlist) > 5}">
					<div class="row" style="float:center;">
						<input type="button" id="commentMore" value="Read More">
							<!-- <a id="commentMore" href="" class="read-more">Read More <i class="fa fa-angle-right"></i></a> -->
					</div>
					</c:if>
					 </ul>
				</section> 
			</form>
			</div>
		</div>
	</div>


<!-- Sidebar
================================================== -->

		<div class="col-lg-4 col-md-4 margin-top-75 sticky">

			<!-- Book Now -->
			<div class="boxed-widget">
				<h3><i class="fa fa-calendar-check-o "></i> Add to Calendar</h3>
				<div class="row with-forms  margin-top-0">
					<form method="post" action="" id="booking-calendar">
						<!-- Date Picker - docs: http://www.vasterad.com/docs/listeo/#!/date_picker -->
						<div class="col-lg-6 col-md-12">
							<input type="text" id="booking-date" name="bookDate" data-format="Y-m-d"   data-lang="ko" data-large-mode="true" data-min-year="2017" data-max-year="2020" data-default-date="${dto.addDate}">
							<!-- <input type="text" id="booking-date" name="bookDate" data-format="Y-m-d" data-lang="ko" data-large-mode="true" data-min-year="2017" data-max-year="2020"> -->
							
						</div>
	
						<!-- Time Picker - docs: http://www.vasterad.com/docs/listeo/#!/time_picker -->
						<div class="col-lg-6 col-md-12">
							<input type="text" id="booking-time" name="bookTime" value="10:00 am">
						</div>
						<input type="hidden" id="isLogin3" name="bookEmail" value="${member.nickname}">
						<input type="hidden" id="eventName" name="eventName" value="${dto.eventName}">
						<input type="hidden" id="eventAddress" name="eventAddress" value="${dto.address}">
						
					</form>
				</div>
				
				<!-- progress button animation handled via custom.js -->
				<button class="progress-button button fullwidth margin-top-5" id="bookNow"><span>Add</span></button>
			</div>
			<!-- Book Now / End -->


			<!-- Contact -->
			<div class="boxed-widget margin-top-35">
				<h3><i class="sl sl-icon-pin"></i> Contact</h3>
				<ul class="listing-details-sidebar">
					<li><i class="fa fa-phone"></i> ${dto.call}</li>
					<li><i class="fa fa-map-marker"></i> <a href="#location" class="listing-address" id="address">${dto.address}</a></li>
					<li><i class="fa fa-link"></i> <a href="${dto.link}" class="listing-address">홈페이지 확인</a></li>
				</ul>
			</div>
			<!-- Contact / End-->
			

			<!-- Opening Hours
			<div class="boxed-widget opening-hours margin-top-35">
				<div class="listing-badge now-open">Now Open</div>
				<h3><i class="sl sl-icon-clock"></i> Opening Hours</h3>
				<ul>
					<li>Monday <span>9 AM - 5 PM</span></li>
					<li>Tuesday <span>9 AM - 5 PM</span></li>
					<li>Wednesday <span>9 AM - 5 PM</span></li>
					<li>Thursday <span>9 AM - 5 PM</span></li>
					<li>Friday <span>9 AM - 5 PM</span></li>
					<li>Saturday <span>9 AM - 3 PM</span></li>
					<li>Sunday <span>Closed</span></li>
				</ul>
			</div>
			Opening Hours / End -->


			<!-- Share / Like -->
			<div class="listing-share margin-top-40 margin-bottom-40 no-border">
		
					<!-- Share Buttons -->
					<ul class="share-buttons margin-top-40 margin-bottom-0">
						<li><a class="fb-share" href="#"><i class="fa fa-facebook"></i> Share</a></li>
						<li><a class="twitter-share" href="#"><i class="fa fa-twitter"></i> Tweet</a></li>
						<li><a class="gplus-share" href="#"><i class="fa fa-google-plus"></i> Share</a></li>
						<!-- <li><a class="pinterest-share" href="#"><i class="fa fa-pinterest-p"></i> Pin</a></li> -->
					</ul>
					<div class="clearfix"></div>
			</div>
			<span onclick="sim()"></span>
		</div> <!-- sidebar end -->
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebfbfbd7a5ec71c10c63936dd90beb22"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/event-detailpage.js'/>"></script>

<!-- Date Picker - docs: http://www.vasterad.com/docs/listeo/#!/date_picker -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/plugins/datedropper.css'/>">
<script type="text/javascript" src="<c:url value = '/resources/scripts/datedropper.js'/>"></script>
<script>
	
	$('#booking-date').dateDropper({
		/* //var date = document.getElementById("booking-date").value;
		var date = $('#booking-date').val(),
		Default : date,
		format	: "YYYY-mm-dd" */
		
	});
	
</script> 

<!-- Time Picker - docs: http://www.vasterad.com/docs/listeo/#!/time_picker -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/plugins/timedropper.css'/>">
<script type="text/javascript" src="<c:url value = '/resources/scripts/timedropper.js'/>"></script>
<script>
this.$('#booking-time').timeDropper({
	setCurrentTime: false,
	meridians: false,
	primaryColor: "#f91942",
	borderColor: "#f91942",
	minutesInterval: '15',
	format: "hh:mm a"
});
</script> 
<!-- //////////////////////////////////////////////////////////////////////////// -->


<script type="text/javascript">


</script>
</body>
</html>
