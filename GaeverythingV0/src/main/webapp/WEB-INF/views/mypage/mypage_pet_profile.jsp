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

<form method="post" action="/mypage/registNewPet" id="addform" enctype="multipart/form-data">	 
		 <div class="row">
               	<!-- Profile -->
			<div class="col-lg-3 col-md-12">
				<div class="dashboard-list-box margin-top-0">
					<h4 class="gray">Profile Details</h4>
					<div class="dashboard-list-box-static">
					
					
						<!-- Avatar -->
						<div class="edit-profile-photo">
						
						
			
						<c:choose>	
						<c:when test="${petpage.photo==null}">
							<img id="photoImage" src="/resources/upload/dog_icon.png" alt="">
						</c:when>
						<c:otherwise>
							<img id="photoImage" src="/resources/upload/${petpage.photo}" alt="">
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
						<input name="email" value="${member.email}" hidden="hidden">
							<input name="petno" value="${petpage.petno}" hidden="hidden">
							<label>Name <span id="nameMsg"></span></label>
							<input name="petname" id="petname" placeholder="Enter your pet's name" value="${petpage.petname}" type="text" >

							<label>Species <span id="speciesMsg"></span></label>
							<input name="species" id="species" placeholder="Enter your pet's species" value="${petpage.species}" type="text">
							
							<div class="widget">			
								<div>
											<select name="species" id="species" data-placeholder="Enter your pet's species" class="chosen-select">
												<option value="0">Select your pet's species</option>	
												<option value="골든 두들" >골든 두들</option>
												<option value="골든 리트리버" >골든 리트리버</option>
												<option value="그레이 하운드" >그레이 하운드</option>
												<option value="그레이트 데인" >그레이트 데인</option>
												<option value="그레이트 피레니즈" >그레이트 피레니즈</option>
												<option value="그린란드견" >그린란드견</option>
												<option value="그리스 셰퍼드" >그리스 셰퍼드</option>
												<option value="그리스 헤어하운드" >그리스 헤어하운드</option>
												<option value="까나리오" >까나리오</option>	
												<option value="꼬똥 드 툴레아" >꼬똥 드 툴레아</option>	
												<option value="노르위치 테리어" >노르위치 테리어</option>	
												<option value="노포크 테리어" >노포크 테리어</option>	
												<option value="뉴펀들랜드" >뉴펀들랜드</option>	
												<option value="뉴기니 노래하는개" >뉴기니 노래하는개</option>	
												<option value="닥스훈트" >닥스훈트</option>	
												<option value="달마시안" >달마시안</option>	
												<option value="댄디 딘몬트 테리어" >댄디 딘몬트 테리어</option>	
												<option value="도고 까나리오" >도고 까나리오</option>	
												<option value="도고 아르젠티노" >도고 아르젠티노</option>	
												<option value="도베르만" >도베르만</option>	
												<option value="도사견" >도사견</option>	
												<option value="동경이" >동경이</option>	
												<option value="똥개" >똥개</option>	
												<option value="라사압소" >라사압소</option>	
												<option value="라페이로 도 알렌테조" >라페이로 도 알렌테조</option>	
												<option value="래브라도 리트리버" >래브라도 리트리버</option>	
												<option value="레온베르거" >레온베르거</option>	
												<option value="로디지안 리지백" >로디지안 리지백</option>	
												<option value="로첸" >로첸</option>	
												<option value="로트와일러" >로트와일러</option>	
												<option value="마스티프" >마스티프</option>	
												<option value="말티즈" >말티즈</option>	
												<option value="몰록" >몰록</option>	
												<option value="미니어처 슈나우저" >미니어처 슈나우저</option>	
												<option value="말라뮤트">말라뮤트</option>	
												<option value="믹스견">믹스견</option>	
												<option value="바셋하운드">바셋하운드</option>	
												<option value="바이마라너">바이마라너</option>	
												<option value="버니즈 마운틴 독">버니즈 마운틴 독</option>	
												<option value="베들링턴 테리어">베들링턴 테리어</option>	
												<option value="벨지언 쉽독">벨지언 쉽독</option>	
												<option value="보더 콜리">보더 콜리</option>	
												<option value="보르도 마스티프">보르도 마스티프</option>	
												<option value="보르조이">보르조이</option>	
												<option value="보리쿠안 마스티프">보리쿠안 마스티프</option>	
												<option value="보비에 드 플란더스">보비에 드 플란더스</option>	
												<option value="보스롱">보스롱</option>	
												<option value="보스턴 테리어">보스턴 테리어</option>
												<option value="복서">복서</option>	
												<option value="불 마스티프">불 마스티프</option>	
												<option value="불개">불개</option>	
												<option value="불도그">불도그</option>	
												<option value="불리 쿠타">불리 쿠타</option>	
												<option value="불테리어">불테리어</option>	
												<option value="브리어드">브리어드</option>	
												<option value="브리타니 스파니엘(브리타니)">브리타니 스파니엘(브리타니)</option>	
												<option value="블랙 러시안 테리어">블랙 러시안 테리어</option>	
												<option value="블러드하운드">블러드하운드</option>	
												<option value="비글">비글</option>	
												<option value="비숑 프리제">비숑 프리제</option>	
												<option value="비어디드 콜리">비어디드 콜리</option>	
												<option value="비즐라">비즐라</option>
												<option value="빠삐용">빠삐용</option>	
												<option value="사모예드">사모예드</option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>	
												<option value=""></option>
												<!-- https://namu.wiki/w/%EA%B2%AC%EC%A2%85/%E3%84%B1%E3%84%B4%E3%84%B7%EC%88%9C -->
											</select>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<label>Gender <span id="genderMsg"></span></label>
							<input type="radio" name="gender" value="female" ${gender=='female'?'checked="checked"':''}>female
                			<input type="radio" name="gender" value="male" ${gender=='male'?'checked="checked"':''}>male 
											
							<label>Age <span id="ageMsg"></span> </label>
							<input name="age" id="age" placeholder="Enter your pet's age" value="${petpage.age}" type="text">
				
							<label>Notes</label>
							<textarea name="notes" placeholder="Notes" id="notes" cols="30" rows="10">${petpage.notes}</textarea>
						<input type="button" id="register" name="register" value="Register" class="button border fw margin-top-10"/>
					
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

<script type="text/javascript">
<!-- Function -->
//등록 버튼 누를시
$("#register").click(function(){
	checkMessage();
	var petname = document.getElementById("petname").value;
	var species = document.getElementById("species").value;
	if($("#petname").val()!='' && $("#species").val()!='' && 
			$('input:radio[name="gender"]').is(":checked") && $("#age").val()!=''){
		var f = confirm("펫 등록을 완료하시겠습니까?");
		if(f){
			$('#addform').submit();
		}else{
			return false;
		}
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
