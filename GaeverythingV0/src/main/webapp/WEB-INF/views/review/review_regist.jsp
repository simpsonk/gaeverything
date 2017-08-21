<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>gaeverything</title>
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
		
		<form action="" method="post" id="postData">
			<!-- Blog Post -->
			<div class="blog-post">
				<c:choose>
					<c:when test="${locationSeq!=null}"><!-- 첫글 -->
						<input type="hidden" id = "locationSeq" name = "locationSeq" value = "${locationSeq}">	
					</c:when>
					<c:otherwise><!-- 수정 시 -->
						<input type="hidden" id = "locationSeq" name = "locationSeq" value = "${dto.locationSeq}">		
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${eventNo!=null}"><!-- 첫글 -->
						<input type="hidden" id = "eventNo" name = "eventNo" value = "${eventNo}">	
					</c:when>
					<c:otherwise><!-- 수정 시 -->
						<input type="hidden" id = "eventNo" name = "eventNo" value = "${dto.eventNo}">		
					</c:otherwise>
				</c:choose>

				
				<!-- category -->		
				<div class="col-md-4">
					<h5>Category</h5>
					<c:choose>
					<c:when test="${dto==null}">
					<select class="chosen-select" name = "boardCategory">
						<option value ="0">Categories</option>
						<option value ="CARE" ${boardCategory == 'CARE'?'selected="selected"':''} ${param.categoryCode == 'CARE'?'selected="selected"':''}>Care</option>
						<option value ="EVENT" ${boardCategory == 'EVENT'?'selected="selected"':''} ${param.categoryCode == 'EVENT'?'selected="selected"':''}>Event</option>
					</select>	
					</c:when>
					<c:otherwise>
					<select class="chosen-select" name = "boardCategory">
						<option value ="0">Categories</option>
						<option value ="CARE" ${dto.boardCategory == 'CARE'?'selected="selected"':''} >Care</option>
						<option value ="EVENT" ${dto.boardCategory == 'EVENT'?'selected="selected"':''} >Event</option>
					</select>	
					</c:otherwise>
					</c:choose>	
				</div>
						
				<!-- title -->
				<div class = "col-md-6">
					<h5>Title</h5>
					<input class="input-text" type="text" name="title" id="title" value="${dto.title}"/>
				</div>
					
				<!-- location -->			
				<div class 	= "location col-md-8">
					<h5>Location</h5>
					<c:choose>
					<c:when test="${dto==null}">
						<input type="text" placeholder="장소를 선택해주세요." name="address" id="address" value="${address}" readonly="readonly">
					</c:when>
					<c:otherwise>
						<input type="text" placeholder="장소를 선택해주세요." name="address" id="address" value="${dto.address}" readonly="readonly">	
					</c:otherwise>
					</c:choose>
					
				</div>
				<div class = "location col-md-4" >
					<div style="padding-top: 30px;">
						<button type="button" class="button border margin-top-5" onclick="search_shop('${param.categoryCode}')" style="width: 110px;">Search</button>
					</div>
				</div>
								
				<!-- rating -->
					<div class = "rating col-md-12" style="padding-bottom: 10px;">	
						<h5>Rating</h5>							
							
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
	
						<!-- content -->
						<!-- content -->
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
						<input type="hidden" id="upload" name="uploadImg" value="${dto.uploadImg}">		
						<input type="hidden" id="onlyText" name="onlyText" value="${dto.onlyText}">
					</div>
						<c:choose>
							<c:when test="${empty dto}">
								<!-- publish -->	
								<div class="button col-md-12"> 
									<button type="button" class="button border margin-top-5" onclick="go_url(2, 0, '${param.categoryCode}')" style="margin-left: 15px;">publish</button>
								</div>
							</c:when>
							
							<c:otherwise>
								<!-- modify button -->
								<div class="button col-md-12"> 	
									<button type="button" class="button border margin-top-5" onclick="go_url(1, ${param.page})" >save</button>
									<button type="button" class="button border margin-top-5" onclick="go_url(0, ${param.page})">back to list</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
				
				<input type="hidden" name = "boardNo" id = "boardNo"value = "${dto.boardNo}">
				
			<!-- Blog Post / End -->
		</div>
		<!-- Content / End -->
	<!-- Widgets -->
	<div class="col-lg-3 col-md-4">
		<div class="sidebar right">

			

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
				<!-- 조회수 높은순으로 보여주기 -->
				<h3>3 Popular Posts</h3>
				<ul class="widget-tabs">
				<c:forEach items="${popularList}" var="board" varStatus="status">
				<c:if test="${status.index<3}">			
					<!-- Post #1 -->
					<li>
						<div class="widget-content">
								<div class="widget-thumb">
								<a href="/review/readPost?boardNo=${board.boardNo}&page=${page}&orderBy=${orderBy}" >
								<c:choose>
								
								<c:when test="${board.uploadImg != null}">
									<img src="/resources/upload/${board.uploadImg}" alt="" style="width:150px; height:80px; object-fit:cover;"> 
								</c:when>
								<c:otherwise>
									<c:choose>
									<c:when test="${board.boardCategory=='EVENT'}">
									<img src="/resources/images/walkthedog.jpg" alt="" style="width:150px; height:80px; object-fit:cover;"> 								
									</c:when>
									<c:otherwise>
									<img src="/resources/images/hospital.jpg" alt="" style="width:150px; height:80px; object-fit:cover;">
									</c:otherwise>
									</c:choose>
								</c:otherwise>
								</c:choose> 
								</a>
								</div>
							
							<div class="widget-text">
							
									<h5><a href="/review/readPost?boardNo=${board.boardNo}&page=${page}&orderBy=${orderBy}">${board.title}</a></h5>
									
									<c:choose>
									<c:when test="${board.boardCategory=='CARE'}">
										<a href="/map/detail/viewDetailPage?locationSeq=${board.locationSeq}">
										<span><i class="sl sl-icon-location" style="color: #F91942"></i>    ${board.address}</span>
									</a>
									</c:when>
									<c:otherwise>
										<a href="/event/detail/view?no=${board.locationSeq}">
										<span><i class="sl sl-icon-paper-plane" style="color: #F91942"></i>    ${board.address}</span>
									</a>
									</c:otherwise>
									</c:choose>
									
									<i class="sl sl-icon-bubble"></i> ${board.numOfCmt}
									<i class="sl sl-icon-heart"></i> ${board.countLike}
									<i class="sl sl-icon-eye"></i> ${board.readCount}					
								
							</div>
							<div class="clearfix"></div>
						</div>
					</li>
				</c:if>
				</c:forEach>	
					

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
		function search_shop(categoryCode){
			window.open("/review/viewSearchShop?categoryCode="+categoryCode, "myWindow", "width=1600,height=600");
		}
	
	
		function go_url(type, page, categoryCode){
			var data = document.getElementById("postData");
			var boardNo = document.getElementById("boardNo").value;
			var url = "/review/viewReviewList";
			var text = CKEDITOR.instances.editor1.document.getBody().getText();
			document.getElementById("onlyText").value = text;

			if(type == 1){
				var check = confirm("게시물을 수정하시겠습니까?")
				if(check==true){
					alert("게시물이 수정되었습니다.");
					url = "/review/modify?page="+page+"&boardNo="+boardNo;
				}else {
					alert("수정이 취소되었습니다.");
					return;
				}				
			}else if(type == 2){ //글 작성

				var title = document.getElementById("title").value;
				var rating = $('input[name="rating"]:checked').val();
				var content = CKEDITOR.instances.editor1.getData();
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
					var check = confirm("작성한 게시글을 등록하시겠습니까?");
					if(check == true){
						alert("게시글이 등록되었습니다.");
						if(categoryCode==''){
							url = "/review/newPost?categoryCode=ALL";
						}else{
						url = "/review/newPost?categoryCode="+categoryCode;
						}
					}else{
						alert("등록이 취소되었습니다.");
						return;
					}
				}else{
					return;
				}
			}
			data.action = url;
			data.submit();
		}
	</script>

</body>
</html>