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
			<div class="col-lg-4 col-md-12">
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
							<div class="widget">			
								<div>
											<select name="species" id="species" data-placeholder="Select pet's species" class="chosen-select">
												<option value="0">Select pet's species</option>	
												<option value="골든 두들" ${petpage.species == '골든 두들'?'selected="selected"':''}>골든 두들</option>
												<option value="골든 리트리버" ${petpage.species == '골든 리트리버'?'selected="selected"':''}>골든 리트리버</option>
												<option value="그레이 하운드" ${petpage.species == '그레이 하운드'?'selected="selected"':''}>그레이 하운드</option>
												<option value="그레이트 데인" ${petpage.species == '그레이트 데인'?'selected="selected"':''}>그레이트 데인</option>
												<option value="그레이트 피레니즈" ${petpage.species == '그레이트 피레니즈'?'selected="selected"':''}>그레이트 피레니즈</option>
												<option value="그린란드견" ${petpage.species == '그린란드견'?'selected="selected"':''}>그린란드견</option>
												<option value="그리스 셰퍼드" ${petpage.species == '그리스 셰퍼드'?'selected="selected"':''}>그리스 셰퍼드</option>
												<option value="그리스 헤어하운드" ${petpage.species == '그리스 헤어하운드'?'selected="selected"':''}>그리스 헤어하운드</option>
												<option value="까나리오" ${petpage.species == '까나리오'?'selected="selected"':''}>까나리오</option>	
												<option value="꼬똥 드 툴레아" ${petpage.species == '꼬똥 드 툴레아'?'selected="selected"':''}>꼬똥 드 툴레아</option>	
												<option value="노르위치 테리어" ${petpage.species == '노르위치 테리어'?'selected="selected"':''}>노르위치 테리어</option>	
												<option value="노포크 테리어" ${petpage.species == '노포크 테리어'?'selected="selected"':''}>노포크 테리어</option>	
												<option value="뉴펀들랜드" ${petpage.species == '뉴펀들랜드'?'selected="selected"':''}>뉴펀들랜드</option>	
												<option value="뉴기니 노래하는개" ${petpage.species == '뉴기니 노래하는개'?'selected="selected"':''}>뉴기니 노래하는개</option>	
												<option value="닥스훈트" ${petpage.species == '닥스훈트'?'selected="selected"':''}>닥스훈트</option>	
												<option value="달마시안" ${petpage.species == '달마시안'?'selected="selected"':''}>달마시안</option>	
												<option value="댄디 딘몬트 테리어" ${petpage.species == '댄디 딘몬트 테리어'?'selected="selected"':''}>댄디 딘몬트 테리어</option>	
												<option value="도고 까나리오" ${petpage.species == '도고 까나리오'?'selected="selected"':''}>도고 까나리오</option>	
												<option value="도고 아르젠티노" ${petpage.species == '도고 아르젠티노'?'selected="selected"':''}>도고 아르젠티노</option>	
												<option value="도베르만" ${petpage.species == '도베르만'?'selected="selected"':''}>도베르만</option>	
												<option value="도사견" ${petpage.species == '도사견'?'selected="selected"':''}>도사견</option>	
												<option value="동경이" ${petpage.species == '동경이'?'selected="selected"':''}>동경이</option>	
												<option value="똥개" ${petpage.species == '똥개'?'selected="selected"':''}>똥개</option>	
												<option value="라사압소" ${petpage.species == '라사압소'?'selected="selected"':''}>라사압소</option>	
												<option value="라페이로 도 알렌테조" ${petpage.species == '라페이로 도 알렌테조'?'selected="selected"':''}>라페이로 도 알렌테조</option>	
												<option value="래브라도 리트리버" ${petpage.species == '래브라도 리트리버'?'selected="selected"':''}>래브라도 리트리버</option>	
												<option value="레온베르거" ${petpage.species == '레온베르거'?'selected="selected"':''}>레온베르거</option>	
												<option value="로디지안 리지백" ${petpage.species == '로디지안 리지백'?'selected="selected"':''}>로디지안 리지백</option>	
												<option value="로첸" ${petpage.species == '로첸'?'selected="selected"':''}>로첸</option>	
												<option value="로트와일러" ${petpage.species == '로트와일러'?'selected="selected"':''}>로트와일러</option>	
												<option value="마스티프" ${petpage.species == '마스티프'?'selected="selected"':''}>마스티프</option>	
												<option value="말티즈" ${petpage.species == '말티즈'?'selected="selected"':''}>말티즈</option>	
												<option value="몰록" ${petpage.species == '몰록'?'selected="selected"':''}>몰록</option>	
												<option value="미니어처 슈나우저" ${petpage.species == '미니어처 슈나우저'?'selected="selected"':''}>미니어처 슈나우저</option>	
												<option value="말라뮤트" ${petpage.species == '말라뮤트'?'selected="selected"':''}>말라뮤트</option>	
												<option value="믹스견" ${petpage.species == '믹스견'?'selected="selected"':''}>믹스견</option>	
												<option value="바셋하운드" ${petpage.species == '바셋하운드'?'selected="selected"':''}>바셋하운드</option>	
												<option value="바이마라너" ${petpage.species == '바이마라너'?'selected="selected"':''}>바이마라너</option>	
												<option value="버니즈 마운틴 독" ${petpage.species == '버니즈 마운틴 독'?'selected="selected"':''}>버니즈 마운틴 독</option>	
												<option value="베들링턴 테리어" ${petpage.species == '베들링턴 테리어'?'selected="selected"':''}>베들링턴 테리어</option>	
												<option value="벨지언 쉽독" ${petpage.species == '벨지언 쉽독'?'selected="selected"':''}>벨지언 쉽독</option>	
												<option value="보더 콜리" ${petpage.species == '보더 콜리'?'selected="selected"':''}>보더 콜리</option>	
												<option value="보르도 마스티프" ${petpage.species == '보르도 마스티프'?'selected="selected"':''}>보르도 마스티프</option>	
												<option value="보르조이" ${petpage.species == '보르조이'?'selected="selected"':''}>보르조이</option>	
												<option value="보리쿠안 마스티프" ${petpage.species == '보리쿠안 마스티프'?'selected="selected"':''}>보리쿠안 마스티프</option>	
												<option value="보비에 드 플란더스" ${petpage.species == '보비에 드 플란더스'?'selected="selected"':''}>보비에 드 플란더스</option>	
												<option value="보스롱" ${petpage.species == '보스롱'?'selected="selected"':''}>보스롱</option>	
												<option value="보스턴 테리어" ${petpage.species == '보스턴 테리어'?'selected="selected"':''}>보스턴 테리어</option>
												<option value="복서" ${petpage.species == '복서'?'selected="selected"':''}>복서</option>	
												<option value="불 마스티프" ${petpage.species == '불 마스티프'?'selected="selected"':''}>불 마스티프</option>	
												<option value="불개" ${petpage.species == '불개'?'selected="selected"':''}>불개</option>	
												<option value="불도그" ${petpage.species == '불도그'?'selected="selected"':''}>불도그</option>	
												<option value="불리 쿠타" ${petpage.species == '불리 쿠타'?'selected="selected"':''}>불리 쿠타</option>	
												<option value="불테리어" ${petpage.species == '불테리어'?'selected="selected"':''}>불테리어</option>	
												<option value="브리어드" ${petpage.species == '브리어드'?'selected="selected"':''}>브리어드</option>	
												<option value="브리타니 스파니엘(브리타니)" ${petpage.species == '브리타니 스파니엘(브리타니)'?'selected="selected"':''}>브리타니 스파니엘(브리타니)</option>	
												<option value="블랙 러시안 테리어" ${petpage.species == '블랙 러시안 테리어'?'selected="selected"':''}>블랙 러시안 테리어</option>	
												<option value="블러드하운드" ${petpage.species == '블러드하운드'?'selected="selected"':''}>블러드하운드</option>	
												<option value="비글" ${petpage.species == '비글'?'selected="selected"':''}>비글</option>	
												<option value="비숑 프리제" ${petpage.species == '비숑 프리제'?'selected="selected"':''}>비숑 프리제</option>	
												<option value="비어디드 콜리" ${petpage.species == '비어디드 콜리'?'selected="selected"':''}>비어디드 콜리</option>	
												<option value="비즐라" ${petpage.species == '비즐라'?'selected="selected"':''}>비즐라</option>
												<option value="빠삐용" ${petpage.species == '빠삐용'?'selected="selected"':''}>빠삐용</option>	
												<option value="사모예드" ${petpage.species == '사모예드'?'selected="selected"':''}>사모예드</option>	
												<option value="사플라니낙" ${petpage.species == '사플라니낙'?'selected="selected"':''}>사플라니낙</option>	
												<option value="살루키" ${petpage.species == '살루키'?'selected="selected"':''}>살루키</option>	
												<option value="삽살개" ${petpage.species == '삽살개'?'selected="selected"':''}>삽살개</option>	
												<option value="샤를로스 울프독" ${petpage.species == '샤를로스 울프독'?'selected="selected"':''}>샤를로스 울프독</option>	
												<option value="샤페이"  ${petpage.species == '샤페이'?'selected="selected"':''}>샤페이</option>	
												<option value="세르비안 디펜스 독" ${petpage.species == '세르비안 디펜스 독'?'selected="selected"':''}>세르비안 디펜스 독</option>	
												<option value="세인트 버나드" ${petpage.species == '세인트 버나드'?'selected="selected"':''}>세인트 버나드</option>	
												<option value="셔틀랜드 쉽독" ${petpage.species == '셔틀랜드 쉽독'?'selected="selected"':''}>셔틀랜드 쉽독</option>	
												<option value="셰퍼드" ${petpage.species == '셰퍼드'?'selected="selected"':''}>셰퍼드</option>	
												<option value="슈나우저" ${petpage.species == '슈나우저'?'selected="selected"':''}>슈나우저</option>	
												<option value="스키퍼키" ${petpage.species == '스키퍼키'?'selected="selected"':''}>스키퍼키</option>	
												<option value="스피츠" ${petpage.species == '스피츠'?'selected="selected"':''}>스피츠</option>	
												<option value="시바견" ${petpage.species == '시바견'?'selected="selected"':''}>시바견</option>	
												<option value="시베리안 허스키" ${petpage.species == '시베리안 허스키'?'selected="selected"':''}>시베리안 허스키</option>	
												<option value="시추" ${petpage.species == '시추'?'selected="selected"':''}>시추</option>	
												<option value="시코쿠견" ${petpage.species == '시코쿠견'?'selected="selected"':''}>시코쿠견</option>
												<option value="아메리칸 밴도지" ${petpage.species == '아메리칸 밴도지'?'selected="selected"':''}>아메리칸 밴도지</option>	
												<option value="아메리칸 불리" ${petpage.species == '아메리칸 불리'?'selected="selected"':''}>아메리칸 불리</option>	
												<option value="아이리시 세터" ${petpage.species == '아이리시 세터'?'selected="selected"':''}>아이리시 세터</option>	
												<option value="아이리시 울프 하운드" ${petpage.species == '아이리시 울프 하운드'?'selected="selected"':''}>아이리시 울프 하운드</option>	
												<option value="아크라이트 포인터" ${petpage.species == '아크라이트 포인터'?'selected="selected"':''}>아크라이트 포인터</option>	
												<option value="아크바시" ${petpage.species == '아크바시'?'selected="selected"':''}>아크바시</option>	
												<option value="아키타견" ${petpage.species == '아키타견'?'selected="selected"':''}>아키타견</option>	
												<option value="아펜 핀셔" ${petpage.species == '아펜 핀셔'?'selected="selected"':''}>아펜 핀셔</option>	
												<option value="아프간 하운드" ${petpage.species == '아프간 하운드'?'selected="selected"':''}>아프간 하운드</option>	
												<option value="알래스칸 말라뮤트" ${petpage.species == '알래스칸 말라뮤트'?'selected="selected"':''}>알래스칸 말라뮤트</option>	
												<option value="알로페키스" ${petpage.species == '알로페키스'?'selected="selected"':''}>알로페키스</option>	
												<option value="에스트렐라 마운틴 독" ${petpage.species == '에스트렐라 마운틴 독'?'selected="selected"':''}>에스트렐라 마운틴 독</option>	
												<option value="에어데일 테리어" ${petpage.species == '에어데일 테리어'?'selected="selected"':''}>에어데일 테리어</option>	
												<option value="오브차카" ${petpage.species == '오브차카'?'selected="selected"':''}>오브차카</option>	
												<option value="올드 잉글리시 쉽독" ${petpage.species == '올드 잉글리시 쉽독'?'selected="selected"':''}>올드 잉글리시 쉽독</option>	
												<option value="요크셔 테리어" ${petpage.species == '요크셔 테리어'?'selected="selected"':''}>요크셔 테리어</option>
												<option value="웨스트 하이랜드 화이트테리어" ${petpage.species == '웨스트 하이랜드 화이트테리어'?'selected="selected"':''}>웨스트 하이랜드 화이트테리어</option>	
												<option value="웰시 코기" ${petpage.species == '웰시 코기'?'selected="selected"':''}>웰시 코기</option>	
												<option value="잉글리시 마스티프" ${petpage.species == '잉글리시 마스티프'?'selected="selected"':''}>잉글리시 마스티프</option>	
												<option value="자이언트 슈나우저" ${petpage.species == '자이언트 슈나우저'?'selected="selected"':''}>자이언트 슈나우저</option>	
												<option value="재패니즈 스피츠" ${petpage.species == '재패니즈 스피츠'?'selected="selected"':''}>재패니즈 스피츠</option>	
												<option value="재패니즈 친" ${petpage.species == '재패니즈 친'?'selected="selected"':''}>재패니즈 친</option>	
												<option value="잭 러셀 테리어" ${petpage.species == '잭 러셀 테리어'?'selected="selected"':''}>잭 러셀 테리어</option>	
												<option value="저먼 셰퍼드" ${petpage.species == '저먼 셰퍼드'?'selected="selected"':''}>저먼 셰퍼드</option>	
												<option value="저먼 핀셔" ${petpage.species == '저먼 핀셔'?'selected="selected"':''}>저먼 핀셔</option>	
												<option value="진돗개" ${petpage.species == '진돗개'?'selected="selected"':''}>진돗개</option>
												<option value="차우차우" ${petpage.species == '차우차우'?'selected="selected"':''}>차우차우</option>	
												<option value="차이니스 크레스티드" ${petpage.species == '차이니스 크레스티드'?'selected="selected"':''}>차이니스 크레스티드</option>	
												<option value="체코슬로바키안 울프독" ${petpage.species == '체코슬로바키안 울프독'?'selected="selected"':''}>체코슬로바키안 울프독</option>	
												<option value="치와와" ${petpage.species == '치와와'?'selected="selected"':''}>치와와</option>	
												<option value="카발리에 킹 찰스 스파니엘" ${petpage.species == '카발리에 킹 찰스 스파니엘'?'selected="selected"':''}>카발리에 킹 찰스 스파니엘</option>	
												<option value="카이홋 하운드" ${petpage.species == '카이홋 하운드'?'selected="selected"':''}>카이홋 하운드</option>	
												<option value="카타훌라" ${petpage.species == '카타훌라'?'selected="selected"':''}>카타훌라</option>	
												<option value="캉갈" ${petpage.species == '캉갈'?'selected="selected"':''}>캉갈</option>	
												<option value="컬리 코티드 리트리버" ${petpage.species == '컬리 코티드 리트리버'?'selected="selected"':''}>컬리 코티드 리트리버</option>	
												<option value="케니스펜더" ${petpage.species == '케니스펜더'?'selected="selected"':''}>케니스펜더</option>
												<option value="케이스혼트" ${petpage.species == '케이스혼트'?'selected="selected"':''}>케이스혼트</option>	
												<option value="케인 코르소" ${petpage.species == '케인 코르소'?'selected="selected"':''}>케인 코르소</option>	
												<option value="코리안 마스티프" ${petpage.species == '코리안 마스티프'?'selected="selected"':''}>코리안 마스티프</option>	
												<option value="코몬도르" ${petpage.species == '코몬도르'?'selected="selected"':''}>코몬도르</option>
												<option value="코카 스파니엘" ${petpage.species == '코카 스파니엘'?'selected="selected"':''}>코카 스파니엘</option>	
												<option value="콜리" ${petpage.species == '콜리'?'selected="selected"':''}>콜리</option>	
												<option value="쿠바츠" ${petpage.species == '쿠바츠'?'selected="selected"':''}>쿠바츠</option>	
												<option value="크레타 하운드" ${petpage.species == '크레타 하운드'?'selected="selected"':''}>크레타 하운드</option>
												<option value="킹 찰스 스패니얼" ${petpage.species == '킹 찰스 스패니얼'?'selected="selected"':''}>킹 찰스 스패니얼</option>	
												<option value="타이 리지백" ${petpage.species == '타이 리지백'?'selected="selected"':''}>타이 리지백</option>
												<option value="트라이 하운드" ${petpage.species == '트라이 하운드'?'selected="selected"':''}>트라이 하운드</option>	
												<option value="트란실바니안 하운드" ${petpage.species == '트란실바니안 하운드'?'selected="selected"':''}>트란실바니안 하운드</option>	
												<option value="티베탄 마스티프" ${petpage.species == '티베탄 마스티프'?'selected="selected"':''}>티베탄 마스티프</option>	
												<option value="티베탄 스파니엘" ${petpage.species == '티베탄 스파니엘'?'selected="selected"':''}>티베탄 스파니엘</option>
												<option value="티베탄 테리어" ${petpage.species == '티베탄 테리어'?'selected="selected"':''}>티베탄 테리어</option>	
												<option value="파라오 하운드" ${petpage.species == '파라오 하운드'?'selected="selected"':''}>파라오 하운드</option>
												<option value="패터데일 테리어" ${petpage.species == '패터데일 테리어'?'selected="selected"':''}>패터데일 테리어</option>	
												<option value="퍼그" ${petpage.species == '퍼그'?'selected="selected"':''}>퍼그</option>
												<option value="페키니즈" ${petpage.species == '페키니즈'?'selected="selected"':''}>페키니즈</option>	
												<option value="포메라니안" ${petpage.species == '포메라니안'?'selected="selected"':''}>포메라니안</option>
												<option value="포인터" ${petpage.species == '포인터'?'selected="selected"':''}>포인터</option>	
												<option value="포르투갈 워터 도그" ${petpage.species == '포르투갈 워터 도그'?'selected="selected"':''}>포르투갈 워터 도그</option>
												<option value="폭스 테리어" ${petpage.species == '폭스 테리어'?'selected="selected"':''}>폭스 테리어</option>	
												<option value="푸들" ${petpage.species == '푸들'?'selected="selected"':''}>푸들</option>
												<option value="풀리" ${petpage.species == '풀리'?'selected="selected"':''}>풀리</option>	
												<option value="풍산개" ${petpage.species == '풍산개'?'selected="selected"':''}>풍산개</option>
												<option value="프레사 까나리오" ${petpage.species == '프레사 까나리오'?'selected="selected"':''}>프레사 까나리오</option>	
												<option value="프렌치 불도그" ${petpage.species == '프렌치 불도그'?'selected="selected"':''}>프렌치 불도그</option>
												<option value="플랫 코티드 리트리버" ${petpage.species == '플랫 코티드 리트리버'?'selected="selected"':''}>플랫 코티드 리트리버</option>	
												<option value="필라 브라질레이로" ${petpage.species == '필라 브라질레이로'?'selected="selected"':''}>필라 브라질레이로</option>
												<option value="핏 불 테리어" ${petpage.species == '핏 불 테리어'?'selected="selected"':''}>핏 불 테리어</option>
												<option value="하바니즈" ${petpage.species == '하바니즈'?'selected="selected"':''}>하바니즈</option>
												<option value="해리어" ${petpage.species == '해리어'?'selected="selected"':''}>해리어</option>
											</select>
								</div>
								<div class="clearfix"></div>
							</div>
							
							
							<label>Gender <span id="genderMsg"></span></label>
							<input type="radio" name="gender" value="female" ${petpage.gender=='female'?'checked="checked"':''}>female
                			<input type="radio" name="gender" value="male" ${petpage.gender=='male'?'checked="checked"':''}>male 
							
											
							<label>Age <span id="ageMsg"></span></label>
							<select name="age" id="age" data-placeholder="Select pet's age" class="chosen-select">
								<option value="0">Select pet's age</option>	
								<option value="1" ${petpage.age == '1'?'selected="selected"':''}>1</option>	
								<option value="2" ${petpage.age == '2'?'selected="selected"':''}>2</option>	
								<option value="3" ${petpage.age == '3'?'selected="selected"':''}>3</option>	
								<option value="4" ${petpage.age == '4'?'selected="selected"':''}>4</option>	
								<option value="5" ${petpage.age == '5'?'selected="selected"':''}>5</option>	
								<option value="6" ${petpage.age == '6'?'selected="selected"':''}>6</option>	
								<option value="7" ${petpage.age == '7'?'selected="selected"':''}>7</option>	
								<option value="8" ${petpage.age == '8'?'selected="selected"':''}>8</option>	
								<option value="9" ${petpage.age == '9'?'selected="selected"':''}>9</option>	
								<option value="10" ${petpage.age == '10'?'selected="selected"':''}>10</option>	
								<option value="11" ${petpage.age == '11'?'selected="selected"':''}>11</option>	
								<option value="12" ${petpage.age == '12'?'selected="selected"':''}>12</option>	
								<option value="13" ${petpage.age == '13'?'selected="selected"':''}>13</option>	
								<option value="14" ${petpage.age == '14'?'selected="selected"':''}>14</option>	
								<option value="15" ${petpage.age == '15'?'selected="selected"':''}>15</option>
								<option value="16" ${petpage.age == '16'?'selected="selected"':''}>16</option>	
								<option value="17" ${petpage.age == '17'?'selected="selected"':''}>17</option>	
								<option value="18" ${petpage.age == '18'?'selected="selected"':''}>18</option>	
								<option value="19" ${petpage.age == '19'?'selected="selected"':''}>19</option>	
								<option value="20" ${petpage.age == '20'?'selected="selected"':''}>20</option>
							</select>
				
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
