<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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


<!-- Titlebar
================================================== -->
<div id="titlebar" class="gradient">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>Review</h2><span>Latest Reviews</span>
				<!-- Breadcrumbs -->
				<nav id="breadcrumbs">
					<ul>
						<li><a href="/">Home</a></li>
						<li>Review</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</div>

<!-- Content
================================================== -->
<div class="container">

	<!-- Blog Posts -->
	<div class="blog-page">
	<div class="row">
	<div class="col-lg-9 col-md-8 padding-right-30">
	<input type="hidden" id = "memberEmail" value="${member.email}">
	<!-- Blog Post -->	
	<c:forEach items="${list}" var="board">
		
		<div class="blog-post">	  
		
			<!-- Img -->
			<c:if test="${board.uploadImg != null}">
				<a href="/review/readPost?boardNo=${board.boardNo}&page=${page}" class="post-img">
				<img src="/resources/upload/${board.uploadImg}" alt="" style="width:100%; height:400px; object-fit:cover;">
				</a>
			</c:if>
			
			<!-- Content -->
			<div class="post-content" id="wrapper">
				<!-- title -->
				<div id="titlebar" class="listing-titlebar  col-md-9" style="padding-top: 0px;padding-bottom: 0px; margin-bottom: 10px;">
					<!-- title -->	
					<div class="listing-titlebar-title">
						<h3><a href = "/review/readPost?CategoryCode=${param.categoryCode }&boardNo=${board.boardNo}&page=${page}">${board.title}</a>
							<c:if test="${board.boardCategory=='CARE'}">
								<span class = "listing-tag">CARE</span>
							</c:if>
							<c:if test="${board.boardCategory=='EVENT'}">
								<span class = "listing-tag">EVENT</span>
							</c:if>
						</h3>
					</div>	
				</div>
				<div class="optin button col-md-3" style="margin-top: 0px;margin-bottom: 12px;height: 40px;">
					<!-- Like -->
					<c:choose>
						<c:when test="${member.nickname == null }">
							<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px ; float: right;">
								<div class="listing-item-container list-layout">
									<span class="like-icon" id="like" onclick="no_login_like()"></span>
								</div>
							</div>	
						</c:when>
						<c:otherwise>
							<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px; float: right;">
								<div class="listing-item-container list-layout">
									<span style="" class="${board.userLikeStatus}" id="like${board.boardNo}" onclick="like_clicked(${board.boardNo})"></span>
								</div>
							</div>	
						</c:otherwise>
					</c:choose>						
				</div>
				
				
				
				<!-- nickname, comment, etc. -->	
				<ul class="post-meta">
					<li><strong>${board.nickname}</strong></li>
					<!--<c:if test="${board.boardCategory=='1'}">
						<li><a href="#">병원, 뷰티</a></li>
					</c:if>
						
					<c:if test="${board.boardCategory=='2'}">
						<li><a href="#">애견동반 식당, 카페</a></li>
					</c:if>-->
						<li><i class="sl sl-icon-bubble"></i> ${board.numOfCmt}</li>
						<li id="numOflike${board.boardNo}"><i class="sl sl-icon-heart"></i> ${board.countLike}</li>
						<li><i class="sl sl-icon-eye"></i> ${board.readCount}</li>
						<li><fmt:formatDate value = "${board.regiDate}" pattern="YYYY-MM-dd hh:mm:ss"/></li>
				</ul>
				
								
				
				<!-- rating -->
				<div class="star-rating col-md-12 " data-rating="${board.rating}" style="padding-left: 0px; padding-right: 0px; padding-top: 10px;padding-bottom: 10px;margin-bottom: 10px;">${board.rating}</div> 
				
				
				<!-- content preview -->	
				<div class="preview_box" id="preview" style="width: 100%; height:100px;">
					<p>${board.onlyText}</p>
				</div>
				<a href="/review/readPost?categoryCode=${param.categoryCode}&boardNo=${board.boardNo}&page=${page}" class="read-more">Read More <i class="fa fa-angle-right"></i></a>
			</div>
		</div>
	</c:forEach>
	<!-- Blog Post / End -->

	<!-- Pagination -->
	<div class="clearfix"></div>
		<div class="row">
			<div class="col-md-12">
				<!-- Pagination -->
				<div class="pagination-container margin-bottom-40">${pList}</div>
			</div>
		</div>
	<!-- Pagination / End -->
