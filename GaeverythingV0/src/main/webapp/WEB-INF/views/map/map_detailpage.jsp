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
		<div class="col-lg-12 col-md-12 padding-right-100 padding-left-100 ">
			<input type="hidden" id = "memberEmail" value="${member.email}" >
			<!-- Titlebar -->
			<div id="titlebar" class="listing-titlebar " style="padding-bottom: 30px;">
				<div class="listing-titlebar-title">
					<h2>${detail.title} <span class="listing-tag"> Hospital </span></h2>
					<div>
						<span>average rating: ${detail.averageRatings} (${detail.countRatings})</span><span style="margin-left: 20px;">${detail.countReview} Reviews</span>
						<span>${detail.countReplies} Comments</span><span style="margin-left: 20px;" id = "numOflike">${detail.countLike} people bookmarked this place</span>
					</div>					
				</div>
			</div>
			
			<c:choose>
				<c:when test="${member.nickname == null }">
					<div class="listing-share margin-bottom-20 no-border" style="text-align: left;">
						<button type="button" class="like-button" onclick="no_login_like()"><span class="like-icon"></span> Bookmark this listing</button> 
					</div>	
				</c:when>
				<c:otherwise>
					<div class="listing-share margin-bottom-20 no-border" style="text-align: left;">
						<button type="button" class="like-button" onclick="like_clicked()"><span id = "like" class="${detail.userLikeStatus }"></span> Bookmark this listing</button> 
					</div>	
				</c:otherwise>
			</c:choose>								
			
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
					
					<!-- Uplaod Photos -->
					
					<div class="col-lg-2" style="padding-left: 0px;">
						<h3 class="listing-desc-headline ">Photo <span>(${detailphoto.size()})</span></h3>
					</div>
					
					<div class="col-lg-10">
						<div style="height: 50px;margin-top: 34px;">
						<c:if test="${empty detailphoto}">
							<div class = "col-lg-8" style="padding-top: 8px;">
								<span>이 장소의 사진을 첫 번째로 등록해주세요.</span>
							</div>
						</c:if>
							<div class="add-review-photos col-lg-4" style="position:static;">
								<form id="addPhoto" action="" class="addPhoto" method="post"enctype="multipart/form-data">
									<input type="hidden" id="locationSeq" name="locationSeq" value="${detail.locationSeq}">
									<div class="photoUpload">
										<span><i class="sl sl-icon-arrow-up-circle"></i> Upload Photos</span>
										<input name="photo" type="file" onchange="addDetailPhoto()" class="upload" />
									</div>
								</form>
							</div>
						</div>
					</div>
						<div class="review-images mfp-gallery-container col-lg-12" style="padding-top: 8px;">
							<c:forEach var="dp" items="${detailphoto}" varStatus="status">
								<c:if test="${status.index<4}">	
								
									<a href="/resources/upload/${dp.locationPhoto}" class="mfp-gallery listing-item-container">
									<div class="listing-item">	<img src="/resources/upload/${dp.locationPhoto}" alt=""></div>
								</a>
								</c:if>
							</c:forEach>
						</div>	
					<c:if test="${fn:length(detailphoto) > 4}">
					<div class="row">
					<div class="col-lg-12">
							<a href="" class="read-more">Read More <i class="fa fa-angle-right"></i></a>
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
								<a href="/review/viewReviewRegist"><span><i class="im im-icon-Pencil"></i> Write Review</span></a>
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
							<a href="/review/viewDetailReviews?locationSeq=${detail.locationSeq}&page=1" class="read-more">Read More <i class="fa fa-angle-right"></i></a>
					</div>
					</c:if>
					</div>
			<!-- write Review / End -->


			<!-- Blog review -->
			<div id="blog-review" class="listing-section margin-top-70 margin-bottom-30">
				<div class="col-lg-2" style="padding-left: 0px;">				
					<h3 class="listing-desc-headline ">Blog Review </h3>							
				</div>				
			<div class="col-lg-12" style="padding-left: 0px;">
					<div class="row">
							<c:forEach var="reviews" items="${blogList}" varStatus="status">
							<%-- <c:if test="${status.index<10}"> --%>
								<div class="col-md-4">
									<a href="${reviews.link}" class="listing-item-container">																
												<h4>${reviews.title}</h4>												
												<span>${reviews.bloggername}</span><br>
												<span>${reviews.postdate}</span>																				
									</a>
								</div>	
							<%-- </c:if>			 --%>
							</c:forEach>	
					</div>				
					</div>
			<!-- Blog Review END -->
		
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
				<h3 class="listing-desc-headline margin-top-75 margin-bottom-20">Comment <span>(${commentlist.size()})</span></h3>

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
						<div class="col-md-6">
							<!-- Leave Rating -->
								<!-- rating -->
						<div class = "rating col-md-12" style="padding-bottom: 10px;">	
							<h5>Price Rating</h5>
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
							</div></div>
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
	

	//photo 등록
	function addDetailPhoto(){
		var url = "/map/detail/addPhoto";
		addPhoto.action = url;
		addPhoto.submit();
	}
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

