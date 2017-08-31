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
					<h2>My Comments</h2>
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
			<ul class="listing-nav">
					<li><a href="#listing-care" class="">on Care</a></li>
					<li><a href="#listing-review">on Review</a></li>
			</ul>


			<!-- Listings --><!-- 맵디테일의 코멘트 -->
			<div id="listing-map" class="col-lg-12 col-md-12">
				<div class="dashboard-list-box margin-top-20">
					<h4 style="background: #37b6bd; color: white;">Comments on Care (${commentList.size()})</h4>
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
									<c:forEach var="list" items="${commentList}" varStatus="loop"> 
									<form action="" method="post" id="listOfMapModComment${loop.index}">	
									<li>										
											<div class="comment-by">Your Comments <div class="comment-by-listing own-comment">on <a href="/map/detail/viewDetailPage?locationSeq=${list.locationSeq}"><b>${list.address}</b></a></div> <span class="date">${list.regiDate}</span>
												
											
						<c:choose>
						<c:when test="${commentSeq == list.commentSeq}">	
						<!-- 별점 수정하기 -->
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
						</c:when>
						<c:otherwise>
						<div name="rating" class="star-rating" data-rating="${list.rating}"></div>
											</div>
						</c:otherwise>
						</c:choose>		
											
											<!-- 수정 텍스트박스 보여주기 -->	
											<c:choose>
												<c:when test="${commentSeq == list.commentSeq}">
													<textarea cols="40" rows="3" name="message" id="commentBody">${list.message}</textarea>
												</c:when>
												<c:otherwise>
													<p>${list.message}</p>
												</c:otherwise>
											</c:choose>	
											<c:choose>
												<c:when test="${commentSeq == list.commentSeq}">
												<div class="buttons-to-right">
												<a onclick="cmt_url3(${list.commentSeq}, ${loop.index},${list.locationSeq});" class="rate-review"><i></i> Save</a>	
												</div>
												</c:when>
												<c:otherwise>
												<%-- <div class="buttons-to-right">
												<a onclick="cmt_url2(${list.commentSeq}, ${loop.index},${list.locationSeq});" class="rate-review"><i class="sl sl-icon-note"></i> Edit</a>										
												<a href="/mypage/removeMyMapCmt?commentSeq=${list.commentSeq}&category=2" class="rate-review"><i class="sl sl-icon-close"></i> Delete</a>		
												</div>	 --%>
												</c:otherwise>
											</c:choose>
											<input type="hidden" id="commSeq" value="${list.commentSeq}">												
									</li>
									</form>   
									</c:forEach>
								</ul>
							</div>
						</li>

					</ul>
				</div>
			</div>


	 		<!-- Listings --><!-- 리뷰게시판의 코멘트 -->
			<div id="listing-review" class="col-lg-12 col-md-12">
				<div class="dashboard-list-box margin-top-20">
					<h4 style="background: #fa5b0f; color: white;">Comments on Review (${bCommentList.size()})</h4>
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
											<div class="buttons-to-right">
											<a class="rate-review" onclick="cmt_url(1, ${loop.index},1);"><i class="sl sl-icon-note"></i> Edit</a>										
											<a href="/mypage/removeMyBoardCmt?commentNo=${list.commentNo}&category=2" class="rate-review"><i class="sl sl-icon-close"></i> Delete</a>						
											</div>
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
<div id="backtotop" class="visible"><a href="#"></a></div>

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
	
function cmt_url2(commentSeq, index, locationSeq){
	var data = document.getElementById("listOfMapComment"+index);		
	url = "/mypage/viewModifyMapCmt?commentSeq="+commentSeq+"&locationSeq="+locationSeq+"&index="+index;
	data.action = url;
	data.submit();
}

function cmt_url3(commentSeq, index, locationSeq){
	var data = document.getElementById("listOfMapModComment"+index);
	url = "/mypage/modifyMapCmt?commentSeq="+commentSeq+"&locationSeq="+locationSeq+"&index="+index;
	data.action = url;
	data.submit();
}


$(window).load(function(){
	$('#commentBody').focus();
});

</script>
</body>
</html>