</div>
<!-- Blog Posts / End -->


	<!-- Widgets -->
	<div class="col-lg-3 col-md-4">
		<div class="sidebar right">

			<!-- Widget -->
			<div class="widget">
				<h3 class="margin-top-0 margin-bottom-25">Search Review</h3>
				<div class="search-blog-input">
					<div class="input"><input class="search-field" type="text" placeholder="Type and hit enter" value=""/></div>
				</div>
				<div class="clearfix"></div>
			</div>
			<!-- Widget / End -->


			<!-- Widget -->
			<div class="widget margin-top-40">
				<h3>Any recommendations?</h3>
				<div class="info-box margin-bottom-10">
					<p>Feel free to share your experience!</p>
					<a href="/review/viewReviewRegist?categoryCode=${param.categoryCode}" class="button fullwidth margin-top-20">Write a Review</a>
				</div>
			</div>
			<!-- Widget / End -->
			
			<!-- Widget -->
			<div class="widget margin-top-40">
				<h3>Categories</h3>
				<div class="info-box margin-bottom-10"style="height: 65px;"><h4>Care</h4></div>
				<div class="info-box margin-bottom-10"style="height: 65px;"><h4>Event</h4></div>	
			</div>
			<!-- Widget / End -->


			<!-- Widget -->
			<div class="widget margin-top-40">

				<h3>Popular Posts</h3>
				<ul class="widget-tabs">

					<!-- Post #1 -->
					<li>
						<div class="widget-content">
								<div class="widget-thumb">
								<a href="pages-blog-post.html"><img src="/resources/images/blog-widget-03.jpg" alt=""></a>
							</div>
							
							<div class="widget-text">
								<h5><a href="pages-blog-post.html">Hotels for All Budgets </a></h5>
								<span>October 26, 2016</span>
							</div>
							<div class="clearfix"></div>
						</div>
					</li>
					
					<!-- Post #2 -->
					<li>
						<div class="widget-content">
							<div class="widget-thumb">
								<a href="pages-blog-post.html"><img src="/resources/images/blog-widget-02.jpg" alt=""></a>
							</div>
							
							<div class="widget-text">
								<h5><a href="pages-blog-post.html">The 50 Greatest Street Arts In London</a></h5>
								<span>November 9, 2016</span>
							</div>
							<div class="clearfix"></div>
						</div>
					</li>
					
					<!-- Post #3 -->
					<li>
						<div class="widget-content">
							<div class="widget-thumb">
								<a href="pages-blog-post.html"><img src="/resources/images/blog-widget-01.jpg" alt=""></a>
							</div>
							
							<div class="widget-text">
								<h5><a href="pages-blog-post.html">The Best Cofee Shops In Sydney Neighborhoods</a></h5>
								<span>November 12, 2016</span>
							</div>
							<div class="clearfix"></div>
						</div>
					</li>

				</ul>

			</div>
			<!-- Widget / End-->


			<!-- Widget -->
			<div class="widget margin-top-40">
				<h3 class="margin-bottom-25">Social</h3>
				<ul class="social-icons rounded">
					<li><a class="facebook" href="#"><i class="icon-facebook"></i></a></li>
					<li><a class="twitter" href="#"><i class="icon-twitter"></i></a></li>
					<li><a class="gplus" href="#"><i class="icon-gplus"></i></a></li>
					<li><a class="linkedin" href="#"><i class="icon-linkedin"></i></a></li>
				</ul>

			</div>
			<!-- Widget / End-->

			<div class="clearfix"></div>
			<div class="margin-bottom-40"></div>
		</div>
	</div>
	</div>
	<!-- Sidebar / End -->


</div>
</div>



<!-- Footer
================================================== -->
<%@include file = "../footer.jsp" %>
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
<script type="text/javascript" src="<c:url value = '/resources/jQuery.dotdotdot-master/src/jquery.dotdotdot.js'/>"></script>

<script type="text/javascript">
	$(document).ready(function(){
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
	});
	
	function like_clicked(boardNo){
		var class_name = document.getElementById("like"+boardNo).className;
		var email = document.getElementById("memberEmail").value
		var id = document.getElementById("numOflike"+boardNo);
		
		
		var url = '/review/updateLike?like='+class_name+'&boardNo='+boardNo+'&email='+email;

		var icon = document.createElement('i');
		icon.className = 'sl sl-icon-heart';
		var span = document.createElement('span');
		
		$.ajax({
            url : url,
            dataType : 'json',
            type:"POST",
            success : function(data) {
             	id.innerHTML=""; //상위태그. 
            	span.innerHTML = " "+data ; //1) 상위태그 안에 들어갈 "내용" 먼저 셋팅
            	id.appendChild(icon); //	  2) 상위태그 안에 포함되어 "하위 태그"
            	id.appendChild(span); //	       append함.
             },
            error : function(request, status, error) {
                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              }
         });
	}
	
	function no_login_like(){
		alert("로그인을 해주세요!");
		location.href = "/viewLogin?uri=/review/viewReviewList";
	}
	
</script>

</body>
</html>