function like_clicked(){
	var class_name = document.getElementById("like").className;
	var locationSeq = document.getElementById("locationSeq").value;
	var email = document.getElementById("memberEmail").value;
	var url = '/review/updateDetailPageLike?like='+class_name+'&locationSeq='+locationSeq+'&email='+email;
	var id = document.getElementById("numOflike");
	
	$.ajax({
        url : url,
        dataType : 'json',
        type:"POST",
        success : function(data) {
        	id.innerHTML=data+' people bookmarked this place'; 
        },
        error : function(request, status, error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
     });
}

function no_login_like(locationSeq){
	alert("로그인을 해주세요!");
	var locationSeq = document.getElementById("locationSeq").value;
	location.href = "/viewLogin?uri=/map/detail/viewDetailPage?locationSeq="+locationSeq;
}


 function displayInfoList(start,end,commentlist){
    var listEl = document.getElementById('replyList'),
    fragment = document.createDocumentFragment(),
    itemEl; 
	for(var i=start;i<end;i++){
	    itemEl = getListItem(commentlist[i]);
	    fragment.appendChild(itemEl);
	 }    
    listEl.appendChild(fragment);
    clearStarRating('.star');
    starRating('.star');       
} 
 
 
 var commentStart;
 var commentEnd;
  
 $('#commentMore').click(function(){
	 displayInfoList(commentStart,commentEnd,list);	
	 if(commentEnd==list.length){
		 $('#commentMore').hide();
	 }	
	 commentStart = commentStart+5;
	 commentEnd = commentEnd+5;
	 commentEnd = commentEnd>list.length?list.length:commentEnd;
 });   
 
function getListItem(reply) {
    var el = document.createElement('div');
    var nickname = document.getElementById('isLogin').value;
    var regi = new Date(reply.regiDate); 
    regi = regi.getFullYear() + '-' + leadingZeros((regi.getMonth()+1),2) + '-' + leadingZeros(regi.getDate(),2)
    +' '+leadingZeros(regi.getHours(),2)+':'+leadingZeros(regi.getMinutes(),2)+':'+leadingZeros(regi.getSeconds(),2);
    var itemStr ='	<input type="hidden" id="ratingVal'+reply.commentSeq+'" value="'+reply.rating+'">'+
	  	'<li><div class="avatar"><img src="/resources/upload/'+reply.photo+'" alt="" /></div>'+
	'<div class="comment-content"><div class="arrow-comment"></div>'+
		'<div class="comment-by">'+
			reply.nickname+'<span class="date">'+regi+'</span>'+
			'<div class="star star-rating" data-rating="'+reply.rating+'"></div>'+
		'</div>'+
		'<p id="changeMsg'+reply.commentSeq+'">'+reply.message+'</p></div>';
		if(nickname==reply.nickname){
				itemStr += '<div class="col-md-8 centered-content" >	'+							
				'<a onclick="go_url(1, '+reply.commentSeq+');" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-note"></i>Edit</a>'+
				'<a onclick="go_url(2, '+reply.commentSeq+');" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-close"></i>Delete</a>'+
			'</div></li>';
		}
		el.innerHTML = itemStr;
    return el;
}

function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

//검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

var list = [];

$(document).ready(function() {
	var locationSeq = document.getElementById("locationSeq").value;
	url = '/map/detail/getReviewData?locationSeq='+locationSeq;
	$.ajax({
		url : url,
		dataType : 'json',
		type:"POST",
		success : function(commentlist) {
			list = commentlist;
			if(commentlist.length<=5){
				displayInfoList(0,commentlist.length,commentlist);
			}else{
				displayInfoList(0,5,commentlist);	
				commentStart = 5;
				commentEnd = commentlist.length>10?10:commentlist.length;
			}
		},
		error : function(request, status, error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	});		
});

</script>
</body>
</html>
