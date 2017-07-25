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
						<span>average rating: ${averageRatings} (${countRatings})</span><span style="margin-left: 20px;">${countReview} Reviews</span>
						<span>   ${countReplies} Comments</span><span style="margin-left: 20px;">159 people bookmarked this place</span>
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
							<!-- 	<span>이 장소의 사진을 첫 번째로 등록해주세요.</span> -->
							<span style="padding-right: 200px;">글 제목</span>
							<span style="padding-right: 50px;">작성자</span>
							<span>별점</span>
							<c:forEach var="reviews" items="${reviewList}">
								<div>
									<span style="padding-right: 200px;"><a href="/review/readPost?boardNo=${reviews.boardNo}&page=${param.page}">${reviews.title}</a></span>
									<span style="padding-right: 50px;">${reviews.nickname}</span>
									<span>${reviews.rating}</span>
								</div>
							</c:forEach>							
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
				<h3 class="listing-desc-headline margin-top-75 margin-bottom-20">Comment <span>(${countReplies})</span></h3>

				<!-- Add Review Box -->
				<div id="add-review" class="add-review-box" style="margin-top: 0px;">
	
					<!-- Add Review -->
					<h3 id="ment" class="listing-desc-headline margin-bottom-20">Add Comment</h3>
					
					<span class="leave-rating-title">Your rating for this listing</span>
					
					<!-- Rating / Upload Button -->
					<form id="add-comment" action="" class="add-comment" method="post">
						<input type="hidden" id="locationSeq" name="locationSeq" value="${detail.locationSeq}">
						<input type="hidden" id="commentSeq" name = "commentSeq" value = "0" >
					
					<div class="row">
						<div class="col-md-6">
							<!-- Leave Rating -->
								<!-- rating -->
						<div class = "rating col-md-12" style="padding-bottom: 10px;">	
							<h5>Rating</h5>					
								
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
	   							
	   							<input type="radio" id="star2half" name="rating" value="2.5" }/>
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
											<textarea cols="40" rows="3" id="commMsg" name="message" onclick="box_clicked(${detail.locationSeq})" placeholder="로그인 후 댓글작성이 가능합니다."></textarea>
										</c:when>
										<c:otherwise>
											<textarea cols="40" rows="3" id="commMsg" name="message" placeholder="댓글을 작성해주세요 :)"></textarea>
										</c:otherwise>
								</c:choose>
						
							</div>
	
						</fieldset>					
						<input type="hidden" id="isLogin" value="${member.nickname}">	
						<input type="button" id="registComment" value="Submit Comment">
						<input type="button" id="modifyComment" value="Modify Comment" style="display: none;">
						<div class="clearfix"></div>
					</form>
	
				</div>
				<!-- Add Review Box / End -->
				<!-- Reviews -->
			<form id="commentData" method="post">
				<input type="hidden" id="locationSeq2" name="locationSeq2" value="${detail.locationSeq}">
				<section class="comments listing-reviews">
 					
					 <ul>
					  <c:forEach var="comm" items="${commentlist}">
					  	<input type="hidden" id="ratingVal${comm.commentSeq}" value="${comm.rating}">
					  	<li>
							<div class="avatar"><img src="/resources/upload/${comm.photo}" alt="" /></div> 
							<div class="comment-content"><div class="arrow-comment"></div>
								<div class="comment-by">
									${comm.nickname}<span class="date">${comm.regiDate}</span>
									<div class="star-rating" data-rating="${comm.rating}"></div>
								</div>
								<p id="changeMsg${comm.commentSeq}">${comm.message}</p>							
							</div>
							
							
							<!-- edit, delete -->
						 <c:if test="${member.nickname == comm.nickname}"> 
		 					<%-- <div class="comment-by">
								<a class="reply" onclick="go_url(1, ${comm.commentSeq})" return false; ><i class="sl sl-icon-note"></i> Edit</a>
							</div>
							<div class="comment-by">
								<a class="reply" style="margin-top: 36px;" onclick="/map/detail/viewDeleteComment" return false; ><i class="sl sl-icon-close"></i> Delete</a>
							</div> --%>
						  
						 
							  <div class="col-md-8 centered-content" >								
								<a onclick="go_url(1, ${comm.commentSeq});" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-note"></i>Edit</a>
								<a onclick="go_url(2, ${comm.commentSeq});" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-close"></i>Delete</a>
							</div>  
						 </c:if> 
						</li>
				  	</c:forEach>	  
						
					 </ul>
			 
				</section> 
			</form>
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
	var locationSeq = document.getElementById("locationSeq").value;
	checkMessage(locationSeq);
	var ds = document.getElementById("add-comment");
	var url = "/map/detail/addComment";
	ds.action = url;
	if($("#commMsg").val()!='' && 
			$('input:radio[name="rating"]').is(":checked")){
		ds.submit();
	}else{
		return;
	}			
});

