<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Gaeverything</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="<c:url value = '/resources/ckeditor/ckeditor.js'/>"></script>

<script type="text/javascript">

	function insert_review(){
		var data = CKEDITOR.instances.editor1.getData();
	//	alert(data);
		
		var reviewData = document.getElementById("reviewData");
		
		 if (data==''){
			alert("내용을 입력해주세요.");
		}else{
			var check = confirm("작성한 게시글을 등록하시겠습니까?");
			if(check == true){
				alert("게시글이 등록되었습니다.");
				reviewData.action = "/review/newPost";
				reviewData.submit();
			}else{
				alert("등록이 취소되었습니다.")
			}
		}
	}
	
	function go_url(type){
		var data = document.getElementById("postData");
		var url = "/review/viewReviewList";
		if(type == 1){
			url = "/review/clickModify";
		}else if(type == 2){
			var check = confirm("삭제된 게시글은 복구가 불가능합니다. 삭제하시겠습니까?")
			if(check == true){
				alert("게시글이 삭제되었습니다.");
				url = "/review/delete";
			}else{
				alert("삭제가 취소되었습니다.")
			}
		}
		data.action = url;
		data.submit();
	}
	
	function cmt_url(type, index){
		var data = document.getElementById("listOfComment"+index);
		var url = "/review/readPost";
		
		if(type == 1){
			alert("댓글이 수정되었습니다.");
			url = "/review/updateCmt";
		}else if(type == 2){
			var check = confirm("삭제된 댓글은 복구가 불가능합니다. 삭제하시겠습니까?");
			if(check == true){
				alert("댓글이 삭제되었습니다.");
				url = "/review/deleteCmt";
			}else{
				alert("삭제가 취소되었습니다.");
			}
		}
		data.action = url;
		data.submit();
	}
	
	
	
	

</script>

<!-- CSS
================================================== -->
<link rel="stylesheet" href="<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href="<c:url value = '/resources/css/colors/main.css'/>" id="colors">

</head>

<body>

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header Container
================================================== -->
		<header id="header-container"> 
		<%@include file="../header.jsp"%> </header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->


		<!-- Titlebar
