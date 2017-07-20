<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Gaeverything</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script src="<c:url value = '/resources/ckeditor/ckeditor.js'/>"></script>
	


<!-- CSS
================================================== -->
<link rel="stylesheet"
	href="<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/colors/main.css'/>" id="colors">

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
	<div class="col-lg-9 col-md-8" style="padding-left:20px; padding-right:20px;">
		<form action="" method="post" id="reviewData" name="reviewForm">
			
			<!-- Blog Post -->
			<div class="blog-post">
			
				<!-- writer -->
				<div class="about-author2 col-md-12">	
					<img src="/resources/images/dashboard-avatar.jpg" alt="">
						<input type="hidden" name="nickname" id="nickname" value="${memberNickname}">${memberNickname}
				</div>
						
				<!-- category -->		
				<div class="review-category col-md-4">
					<select class="chosen-select" name = "boardCategory">
						<option value ="0">Categories</option>
						<option value ="1">병원, 뷰티</option>
						<option value ="2">애견동반 식당, 카페</option>
					</select>		
				</div>
						
				<!-- title -->
				<div class = "title col-md-12">
					<p class="form-row form-row-wide">
						<label for="title">		
							<h4>Title</h4>
								<input class="input-text" type="text" placeholder="제목을 입력해주세요." name="title" id="title"/>
						</label>
					</p>
				</div>
					
				<!-- location -->			
				<div class = "location col-md-12">
					<h4>Location</h4>
						<input type="text" placeholder="장소를 선택해주세요.(**지도연동 구현예정**)" name="address" id="address">
				</div> 
								
				<!-- rating -->
					<div class = "rating col-md-12" style="padding-bottom: 10px;">	
						<h4>Rating</h4>	
							
							<fieldset class="rating" id="rating">
							
   								<input type="radio" id="star5" name="rating" value="5" />
   								<label class = "full" for="star5" title="강!력!추천!"></label>
    							<input type="radio" id="star4half" name="rating" value="4.5" />
    							<label class="half" for="star4half" title="추천합니다!"></label>
   								<input type="radio" id="star4" name="rating" value="4" />
   								<label class ="full" for="star4" title="좋아요!"></label>
    							<input type="radio" id="star3half" name="rating" value="3.5" />
    							<label class="half" for="star3half" title="괜찮아요"></label>
    							<input type="radio" id="star3" name="rating" value="3" />
    							<label class = "full" for="star3" title="보통 쏘쏘"></label>
    							<input type="radio" id="star2half" name="rating" value="2.5" />
    							<label class="half" for="star2half" title="그저 그래요"></label>
   		 						<input type="radio" id="star2" name="rating" value="2" />
   		 						<label class = "full" for="star2" title="별로예요"></label>
    							<input type="radio" id="star1half" name="rating" value="1.5" />
    							<label class="half" for="star1half" title="추천하지않아요"></label>
    							<input type="radio" id="star1" name="rating" value="1" />
    							<label class = "full" for="star1" title="비추천"></label>
    							<input type="radio" id="starhalf" name="rating" value="0.5" />
    							<label class="half" for="starhalf" title="댓츠노노"></label>
    						
							</fieldset>
							
					</div>

					<!-- content -->
					<div class = "content col-md-12" style="padding-bottom:15px">
						<h4>Review</h4>
							<textarea name="message" id="editor1"></textarea>		
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
						<input type="hidden" id="upload" name="uploadImg" value="">		
						<input type="hidden" id="onlyText" name="onlyText" value="">
					</div>
						
					<!-- publish -->	
					<div class="button col-md-12"> 
						<button type="button" class="button border margin-top-5" id="publish" onclick="insert_review()" style="margin-left: 15px;">publish</button>
					</div>
							
				</div>
			</form><!-- Blog Post / End -->
		</div>
		<!-- Content / End -->
		
	<!-- Widgets -->
	<div class="col-lg-3 col-md-4">
		<div class="sidebar right">

			<!-- Widget -->
				<div class="widget">
					<h3 class="margin-top-0 margin-bottom-25">Search Blog</h3>
					<div class="search-blog-input">
						<div class="input">
							<input class="search-field" type="text" placeholder="Type and hit enter" value="" />
						</div>
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
										<a href="pages-blog-post.html"><img
											src="/resources/images/blog-widget-03.jpg" alt=""></a>
									</div>

									<div class="widget-text">
										<h5>
											<a href="pages-blog-post.html">Hotels for All Budgets </a>
										</h5>
										<span>October 26, 2016</span>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>

							<!-- Post #2 -->
							<li>
								<div class="widget-content">
									<div class="widget-thumb">
										<a href="pages-blog-post.html"><img
											src="/resources/images/blog-widget-02.jpg" alt=""></a>
									</div>

									<div class="widget-text">
										<h5>
											<a href="pages-blog-post.html">The 50 Greatest Street
												Arts In London</a>
										</h5>
										<span>November 9, 2016</span>
									</div>
									<div class="clearfix"></div>
								</div>
							</li>

							<!-- Post #3 -->
							<li>
								<div class="widget-content">
									<div class="widget-thumb">
										<a href="pages-blog-post.html"><img
											src="/resources/images/blog-widget-01.jpg" alt=""></a>
									</div>

									<div class="widget-text">
										<h5>
											<a href="pages-blog-post.html">The Best Cofee Shops In
												Sydney Neighborhoods</a>
										</h5>
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
							<li><a class="facebook" href="#"><i
									class="icon-facebook"></i></a></li>
							<li><a class="twitter" href="#"><i
									class="icon-twitter"></i></a></li>
							<li><a class="gplus" href="#"><i class="icon-gplus"></i></a></li>
							<li><a class="linkedin" href="#"><i
									class="icon-linkedin"></i></a></li>
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


	<script type="text/javascript">
	
		function insert_review(){	
			
/* 			var file = document.getElementById("upload").value;
			
			alert(file);
 */			//카테고리, 제목, 장소, 별점, 내용
			//var category = document.getElementById("category").value;
			var title = document.getElementById("title").value;
			var rating = $('input[name="rating"]:checked').val();
			var content = CKEDITOR.instances.editor1.getData();
			var text = CKEDITOR.instances.editor1.document.getBody().getText();
			//alert('글내용::' + text);
			document.getElementById("onlyText").value = text;
			//alert(rating);
			/* if(category ===''){
				alert("카테고리를 선택해주세요.")
			} */
			
			
			
			if(title === ''){
				alert("제목을 입력하세요.");
			}
			
			if(rating == null){
				alert("별점을 입력해 주세요.");
			}
			
			if (content ===''){
				alert("내용을 입력해주세요.");
			}
			
			if((title!='')&&(rating!=null)&&(content!='')){
				//alert(rating);
				var check = confirm("작성한 게시글을 등록하시겠습니까?");
				if(check == true){
					alert("게시글이 등록되었습니다.");
					reviewData.action = "/review/newPost";
					reviewData.submit();
				}else{
					alert("등록이 취소되었습니다.");
				}
			}
		}
	</script>

</body>
</html>