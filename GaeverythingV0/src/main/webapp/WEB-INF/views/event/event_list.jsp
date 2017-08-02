<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>gaverything</title>
<style type="text/css">
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

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
		<header id="header-container" class="fixed fullwidth"> <%@include
			file="../header.jsp"%> </header>
		<div class="clearfix"></div>
		<!-- Header Container / End -->


		<!-- Content
================================================== -->
		<div class="fs-container">
			<div class="fs-inner-container content">
				<div class="fs-content">
					<!-- Search -->
					<section class="search">
					<div class="row">
						<div class="col-md-12">

							<!-- Row With Forms -->
							<div class="row with-forms">

								<!-- Main Search Input -->
								<div class="col-fs-3">
									<select class="chosen-select" name="searchOption" id="searchOption">
										<option value="1" selected="selected" ${option==1?'selected="selected"':''}>Title</option>
										<option value="2" ${option==2?'selected="selected"':''}>Location</option>
									</select>
								</div>

								<!-- Main Search Input -->
								<div class="col-fs-6">															
									<div class="input-with-icon">
										<i class="sl sl-icon-magnifier"></i>
										 <input type="text" placeholder="What are you looking for?" value="" id="searchStr"/>
									</div>
								</div>	
								<div class="col-fs-3" style="text-align:center">
									<button class="button" id = "search"  style="margin: auto; width: 130px;" >search</button>			
								</div>
							</div>
						</div>
					</div>	
					<div class="col-fs-12">
						<div class="panel-dropdown-content checkboxes categories" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
							<span style="padding-right: 10px;">Categories : </span>  
							<input id="check-1" type="checkbox" name="check" checked="checked" value="5 449 776">
							<label for="check-1">Fair</label>
	
							<input id="check-2" type="checkbox" name="check">
							<label for="check-2">Festival</label>
						</div>
					</div>
					</section>
					<!-- Search / End -->

					<section class="listings-container margin-top-30" id="menu_wrap">
					<!-- Sorting / Layout Switcher -->
					<div class="row fs-switcher">

						<div class="col-md-6">
							<!-- Showing Results -->
							<p class="showing-results" id="ResultsFound"></p>
						</div>
					</div>

					<!-- Listings(ul) -->
					<div class="row fs-listings" id="eventList">
						<!-- Listing Item -->
						<!-- Listing Item / End -->
					</div>
					<!-- Listings Container / End --> <!-- Pagination Container -->
					<div class="row fs-listings">
						<div class="col-md-12">

							<!-- Pagination -->
							<div class="clearfix"></div>
							<div class="row">
								<div class="col-md-12">
									<!-- Pagination -->
									<div
										class="pagination-container margin-top-15 margin-bottom-40">
										<nav class="pagination">
										<ul id="pagination">
										</ul>
										</nav>
									</div>
								</div>
							</div>
							<div class="clearfix"></div>
							<!-- Pagination / End -->

							<!-- Copyrights -->
							<div class="copyrights margin-top-0">© 2017 gaeverything. All
								Rights Reserved.</div>

						</div>
					</div>
					<!-- Pagination Container / End --> </section>

				</div>
			</div>
			<div class="fs-inner-container map-fixed">

				<!-- Map -->
				<div id="map-container">
					<div id="map" data-map-zoom="9" data-map-scroll="true">
						<!-- map goes here -->
					</div>
				</div>

			</div>
		</div>


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
	<script type="text/javascript" src="<c:url value = '/resources/scripts/infobox.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value = '/resources/scripts/maps1.js'/>"></script>

	<!-- Maps -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebfbfbd7a5ec71c10c63936dd90beb22&libraries=clusterer"></script>
	
	<script>

	
	//1. 기본 지도 보이기
	var container = document.getElementById("map"), //지도띄울 div
	options = {
		center : new daum.maps.LatLng(37.6646797, 126.7421222), //지도 시작 시 좌표
		level : 12
	//확대, 축소정도
	};
	var map = new daum.maps.Map(container, options);
	/////////////////////////////////////////////////////////////////

	var markers = [];
	var markerPostions = [];
	var overlays = [];
	var eventData = [];
	var points = [];
	
	$(document).ready(
			function() {
				$.ajax({
					url		 : "/event/getAllEvents",
					dataType : "json",
					type 	 : 'post',
					success  : function(data) {
						eventData = data.events; //전체이벤트리스트
						//data : 맵형식 -> 이벤트리스트, 페이징리스트, 
						var numOfData = data.events.length ;
						var foundResult = numOfData + ' Results Found';
						$('#ResultsFound').text(foundResult);
						eventList(data);
						setMarkers(map);
						alert(markers.length);
					},
					error : function(request, status, error) {
						alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
					}
				});
			});

	
	function pageClickEvent(page) {
		var stringEventData = JSON.stringify(eventData);
		$.ajax({
			url 	 : "/event/getPagingData?page="+page,
			data	 : {"data": stringEventData},
			type 	 : 'post',
			dataType : "json",
			success  : function(data) {
			//	eventData = data.events; 
				eventList(data);
				setMarkers(map);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	$(document).ready(function(){
		$('#search').click(function(){
			//서치버튼을 클릭하면
			var searchStr = $('#searchStr').val();
			//스트링밸류와
			var opt = $('select[name="searchOption"]').val();
			//선택옵션 밸류를 받아서
			$.ajax({
				url  	 : "/event/searchEvent?opt="+opt+"&str="+searchStr, //쿼리스트링으로 보내줌 
				dataType : 'json',
				type	 : 'POST',
				success  : function(data){
					//검색결과: events, 페이징: pList, 페이지당 리스트: infoList
					clearMarkers(); //첫 화면시 불러왔던 모든 마커들을 제거 -> 검색결과 마커만 보여줄것이므로
					changeBound(data.events);
					eventData = data.events; 
					eventList(data);
					setMarkers(map);
					var numOfData = data.events.length ;
					var foundResult = numOfData + ' Results Found';
					$('#ResultsFound').text(foundResult);
					//지도 내 마커가 해당 결과마커만 남기게
					//지도표시 레벨 변경
					
				}
			});
			
		});
	});
		
	function changeBound(events){
		var bounds = new daum.maps.LatLngBounds();
		// LatLngBounds 객체에 좌표를 추가
		for(var i=0; i<events.length; i++){
			bounds.extend(new daum.maps.LatLng(events[i].latitude, events[i].longtitude));
		}
		setBounds(bounds);	
	}

	///*****
	function eventList(data) {
		displayEvent(data.pList, data.infoList, data.events);
	}

	function displayEvent(pList, infoList, events) {
		
		var level = map.getLevel();
		alert(level); 
		
		var listEl = document.getElementById("eventList"), 
			menuEl = document.getElementById("menu-wrap"), 
			fragment = document.createDocumentFragment();
		
		var pageList = document.getElementById("pagination");
			pageList.innerHTML = pList;
			
			removeAllChildNods(listEl);
	
		for(var i=0; i<events.length; i++){
			createOverlay(events[i], i, new daum.maps.LatLng(events[i].latitude, events[i].longitude));
		}	
			
		for (var i=0; i<infoList.length; i++) {
			//리스트보여줄 태그
			/* alert(data[0].latitude);w
			alert(data[0].longitude); */
			//var placePosition = new daum.maps.LatLng(infoList[i].latitude, infoList[i].longitude),
			
			itemEl = eventItems(infoList[i]); //좌측 리스트 한덩어리

			//var itemOverlay = 
			(function(overlay){
				itemEl.onmouseover = function() {
					setOverlay(overlay); 			
					clearStarRating('.star-rating');
					starRating('.star-rating');
				};
				 itemEl.onmouseout = function() {
					clearOverlay(overlay); 			
				}; 
			})(overlays[i]);

			fragment.appendChild(itemEl);
			
		}//for 

		listEl.appendChild(fragment);
		starRating('.star-rating');
		
		
		
	}
	

	//좌측리스트
	function eventItems(event) {
		var el = document.createElement("div");
		var itemStr = '<a href="/event/detail" class="listing-item-container" data-marker-id="1">'
				+ '		<div class="listing-item">'
				+ '			<img src="/resources/images/event/'+event.thumbnail+'" alt="">'
				+
				//'			<div class="listing-badge now-open">Now Open</div>' + 
				'			<div class="listing-item-content">'
				+ '				<span class="tag">Fair</span>' 
				+ '				<h3>'+ event.eventName + '</h3><br>'
				+ '				<span><i class="fa fa-map-marker"></i>  '+ event.address+ '</span><br>'
				+ '				<span><i class="fa fa-calendar-check-o"></i>  '+ event.startDate+ '  ~  '+ event.endDate	+ '</span><br>'
				+ '				<span><i class="fa fa-dollar"></i>  '+ event.fee+ '   <i class="fa fa-check"></i>  '+ event.discountInfo+ '</span>'
				+ '			</div>'
				+ '			<span class="like-icon"></span>	'
				+ '		</div>'
				+ '		<div class="star-rating" data-rating="3.5">'
				+ '		</div>(12 reviews)' 
				+ '	   </a>';
		el.innerHTML = itemStr;
		el.className = 'col-lg-6 col-md-12';
		return el;
	}
	
	//이미지크기에따라 오버레이 크기 달라짐!!!!!
	function createOverlay(event, idx, placePosition) {
		var contentStr =
		'<div class="infoBox" style="width: 270px; transform: translateZ(0px); position: absolute; visibility: visible; left: 284.75px; bottom: -185.3px; cursor: default;">' + 
        '    <div class="map-box">' + 
        '      <a href="#" class="listing-img-container">'+
        '         <div class="infoBox-close" onclick="closeOverlay('+ idx+ ')" ><i class="fa fa-times"></i></div>'+
        '         <img src="/resources/images/event/'+event.thumbnail+'" style="object-fit:cover; height:100%" alt="">'+
        '         <div class="listing-item-content">'+
        '            <h3>'+event.eventName+'</h3>'+
        '            <span>'+event.address+'</span>'+
        '         </div>'+
        '      </a>'+
        '      <div class="listing-content">   '+
        '         <div class="listing-title">'+
        '            <div class="star-rating" data-rating="3.5">'+
        '      		</div>46 Review'+
        '   </div>'+
        '</div>';

    	
		//2)오버레이 찍을 위치
		var overlayPosition = placePosition;
		
		//3) 오버레이 생성
		var overlay = new daum.maps.CustomOverlay({
			content : contentStr, //보여줄 내용 
			position : overlayPosition
		});
		//4)만든 오버레이 배열에 추가
		overlays.push(overlay);
		//5) 마커에 오버레이 표시
		createMarker(overlayPosition, overlay);
		
		return overlay;
	}

	function closeOverlay(index){
		 clearOverlay(overlays[index]);
	}  

	function createMarker(placePosition, overlay) {
		
		var markerPostion = placePosition;
		markerPostions.push(markerPostion);
		//2) 마커이미지 셋팅
		var imgSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', 
			imgSize = new daum.maps.Size(24, 36), 
			imgOption = {offset : new daum.maps.Point(27, 69)
		};
		//3) 마커이미지 셋팅값 넣어주기
		var markerImg = new daum.maps.MarkerImage(imgSrc, imgSize,imgOption);
		//4) 마커만들기(이미지, 위치)
		var marker = new daum.maps.Marker({
			position : markerPostion,
			image : markerImg
		});
		
	
		
		
		//5)마커+오버레이에 클릭이벤트 등록
		markerClick(marker, overlay);
		//6)만든 마커를 배열에 추가
		markers.push(marker);
	}

	//마커 이벤트 리스너
	function markerClick(marker, overlay) {
		daum.maps.event.addListener(marker, 'click', function() {
			overlay.setMap(map);
			clearStarRating('.star-rating');
			starRating('.star-rating');
		}); 
	}

	///*****
	// 배열에 추가된 마커들을 지도에 표시
	function setMarkers(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);	
		}
	}
	
	function setBounds(bounds){
		map.setBounds(bounds);
	}
	
	function clearMarkers(){
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
		markerPostions = [];
	} 

	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
	
	function setOverlay(overlay){
    	overlay.setMap(map);
    }
	
	function clearOverlay(overlay){
    	overlay.setMap(null);
    }

	/* function displayPagination(data){
		
	} */


	 
	</script>
	
</body>
</html>