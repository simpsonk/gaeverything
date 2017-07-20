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
	
	function go_url(type, page){
		var data = document.getElementById("postData");
		var url = "/review/viewReviewList";
		if(type == 1){
			var check = confirm("게시물을 수정하시겠습니까?")
			if(check==true){
				alert("게시물이 수정되었습니다.");
				url = "/review/modify?page="+page;
			}else{
				alert("수정이 취소되었습니다.");
				return;
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

						<h2>Edit Review</h2>

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
		<div class="col-lg-9 col-md-8" style="padding-left:20px; padding-right:20px;">
		<form action="" method="post" id="postData">

			<!-- Blog Post -->
			<div class="blog-post single-post">
						
				<!-- Content -->
				<div class="post-content" style="padding-left: 20px; padding-right: 20px;padding-top: 20px; padding-bottom: 20px;">
					<input type = "hidden" name = "boardCategory" value = "병원,뷰티">
					<input type = "hidden" name = "boardNo" value="${dto.boardNo}" readonly="readonly">

				<div class="review-category col-md-4">
							<select class="chosen-select" name = "boardCategory">
								<option value ="0">Categories</option>
								<option value ="1" ${dto.boardCategory == '1'?'selected="selected"':''}>병원, 뷰티</option>
								<option value ="2" ${dto.boardCategory == '2'?'selected="selected"':''}>애견동반 식당, 카페</option>
							</select>		
						</div>
				
					<div class = "title col-md-12">
						<p class="form-row form-row-wide">
							<label for="title">		
							<h4>Title</h4>
							<input class="input-text" type="text" name="title" id="title" value="${dto.title}"/>
							</label></p>
					</div>
					
					<div class = "location col-md-12">
							<h4>Location</h4>
							<input type="text" name="address" id="address" value="${dto.address}">
					</div> 
					
					<!-- rating 출력 -->
						<div class = "rating col-md-12" style="padding-bottom: 10px;">	
							<h4>Rating</h4>	
							<fieldset class="rating">
   								<input type="radio" id="star5" name="rating" value="5" ${dto.rating== '5'?'checked="checked"':''} />
   								<label class = "full" for="star5" title="Awesome - 5 stars"></label>
   								
    							<input type="radio" id="star4half" name="rating" value="4.5" ${dto.rating== '4.5'?'checked="checked"':''}/>
    							<label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>
    							
   								<input type="radio" id="star4" name="rating" value="4"  ${dto.rating== '4'?'checked="checked"':''}/>
   								<label class = "full" for="star4" title="Pretty good - 4 stars"></label>
   								
    							<input type="radio" id="star3half" name="rating" value="3.5" ${dto.rating== '3.5'?'checked="checked"':''}/>
    							<label class="half" for="star3half" title="Meh - 3.5 stars"></label>
    							
    							<input type="radio" id="star3" name="rating" value="3" ${dto.rating== '3'?'checked="checked"':''}/>
    							<label class = "full" for="star3" title="Meh - 3 stars"></label>
    							
    							<input type="radio" id="star2half" name="rating" value="2.5" ${dto.rating== '2.5'?'checked="checked"':''}/>
    							<label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>
    							
   		 						<input type="radio" id="star2" name="rating" value="2" ${dto.rating== '2'?'checked="checked"':''}/>
   		 						<label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
   		 						
    							<input type="radio" id="star1half" name="rating" value="1.5" ${dto.rating== '1.5'?'checked="checked"':''}/>
    							<label class="half" for="star1half" title="Meh - 1.5 stars"></label>
    							
    							<input type="radio" id="star1" name="rating" value="1" ${dto.rating== '1'?'checked="checked"':''}/>
    							<label class = "full" for="star1" title="Sucks big time - 1 star"></label>
    							
    							<input type="radio" id="starhalf" name="rating" value="0.5" ${dto.rating== '0.5'?'checked="checked"':''}/>
    							<label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>
							</fieldset>
						</div>
					
					<div class = "content col-md-12" style="padding-bottom:15px">
							<h4>Review</h4>
								<textarea name="message" id="editor1">${dto.message}</textarea>		
								<script type="text/javascript">
									CKEDITOR.replace('editor1',{
										filebrowserImageUploadUrl : '/review/fileUpload'
									});
									
									CKEDITOR.on('dialogDefinition', function (ev) {
							            var dialogName = ev.data.name;
							            var dialog = ev.data.definition.dialog;
							            var dialogDefinition = ev.data.definition;
							            if (dialogName == 'image') {
							                dialog.on('show', function (obj) {
							                    this.selectPage('Upload'); //업로드텝으로 시작
							                });
							                dialogDefinition.removeContents('Link'); // 링크탭 제거
							            }
							        });
								</script>
						</div>
						
					<div class="button col-md-12"> 	
					<button type="button" id="edit" class="button border margin-top-5" onclick="go_url(1, ${param.page})" >save</button>
					<button type="button" class="button border margin-top-5" onclick="go_url(2)">back to list</button>
					</div>
					<div class="clearfix"></div>
			
				</div>
			
			</div>
			<!-- Blog Post / End -->


			


			<!-- 작성자 프로필 -->
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


			
			


			<div class="margin-top-50"></div>

			<!-- comments -->
			
	
			<div class="clearfix"></div>


			<!-- Add Comment -->
			
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
							<img src="images/blog-compact-post-01.jpg" alt="">
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
							<img src="images/blog-compact-post-03.jpg" alt="">
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
								<a href="pages-blog-post.html"><img src="images/blog-widget-03.jpg" alt=""></a>
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
								<a href="pages-blog-post.html"><img src="images/blog-widget-02.jpg" alt=""></a>
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
								<a href="pages-blog-post.html"><img src="images/blog-widget-01.jpg" alt=""></a>
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