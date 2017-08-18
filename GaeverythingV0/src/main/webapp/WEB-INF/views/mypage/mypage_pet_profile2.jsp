<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#nameMsg,#speciesMsg,#genderMsg,#ageMsg{
	font-size : 10px;
	float: right;
}
</style>
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
					<h2>Pet Profile</h2>
					<!-- Breadcrumbs -->
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#">Home</a></li>
							<li><a href="#">Dashboard</a></li>
							<li>Pet Profile</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

<form method="post" action="/mypage/modifyPet" id="updateform" enctype="multipart/form-data">	 
		 <div class="row">
               	<!-- Profile -->
			<div class="col-lg-3 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 class="gray">Profile Details</h4>
					<div class="dashboard-list-box-static">
					
					
						<!-- Avatar -->
						<div class="edit-profile-photo">
						<img id="photoImage" src="/resources/upload/${petpage.photo}" alt="">
						
							<div class="change-photo-btn">
								<div class="photoUpload">
								    <span><i class="fa fa-upload"></i> Upload Photo</span>
								    <input name="photo" type="file" onchange="readURL(this);" class="upload" />
								</div>
							</div>
						</div>
	
						<!-- Details -->
						<div class="my-profile">
						<input name="email" value="${petpage.email}" hidden="hidden">
							<input name="petno" value="${petpage.petno}" hidden="hidden">
							<label>Name <span id="nameMsg"></span></label>
							<input name="petname" id="petname" placeholder="Enter your pet's name" value="${petpage.petname}" type="text">

							<label>Species <span id="speciesMsg"></span></label>
							<input name="species" id="species" placeholder="Enter your pet's species" value="${petpage.species}" type="text">
							
							<div class="widget">	
								<h3 class="margin-top-40 margin-bottom-25">Order By</h3>			
								<div>
											<select id="orderBy" data-placeholder="Date" class="chosen-select">
												<option value="boardNo" ${orderBy == 'boardNo'?'selected="selected"':''}>Date</option>	
												<option value="Comments" ${orderBy == 'Comments'?'selected="selected"':''}>Comments</option>	
												<option value="Bookmarks" ${orderBy == 'Bookmarks'?'selected="selected"':''}>Bookmarks</option>			
												<option value="Ratings" ${orderBy == 'Ratings'?'selected="selected"':''}>Ratings</option>						
											</select>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<label>Gender <span id="genderMsg"></span></label>
							<input type="radio" name="gender" value="female" ${petpage.gender=='female'?'checked="checked"':''}>female
                			<input type="radio" name="gender" value="male" ${petpage.gender=='male'?'checked="checked"':''}>male 
							
											
							<label>Age <span id="ageMsg"></span></label>
							<input name="age" id="age" placeholder="Enter your pet's age" value="${petpage.age}" type="text">
				
							<label>Notes</label>
							<textarea name="notes" placeholder="Notes" id="notes" cols="30" rows="10">${petpage.notes}</textarea>
						<input type="button" id="modify" name="modify" value="Save Changes" class="button border fw margin-top-10"/>

 	 </div>
       				 </div>
       				 </div>  				 </div>
       				 </div>
	</form>		
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
<!-- Function 
=======================-->
<script type="text/javascript">
$("#modify").click(function(){
	checkMessage();
	if($("#petname").val()!='' && $("#species").val()!='' && 
			$('input:radio[name="gender"]').is(":checked") && $("#age").val()!=''
			&&!isNaN($("#age").val())){
		$('#updateform').submit();
	}else{
		return;
	}		
});


//등록시 필수항목 체크
function checkMessage(){ 	  
	  var nameMsg = document.getElementById("nameMsg");
	  var speciesMsg = document.getElementById("speciesMsg");
	  var genderMsg = document.getElementById("genderMsg");
	  var ageMsg = document.getElementById("ageMsg");
	  if($("#petname").val()==''){
		  nameMsg.style.color = "#f91942";
		  nameMsg.innerHTML="필수 입력 항목입니다.";
	  }else{
		  nameMsg.innerHTML="";
	  }
	  if($("#species").val()==''){
		  speciesMsg.style.color = "#f91942";
		  speciesMsg.innerHTML="필수 입력 항목입니다.";
	  }else{
		  speciesMsg.innerHTML="";
	  }
	  if($('input:radio[name="gender"]').is(":checked")==false){
		  genderMsg.style.color = "#f91942";
		  genderMsg.innerHTML="필수 입력 항목입니다.";
	  }else{
		  genderMsg.innerHTML="";
	  }
	  if($("#age").val()==''){
		  ageMsg.style.color = "#f91942";
		  ageMsg.innerHTML="필수 입력 항목입니다.";
	  }else{
		  ageMsg.innerHTML="";
	  }
	  if(isNaN($("#age").val())){
		  ageMsg.style.color = "#f91942";
		  ageMsg.innerHTML="숫자를 입력해주세요.";
	  }else{
		  ageMsg.innerHTML="";
	  } 
}
</script>

<!-- 이미지 미리보기 -->
<script type="text/javascript" src="../common/js/jquery-1.9.1.min.js" charset="euc-kr"></script>
<script type="text/javascript">
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


</body>
</html>
