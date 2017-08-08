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
		var url = "/mypage/viewMypagePetProfile";
		ds.action = url;
		ds.submit();
   }
   
  function modify_func(){
	  	var ds = document.getElementById("");
		var url = "/mypage/viewModifyPetProfile";
		ds.action = url;
		ds.submit();
  }
  
  function remove_func(){
	  	var ds = document.getElementById("dataset");
		var url = "/mypage/removePet";
		ds.action = url;
		ds.submit();
  }
   

</script>

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
					<h2>My Pet List</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>My Pet List</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

<form action="" id="dataset" method="POST">		
               
       <c:forEach var="petpage" items="${list}">        
               	<!-- Profile2 -->
			<div class="col-lg-3 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 style="background: #F91942; color: white;">${petpage.petname}</h4>
					<div class="dashboard-list-box-static">			

						<!-- Avatar -->
						<div class="edit-profile-photo">
						<img id="photoImage" src="/resources/upload/${petpage.photo}" alt=""
						style="height: 200px;">
					<!-- 		<div class="change-photo-btn">
								<div class="photoUpload">
								    <span><i class="fa fa-upload"></i> Upload Photo</span>
								    <input name="photo" type="file" class="upload" />
								</div>
							</div>  -->
						</div>
		
						<!-- Details -->	
						<div class="my-profile">
									
							<div>
			
						 	  <li><p>Name: <span>${petpage.petname}</span></p></li>                              
                              <li><p>Species : <span>${petpage.species}</span></p></li>
                              <li><p>Age : <span>${petpage.age}</span></p></li>
                              <li><p>Gender : <span>${petpage.gender}</span></p></li>
                              <li><p>Notes: <span><div>${petpage.notes}</div></span></p></li>
		 					</div>		
					<a href = "/mypage/viewModifyPetProfile?petno=${petpage.petno}"><button class="button margin-top-15" onclick="modify_func()" type="button">Edit</button></a>
					<a href = "/mypage/removePet?petno=${petpage.petno}"><button class="button margin-top-15" onclick="remove_func()" type="button">Delete</button></a>
 						</div>
 						
 				</div></div></div>					
		</c:forEach>
		 			<!-- 	<div class="col-lg-6 col-md-12"> -->
 			<div class="col-lg-3 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 class="gray">My Pet </h4>
					<div class="dashboard-list-box-static">	
								 <button class="button margin-top-15" id="add" onclick="regist_func()" type="button">+ Add</button>
		</div></div></div>
		
</form>		
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
