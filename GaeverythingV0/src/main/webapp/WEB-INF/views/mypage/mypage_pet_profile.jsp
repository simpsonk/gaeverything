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
							<input name="petname" id="petname" placeholder="Enter pet's name" value="${petpage.petname}" type="text" >

							<label>Species <span id="speciesMsg"></span></label>
							<%-- <input name="species" id="species" placeholder="Enter your pet's species" value="${petpage.species}" type="text"> --%>
							
							<div class="widget">			
								<div>
											<select name="species" id="species" data-placeholder="Select pet's species" class="chosen-select">
												<option value="0">Select pet's species</option>	
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
												<option value="사플라니낙">사플라니낙</option>	
												<option value="살루키">살루키</option>	
												<option value="삽살개">삽살개</option>	
												<option value="샤를로스 울프독">샤를로스 울프독</option>	
												<option value="샤페이">샤페이</option>	
												<option value="세르비안 디펜스 독">세르비안 디펜스 독</option>	
												<option value="세인트 버나드">세인트 버나드</option>	
												<option value="셔틀랜드 쉽독">셔틀랜드 쉽독</option>	
												<option value="셰퍼드">셰퍼드</option>	
												<option value="슈나우저">슈나우저</option>	
												<option value="스키퍼키">스키퍼키</option>	
												<option value="스피츠">스피츠</option>	
												<option value="시바견">시바견</option>	
												<option value="시베리안 허스키">시베리안 허스키</option>	
												<option value="시추">시추</option>	
												<option value="시코쿠견">시코쿠견</option>
												<option value="아메리칸 밴도지">아메리칸 밴도지</option>	
												<option value="아메리칸 불리">아메리칸 불리</option>	
												<option value="아이리시 세터">아이리시 세터</option>	
												<option value="아이리시 울프 하운드">아이리시 울프 하운드</option>	
												<option value="아크라이트 포인터">아크라이트 포인터</option>	
												<option value="아크바시">아크바시</option>	
												<option value="아키타견">아키타견</option>	
												<option value="아펜 핀셔">아펜 핀셔</option>	
												<option value="아프간 하운드">아프간 하운드</option>	
												<option value="알래스칸 말라뮤트">알래스칸 말라뮤트</option>	
												<option value="알로페키스">알로페키스</option>	
												<option value="에스트렐라 마운틴 독">에스트렐라 마운틴 독</option>	
												<option value="에어데일 테리어">에어데일 테리어</option>	
												<option value="오브차카">오브차카</option>	
												<option value="올드 잉글리시 쉽독">올드 잉글리시 쉽독</option>	
												<option value="요크셔 테리어">요크셔 테리어</option>
												<option value="웨스트 하이랜드 화이트테리어">웨스트 하이랜드 화이트테리어</option>	
												<option value="웰시 코기">웰시 코기</option>	
												<option value="잉글리시 마스티프">잉글리시 마스티프</option>	
												<option value="자이언트 슈나우저">자이언트 슈나우저</option>	
												<option value="재패니즈 스피츠">재패니즈 스피츠</option>	
												<option value="재패니즈 친">재패니즈 친</option>	
												<option value="잭 러셀 테리어">잭 러셀 테리어</option>	
												<option value="저먼 셰퍼드">저먼 셰퍼드</option>	
												<option value="저먼 핀셔">저먼 핀셔</option>	
												<option value="진돗개">진돗개</option>
												<option value="차우차우">차우차우</option>	
												<option value="차이니스 크레스티드">차이니스 크레스티드</option>	
												<option value="체코슬로바키안 울프독">체코슬로바키안 울프독</option>	
												<option value="치와와">치와와</option>	
												<option value="카발리에 킹 찰스 스파니엘">카발리에 킹 찰스 스파니엘</option>	
												<option value="카이홋 하운드">카이홋 하운드</option>	
												<option value="카타훌라">카타훌라</option>	
												<option value="캉갈">캉갈</option>	
												<option value="컬리 코티드 리트리버">컬리 코티드 리트리버</option>	
												<option value="케니스펜더">케니스펜더</option>
												<option value="케이스혼트">케이스혼트</option>	
												<option value="케인 코르소">케인 코르소</option>	
												<option value="코리안 마스티프">코리안 마스티프</option>	
												<option value="코몬도르">코몬도르</option>
												<option value="코카 스파니엘">코카 스파니엘</option>	
												<option value="콜리">콜리</option>	
												<option value="쿠바츠">쿠바츠</option>	
												<option value="크레타 하운드">크레타 하운드</option>
												<option value="킹 찰스 스패니얼">킹 찰스 스패니얼</option>	
												<option value="타이 리지백">타이 리지백</option>
												<option value="트라이 하운드">트라이 하운드</option>	
												<option value="트란실바니안 하운드">트란실바니안 하운드</option>	
												<option value="티베탄 마스티프">티베탄 마스티프</option>	
												<option value="티베탄 스파니엘">티베탄 스파니엘</option>
												<option value="티베탄 테리어">티베탄 테리어</option>	
												<option value="파라오 하운드">파라오 하운드</option>
												<option value="패터데일 테리어">패터데일 테리어</option>	
												<option value="퍼그">퍼그</option>
												<option value="페키니즈">페키니즈</option>	
												<option value="포메라니안">포메라니안</option>
												<option value="포인터">포인터</option>	
												<option value="포르투갈 워터 도그">포르투갈 워터 도그</option>
												<option value="폭스 테리어">폭스 테리어</option>	
												<option value="푸들">푸들</option>
												<option value="풀리">풀리</option>	
												<option value="풍산개">풍산개</option>
												<option value="프레사 까나리오">프레사 까나리오</option>	
												<option value="프렌치 불도그">프렌치 불도그</option>
												<option value="플랫 코티드 리트리버">플랫 코티드 리트리버</option>	
												<option value="필라 브라질레이로">필라 브라질레이로</option>
												<option value="핏 불 테리어">핏 불 테리어</option>
												<option value="하바니즈">하바니즈</option>
												<option value="해리어">해리어</option>
											</select>
								</div>
								<div class="clearfix"></div>
							</div>
							
							<label>Gender <span id="genderMsg"></span></label>
							<input type="radio" name="gender" value="female" ${gender=='female'?'checked="checked"':''}>female
                			<input type="radio" name="gender" value="male" ${gender=='male'?'checked="checked"':''}>male 
											
							<label>Age <span id="ageMsg"></span> </label>
							<%-- <input name="age" id="age" placeholder="Enter pet's age" value="${petpage.age}" type="text"> --%>
						
							<select name="age" id="age" data-placeholder="Select pet's age" class="chosen-select">
								<option value="0">Select pet's age</option>	
								<option value="1">1</option>	
								<option value="2">2</option>	
								<option value="3">3</option>	
								<option value="4">4</option>	
								<option value="5">5</option>	
								<option value="6">6</option>	
								<option value="7">7</option>	
								<option value="8">8</option>	
								<option value="9">9</option>	
								<option value="10">10</option>	
								<option value="11">11</option>	
								<option value="12">12</option>	
								<option value="13">13</option>	
								<option value="14">14</option>	
								<option value="15">15</option>
								<option value="16">16</option>	
								<option value="17">17</option>	
								<option value="18">18</option>	
								<option value="19">19</option>	
								<option value="20">20</option>
							</select>
				
				
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
	if($("#petname").val()!='' && $("#species").val()!='0' && 
			$('input:radio[name="gender"]').is(":checked") && $("#age").val()!='0'){
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
	  if($("#species").val()=='0'){
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
	  if($("#age").val()=='0'){
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