//댓글 수정 버튼 클릭시
$('#modifyComment').click(function(){
	var ds = document.getElementById("add-comment");
	var url = "/map/detail/editComment";
	ds.action = url;
	ds.submit();
});


//댓글  Edit, Delete
function go_url(type, commSeq){	
	var commentSeq = document.getElementById("commentSeq");
	var commMsg = document.getElementById("commMsg");
	var changeMsg = document.getElementById("changeMsg"+commSeq);
	var ratingVal = document.getElementById("ratingVal"+commSeq);
	var ment = document.getElementById("ment");
	if(type==1){		
		commentSeq.value = commSeq;
		commMsg.innerHTML = changeMsg.innerHTML;
		if(ratingVal.value==0.5){
			$('input:radio[name=rating]:input[value="0.5"]').attr("checked", true);			
		}else if(ratingVal.value==1.0){
			$('input:radio[name=rating]:input[value="1.0"]').attr("checked", true);		
		}else if(ratingVal.value==1.5){
			$('input:radio[name=rating]:input[value="1.5"]').attr("checked", true);		
		}else if(ratingVal.value==2.0){
			$('input:radio[name=rating]:input[value="2.0"]').attr("checked", true);		
		}else if(ratingVal.value==2.5){
			$('input:radio[name=rating]:input[value="2.5"]').attr("checked", true);		
		}else if(ratingVal.value==3.0){
			$('input:radio[name=rating]:input[value="3.0"]').attr("checked", true);		
		}else if(ratingVal.value==3.5){
			$('input:radio[name=rating]:input[value="3.5"]').attr("checked", true);		
		}else if(ratingVal.value==4.0){
			$('input:radio[name=rating]:input[value="4.0"]').attr("checked", true);		
		}else if(ratingVal.value==4.5){
			$('input:radio[name=rating]:input[value="4.5"]').attr("checked", true);		
		}else if(ratingVal.value==5.0){
			$('input:radio[name=rating]:input[value="5.0"]').attr("checked", true);		
		}		
		commMsg.focus();
 		$('#modifyComment').show();
		$('#registComment').hide();
		ment.innerHTML = 'Edit Comment';
	}else if(type==2){
		var ds = document.getElementById("add-comment");
		var url = "/map/detail/deleteComment?commentSeq="+commSeq;
		ds.action = url;
		ds.submit();
	}
}

//등록시 필수항목 체크
function checkMessage(locationSeq){
	  var isLogin = document.getElementById("isLogin");
	  if(isLogin.value==''){
		  alert("댓글작성은 회원만 가능합니다.");	
		  location.href = "/viewLogin?uri=/map/detail/viewDetailPage?locationSeq="+locationSeq;
	  }else{
		  if($('input:radio[name="rating"]').is(":checked")==false){
			  alert('별점을 표시해주세요.');
		  }
		  if($("#commMsg").val()==''){
			  alert('코멘트를 입력해주세요.');
		  }	
	  }
}

function box_clicked(locationSeq){
	alert("댓글작성은 회원만 가능합니다.");	
	location.href = "/viewLogin?uri=/map/detail/viewDetailPage?locationSeq="+locationSeq;
}

</script>

</body>
</html>