================================================== -->
		<div id="titlebar" class="gradient">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<h2>Review</h2>
						<span>Share Your Experience!</span>

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


	<!-- Post Content -->
	<div class="col-lg-9 col-md-8 padding-right-30">
		<!-- 게시물 form 시작 -->
		<form action="" method="post" id="postData">

			<!-- Blog Post -->
			<div class="blog-post single-post">
								
				<!-- Content -->
				<div class="post-content">
					<input type = "hidden" name = "boardCategory" value = "병원,뷰티">
					<input type = "hidden" id= "boardNo" name = "boardNo" value="${dto.boardNo}" readonly="readonly"><br>
				
				<!-- title -->	
				<div class="title col-md-12">
					<h3>${dto.title}</h3> 
				</div>	
				
				<!-- rating -->
				<div class="star-rating col-md-12 " data-rating="${dto.rating}" style="padding-left: 15px; padding-right: 15px; padding-top: 10px;padding-bottom: 10px;">
					${dto.rating}
				</div> 
				
				<!-- nickname, comment, likes.. -->
				<div class="post-info" style="padding-left: 15px;padding-right: 15px;">
					<ul class="post-meta">
						<c:if test="${dto.boardCategory=='1'}">
							<li><a href="#">병원, 뷰티</a></li>
						</c:if>
						<c:if test="${dto.boardCategory=='2'}">
							<li><a href="#">애견동반 식당, 카페</a></li>
						</c:if>
						
							<li><i class="sl sl-icon-bubble"></i> ${numOfCmt}</li>
							<li id="numOflike"><i class="sl sl-icon-heart"></i> ${dto.countLike}</li>
							<li><i class="sl sl-icon-eye"></i> ${dto.readCount}</li>
							<li><fmt:formatDate value = "${dto.regiDate}" pattern="YY/MM/dd hh:mm:ss"/></li>
					</ul>
				</div>	

				<!-- content -->
				<div class = "content col-md-12" style="padding-bottom:15px">
					<p>${dto.message}</p>
				</div>

				<!-- option -->
				<div class="optin button col-md-12">
					<!-- Like -->
					<c:choose>
						<c:when test="${memberNickname == null }">
							<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px;">
								<div class="listing-item-container list-layout">
									<span class="like-icon" id="like" onclick="no_login_like()"></span>
								</div>
							</div>	
						</c:when>
						<c:otherwise>
							<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px;">
								<div class="listing-item-container list-layout">
									<span class="like-icon" id="like" onclick="like_clicked()"></span>
								</div>
							</div>	
						</c:otherwise>
					</c:choose>
				
					<!-- back to list -->
					<div class="list col-md-8">
							<button type="button" class="button border margin-top-5" onclick="go_url(3)">back to list</button>
					</div>
						
					<!-- edit, delete -->
					<c:if test="${memberNickname == dto.nickname}">
						<div class="option col-md-2" style="width: 135px;">
							<a id="edit" href="#" onclick="go_url(1);" return false; class = "rate-review"><i class="sl sl-icon-note"></i>Edit</a>
							<a id="delete" href="#" onclick="go_url(2);" return false; class = "rate-review" style="margin-top: 5px;"><i class="sl sl-icon-close"></i>Delete</a>
							<!-- return false will prevent browser from following the link -->
						</div>					
					</c:if>				
				</div>		
			<div class="clearfix"></div>
			</div>	
		</div><!-- Blog Post / End -->

		<!-- 작성자 프로필 -->
		<div class="about-author col-md-12" style=" padding-left: 10px; padding-right: 10px;">
			<div class="profile col-md-3" style="width: 150px;height: 150px; padding-top: 15px; padding-bottom: 15px;">
				<img src="/resources/images/user-avatar.jpg" alt="" />
			</div>
			<div class="about-description">
				<div class="writer">
					<h4>${dto.nickname}&nbsp;&nbsp;&nbsp;<i class="sl sl-icon-user-follow"></i></h4>
				</div>
			</div>
				<a href="#">tom@example.com</a> 
			<div class="intro col-md-9" style="padding-left: 0px;padding-right: 0px;">	
				<p>Nullam ultricies, velit ut varius molestie, ante metus condimentum nisi, dignissim facilisis turpis ex in libero. Sed porta ante tortor, a pulvinar mi facilisis nec. Proin finibus dolor ac convallis congue.</p>
			</div>
		</div>
		</form>
		<!-- 게시물 form 끝 -->
		
		<!-- 작성자프로필, 코멘트 사이 공백 -->
		<div class="margin-top-50"></div>

		<!-- comments -->
		<section class="comments">
			<h4 class="headline margin-bottom-35">Comments <span class="comments-amount">(${numOfCmt})</span></h4>
			
			<!-- 댓글리스트 -->
			<c:forEach items="${cList}" var="cmt" varStatus="loop">
				<form action="" method="post" id="listOfComment${loop.index}">
					<input type="hidden" name = "boardNo" value = "${dto.boardNo}">
					<input type="hidden" name = "page" value = "${param.page}">
					<input type="hidden" name = "nickname" value= "${dto.nickname}">
				<ul> <!-- 댓글전체 -->
					<li>
						<div class="avatar"><img src="http://www.gravatar.com/avatar/00000000000000000000000000000000?d=mm&amp;s=70" alt="" /></div>
						<div class="comment-content"><div class="arrow-comment"></div>
							<input type = "hidden" name = "commentNo" value = "${cmt.commentNo}">
							<input type = "hidden" name = "userId" value = "${cmt.userId}">
							<input type = "hidden" name = "nicknameCmt" value = "${cmt.nicknameCmt}">
							<input type = "hidden" name = "groupNo" value = "${cmt.groupNo}">
						<div class="comment-by" style="height: 70px;padding-bottom: 5px;">${cmt.nicknameCmt}
						<span class="date"><fmt:formatDate value = "${dto.regiDate}" pattern="YY/MM/dd hh:mm:ss"/></span>	
								<!-- 대댓글달기 버튼 삭제함 -->
						<div class = "comment_option"></div>
							<c:if test="${(memberNickname == cmt.nicknameCmt) && (modifyNo == cmt.commentNo)}">
								<a href="#" class="reply" onclick="cmt_url(1, ${loop.index});" return false; ><i class="sl sl-icon-note"></i>Save</a>
							</c:if>	
						</div>
				
						<!-- 수정 텍스트박스 보여주기 -->	
						<c:choose>
							<c:when test="${(memberNickname == cmt.nicknameCmt) && (modifyNo == cmt.commentNo)}">
								<textarea cols="40" rows="3" name="commentBody" id="commentBody">${cmt.commentBody}</textarea>
							</c:when>
							<c:otherwise>
								<div class="comment-body">
									<p name="commentBody" id="commentBody">${cmt.commentBody}</p>
								</div>
							</c:otherwise>
						</c:choose>	
						</div>
					</li>
				 </ul>	 
			 </form>	
		</c:forEach>
	</section>
	
		<div class="clearfix"></div>
		
			<!-- Add Comment -->
			<div id="add-review" class="add-review-box">

			<!-- Review Comment -->
			<form action="" method="post" id="newComment" class="add-comment">
				<input type="hidden" name = "boardNo" value = "${dto.boardNo}">
				
					<!-- commentbox -->
				<h3 class="listing-desc-headline margin-bottom-35">Add Comment</h3>
					<div class="about-author2" style="height: 80px; margin-bottom: 10px;">	
						<img src="/resources/upload/bom.jpg" alt="" style="margin-top:5px; margin-right:5px;margin-bottom: 5px;">
						<input type="hidden" name="userId" value="${userId}">	
						<input type="hidden" name="nicknameCmt" id="memberNickname" value="${memberNickname}">
						<div class="nickname col-md-3" style="padding-left: 10px;padding-right: 10px;margin-top: 28px;">
							${memberNickname}
						</div>
					</div>
				<fieldset>
					<div>
						<label>Comment:</label>
							<c:choose>
								<c:when test="${memberNickname == null}">
									<textarea cols="40" rows="3" name="commentBody" onclick="box_clicked()" placeholder="로그인 후 댓글작성이 가능합니다."></textarea>
								</c:when>
								<c:otherwise>
									<textarea cols="40" rows="3" name="commentBody" placeholder="댓글을 작성해주세요 :)"></textarea>
								</c:otherwise>
							</c:choose>
					</div>
				</fieldset>
				<div class="clearfix col-md-9" style="margin-right: 26px;"></div>
				<div class ="submit-cmt">
					<button class="button" onclick="add_cmt()">Submit Comment</button>
				</div>
					
				<div class="clearfix"></div>
			</form>
			</div>
			<!-- Add Review Box / End -->
			
			
			<!-- Post Navigation -->
			<ul id="posts-nav" class="margin-top-0 margin-bottom-45">
				<li class="next-post">
				
					<a href="#"><span>Next Post</span>
					The Best Cofee Shops In Sydney Neighborhoods</a>
				</li>
				<li class="prev-post">
					<a href="#"><span>Previous Post</span>
					Hotels for All Budgets</a>
				</li>
			</ul>
			
			
			<div class="clearfix"></div>
			<h4 class="headline margin-top-25">Related Posts</h4>
			<div class="row">

				<!-- Blog Post Item -->
				<div class="col-md-6">
					<a href="#" class="blog-compact-item-container">
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
				<div class="col-md-6">
					<a href="#" class="blog-compact-item-container">
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

			</div>
			<!-- Related Posts / End -->

	</div>
	<!-- Content / End -->



	<!-- Widgets -->
	<div class="col-lg-3 col-md-4">
		<div class="sidebar right">

			<!-- Widget -->
			<div class="widget">
				<h3 class="margin-top-0 margin-bottom-25">Search Blog</h3>
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
					<a href="/review/viewReviewRegist" class="button fullwidth margin-top-20">Write a Review</a>
				</div>
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
		<%@include file="../footer.jsp"%>
		<!-- Footer / End -->


		<!-- Back To Top Button -->
		<div id="backtotop">
			<a href="#"></a>
		</div>


	</div>
	<!-- Wrapper / End -->

	<!-- Scripts
