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


<!-- Function 
=======================-->
<script type="text/javascript">
   function regist_func(){
	    var ds = document.getElementById("dataset");
		var url = "/mypage/updateMember";
		ds.action = url;
		ds.submit();
   }
   
   function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $('#photoImage').attr('src', e.target.result); // '#photoImage는 이미지가 보여질 곳'
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
  
</script>

<!-- 이미지 미리보기 -->
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>

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
					<h2>My Profile</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>My Profile</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

		<div class="row">

			<!-- Profile -->
			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 class="gray">Profile Details</h4>
					<div class="dashboard-list-box-static">

<form method="post" action="" id="dataset" enctype="multipart/form-data">	
						<div class="edit-profile-photo">
					<c:choose>	
					<c:when test="${mypage.photo==null}">
						<img id="photoImage" src="/resources/upload/user_icon.png" alt="">
					</c:when>
					<c:otherwise>
						<img id="photoImage" src="/resources/upload/${mypage.photo}" alt="">
					</c:otherwise>
					</c:choose>
	 
 				
 				
							<div class="change-photo-btn">
								<div class="photoUpload">
								    <span><i class="fa fa-upload"></i> Upload Photo</span>
								    <input name="photo" type="file" onchange="readURL(this);" class="upload" />
								</div>
							</div>
			
 						
						</div>
	
						<!-- Details -->
						<div class="my-profile">

							<label>Nickname</label>
							<input name="nickname" value="${member.nickname}" type="text" readonly="readonly" >

							<label>Email</label>
							<input name="email"  value="${member.email}" type="text" readonly="readonly">
							
							<label>Your Name</label>
							<input name="name" placeholder="Put down your name" value="${mypage.name}" type="text" >
											
							<label>Phone</label>
							<input name="phone" placeholder="Put down your phone number" value="${mypage.phone}" type="text">
				
							<label>Notes</label>
							<textarea name="notes" placeholder="Put down your notes" id="notes" cols="30" rows="10">${mypage.notes}</textarea>
	
						<button class="button margin-top-15" id="button1" onclick="regist_func()">Save Changes</button>
	</form>					
						</div>
	
					</div>
				</div>
			</div>

			<!-- Change Password -->
<!-- 			<div class="col-lg-6 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 class="gray">Change Password</h4>
					<div class="dashboard-list-box-static">

						Change Password
						<div class="my-profile">
							<label class="margin-top-0">Current Password</label>
							<input type="password">

							<label>New Password</label>
							<input type="password">

							<label>Confirm New Password</label>
							<input type="password">

							<button class="button margin-top-15">Change Password</button>
						</div>

					</div>
				</div>
			</div> -->


			<!-- Copyrights -->
			<div class="col-md-12">
				<div class="copyrights">© 2017 Listeo. All Rights Reserved.</div>
			</div>

		</div>

	</div>
	<!-- Content / End -->


</div>
<!-- Dashboard / End -->


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



</body>
</html>
