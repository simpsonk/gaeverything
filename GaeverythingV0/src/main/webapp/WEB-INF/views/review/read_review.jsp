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
				return;
			}
		}
	}
	
	function go_url(type, page){
		var data = document.getElementById("postData");
		var boardNo = document.getElementById("boardNo").value;
		var url = "/review/viewReviewList?page="+page;
		if(type == 1){
			url = "/review/clickModify?page="+page+"&boardNo="+boardNo;
		}else if(type == 2){
			var check = confirm("삭제된 게시글은 복구가 불가능합니다. 삭제하시겠습니까?")
			if(check == true){
				alert("게시글이 삭제되었습니다.");
				url = "/review/delete?page="+page;
			}else{
				alert("삭제가 취소되었습니다.")
				return;
			}
		}
		data.action = url;
		data.submit();
	}
	
	function cmt_url(type, index, page){
		var data = document.getElementById("listOfComment"+index);
		var url = "/review/readPost";
		if(type == 1){
			url = "/review/modifyCmt?page="+page;
		}else if(type == 2){
			var check = confirm("삭제된 댓글은 복구가 불가능합니다. 삭제하시겠습니까?")
			if(check == true){
				alert("댓글이 삭제되었습니다.");
				url = "/review/deleteCmt?page="+page;
			}else{
				alert("삭제가 취소되었습니다.")
				return;
			}
		}
		data.action = url;
		data.submit();
	}

	function add_cmt(page){
		var data = document.getElementById("newComment");
		var url = "/review/readPost";
		var check = confirm("댓글을 등록하시겠습니까?");
		if(check==true){
			alert("댓글이 등록되었습니다.");
			url = "/review/newCmt?page="+page;
		}else{
			alert("댓글 등록이 취소되었습니다.");
			return;
		}
		data.action = url;
		data.submit();
	}

	function box_clicked(page){
		alert("댓글작성은 회원만 가능합니다.");
		var boardNo = document.getElementById("boardNo").value;
		location.href = "/viewLogin?uri=/review/readPost?boardNo="+boardNo+"&page="+page;
	}
	
	function like_clicked(){
		var ele = document.getElementById("like");
		var class_name = ele.className;
		var boardNo = document.getElementById("boardNo").value;
		var url = '/review/updateLike?like='+class_name+'&boardNo='+boardNo;
		var id = document.getElementById("numOflike");
		
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
	
	function no_login_like(page){
		alert("로그인을 해주세요!");
		var boardNo = document.getElementById("boardNo").value;
		location.href = "/viewLogin?uri=/review/readPost?boardNo="+boardNo+"&page="+page;
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
		<div id="titlebar" class="gradient"  style="margin-bottom: 0px;">
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
		<form action="" method="post" id="postData">

			<!-- Blog Post -->
			<div class="blog-post single-post">
								
				<!-- Content -->
				<div class="post-content">
					<input type = "hidden" name = "boardCategory" value = "병원,뷰티">
					<input type = "hidden" id= "boardNo" name = "boardNo" value="${dto.boardNo}" readonly="readonly"><br>
					<div id="titlebar" class="listing-titlebar  col-md-12" style="padding-top: 0px;padding-bottom: 0px;padding-left: 15px;">
					<!-- title -->	
						<div class="listing-titlebar-title">
							<h3>${dto.title} 
								<c:if test="${dto.boardCategory=='1'}">
									<span class = "listing-tag">Hospital & Beauty</span>
								</c:if>
							</h3>
						</div>	
					</div>
					
					
					<!-- nickname, comment, likes.. -->
					<div class="post-info col-md-12" style="padding-left: 15px;padding-right: 15px;">
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
					
					<!-- rating -->
					<div class="star-rating col-md-12 " data-rating="${dto.rating}" style="padding-left: 15px; padding-right: 15px; padding-top: 10px;padding-bottom: 10px;">
						${dto.rating}
					</div> 
					
				
				<!-- content -->
				<div class = "content col-md-12" style="padding-bottom:15px">
					<p>${dto.message}</p>
				</div>
				
				<!-- option -->
	
					<!-- back to list -->
					<div class="list col-md-2" style="margin-top: 5px;">
						<button type="button" class="button border margin-top-5" onclick="go_url(3, ${param.page})" style="height: 48px;width: 125px;">back to list</button>
					</div>
					
					<div class="optin button col-md-2" style="margin-top: 6px;">
						<!-- Like -->
						<c:choose>
							<c:when test="${member.nickname == null }">
								<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px ; float: right;">
									<div class="listing-item-container list-layout">
										<span class="like-icon" id="like" onclick="no_login_like(${param.page})"></span>
									</div>
								</div>	
							</c:when>
							<c:otherwise>
								<div class="like col-md-3" style="width: 80px; height: 0px; padding-left: 0px; margin-top: 25px; padding-right: 0px; float: right;">
									<div class="listing-item-container list-layout">
										<span style="" class="like-icon" id="like" onclick="like_clicked()"></span>
									</div>
								</div>	
							</c:otherwise>
						</c:choose>						
					</div>
							
					<!-- edit, delete -->
					<c:if test="${member.nickname == dto.nickname}">
						<div class="col-md-8 centered-content" >
							<a onclick="go_url(1, ${param.page})" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-note"></i>Edit</a>
							<a onclick="go_url(2, ${param.page})" class="button border margin-top-10" style="height: 43px;"><i class="sl sl-icon-close"></i>Delete</a>
						</div>
					</c:if>
			
				<div class="clearfix"></div>
			
			</div> <!-- Content ends-->
			
		</div> <!-- Blog Post / End -->

		<!-- 작성자 프로필 -->
		<div class="about-author col-md-12" style=" padding-left: 10px; padding-right: 10px;">
			<div class="profile col-md-3" style="width: 150px;height: 150px; padding-top: 15px; padding-bottom: 15px;">
				<img src="/resources/images/user-avatar.jpg" alt="" />
			</div>
			<div class="about-description">
				<div class="writer">
					<h4>${dto.nickname}&nbsp;&nbsp;&nbsp;<a href="/review/follow"><i class="sl sl-icon-user-follow"></i></a></h4>
				</div>
			</div>
				<a href="#">tom@example.com</a> 
			<div class="intro col-md-9" style="padding-left: 0px;padding-right: 0px;">	
				<p>Nullam ultricies, velit ut varius molestie, ante metus condimentum nisi, dignissim facilisis turpis ex in libero. Sed porta ante tortor, a pulvinar mi facilisis nec. Proin finibus dolor ac convallis congue.</p>
			</div>
		</div>
	</form>
		
		

		<!-- 작성자프로필, 코멘트 사이 공백 -->
		<div class="margin-top-50"></div>


				<!-- Add Comment -->
		<div id="add-review" class="add-review-box" style="margin-top: 0px;">

			<!-- Review Comment -->
			<form action="" method="post" id="newComment" class="add-comment">
				<input type="hidden" name = "boardNo" id = "boardNo" value = "${dto.boardNo}">
				
				<!-- commentbox -->
				<h3 class="listing-desc-headline margin-bottom-35">Add Comment</h3>
					<div class="about-author2"">	
						<input type="hidden" name="userId" value="${member.email}">	
						<input type="hidden" name="nicknameCmt" id="memberNickname" value="${member.nickname}">
					</div>

				<fieldset>
					<div>
						<label>Comment:</label>
						<c:choose>
							<c:when test="${member.nickname == null}">
								<textarea cols="40" rows="3" name="commentBody" onclick="box_clicked(${param.page})" placeholder="로그인 후 댓글작성이 가능합니다."></textarea>
							</c:when>
							<c:otherwise>
								<textarea cols="40" rows="3" name="commentBody" placeholder="댓글을 작성해주세요 :)"></textarea>
							</c:otherwise>
						</c:choose>
					</div>
				</fieldset>
				<div class="clearfix col-md-9" style="margin-right: 26px;"></div>
				<div class ="submit-cmt">
					<button class="button" onclick="add_cmt(${param.page})">Submit Comment</button>
				</div>
				
				<div class="clearfix"></div>
				
			</form>
		</div>
		<!-- Add Review Box / End -->
		
		
		<!-- comments -->
		<section class="comments">
			
			<h4 class="headline margin-bottom-35">Comments <span class="comments-amount">(${numOfCmt})</span></h4>

			<!-- 댓글리스트 -->
			<div class="comments">
			<c:forEach items = "${cList}" var ="cmt"  varStatus="loop">
				<form action="" method="post" id="listOfComment${loop.index}">
					<input type="hidden" name = "boardNo" value = "${dto.boardNo}">
					
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
								<span class="date" id="date" style="font-size: 8px;">등록일 <fmt:formatDate value = "${dto.regiDate}" pattern="YY/MM/dd hh:mm:ss"/></span>	
									
									<c:if test="${member.nickname == cmt.nicknameCmt}">
										<div class="comment-by">
											<a href="#" class="reply" " onclick="cmt_url(1, ${loop.index}, ${param.page});" return false; ><i class="sl sl-icon-note"></i> Edit</a>
										</div>
										<div class="comment-by">
											<a href="#" class="reply" style="margin-top: 36px;" onclick="cmt_url(2, ${loop.index}, ${param.page});" return false; ><i class="sl sl-icon-close"></i> Delete</a>
										</div>
									</c:if>	
								</div>
								<div class="comment-body">
									<p name="commentBody" id="commentBody">${cmt.commentBody}</p>
								</div>		
							</div>
						</li>
					 </ul>
				</form>
			</c:forEach>
			</div>
		</section>
			
		<div class="clearfix"></div>
			
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
</body>
</html>		