================================================== -->
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jquery-2.2.0.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jpanelmenu.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/chosen.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/slick.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/rangeslider.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/magnific-popup.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/waypoints.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/counterup.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/jquery-ui.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/tooltips.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value = '/resources/scripts/custom.js'/>"></script>


	<!-- Style Switcher
================================================== -->
	<script src="<c:url value = '/resources/scripts/switcher.js'/>"></script>


	<div id="style-switcher">
		<h2>
			Color Switcher <a href="#"><i class="sl sl-icon-settings"></i></a>
		</h2>

		<div>
			<ul class="colors" id="color1">
				<li><a href="#" class="main" title="Main"></a></li>
				<li><a href="#" class="blue" title="Blue"></a></li>
				<li><a href="#" class="green" title="Green"></a></li>
				<li><a href="#" class="orange" title="Orange"></a></li>
				<li><a href="#" class="navy" title="Navy"></a></li>
				<li><a href="#" class="yellow" title="Yellow"></a></li>
				<li><a href="#" class="peach" title="Peach"></a></li>
				<li><a href="#" class="beige" title="Beige"></a></li>
				<li><a href="#" class="purple" title="Purple"></a></li>
				<li><a href="#" class="celadon" title="Celadon"></a></li>
				<li><a href="#" class="red" title="Red"></a></li>
				<li><a href="#" class="brown" title="Brown"></a></li>
				<li><a href="#" class="cherry" title="Cherry"></a></li>
				<li><a href="#" class="cyan" title="Cyan"></a></li>
				<li><a href="#" class="gray" title="Gray"></a></li>
				<li><a href="#" class="olive" title="Olive"></a></li>
			</ul>
		</div>

	</div>
	<!-- Style Switcher / End -->

</body>
</html>		