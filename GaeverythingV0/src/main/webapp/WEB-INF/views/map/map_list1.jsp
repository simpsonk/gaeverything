<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
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
<header id="header-container" class="fixed fullwidth">
<%@include file = "../header.jsp" %>
</header>
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
					<div class="col-fs-12">
						<div class="row with-forms">
							<div class="col-fs-3">	
								<select data-placeholder="Option" class="chosen-select" name="searchOption">
									<option value="0" selected="selected">Option</option>
									<option value="1">shop name</option>
									<option value="2">location</option>
								</select>
							</div>
							<div class="col-fs-6">
								<div class="input-with-icon">
									<i class="sl sl-icon-magnifier"></i>
									<input type="text" placeholder="What are you looking for?" value=""/ id="seachword">
								</div>
							</div>
							<div class="col-fs-3" style="text-align:center">
								<button class="button" id = "search"  style="margin: auto; width: 130px;">search</button>			
							</div>
						</div>
					</div>					
				</div>
				<div class="col-fs-12">
					<div class="panel-dropdown-content checkboxes categories" style="padding-top: 0px; padding-bottom: 0px; padding-left: 0px;">
						<span style="padding-right: 10px;">Categories : </span>  
						<input id="check-1" type="checkbox" name="check" checked="checked" value="5 449 776">
						<label for="check-1">Hospital</label>

						<input id="check-2" type="checkbox" name="check">
						<label for="check-2">Hotels</label>
					</div>
				</div>
			</section>		 
 		<!-- Search / End -->
		
			

		<section class="listings-container margin-top-30" id = "menu_wrap">
			<!-- Sorting / Layout Switcher -->
			<div class="row fs-switcher">
				<div class="col-md-6" >
					<!-- Showing Results -->
					<p class="showing-results" id = "resultCount"></p>
				</div>
			</div>


			<!-- Listings -->
			<div class="row fs-listings" id = "placesList">
				
			</div>
			<!-- Listings Container / End -->


			<!-- Pagination Container -->
			<div class="row fs-listings">
				<div class="col-md-12">

					<!-- Pagination -->
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12">
							<!-- Pagination -->
							<div class="pagination-container margin-top-15 margin-bottom-40">
								<nav class="pagination">
									<ul id = "pageList">
									</ul>
								</nav>
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- Pagination / End -->
					
					<!-- Copyrights -->
					<div class="copyrights margin-top-0">© 2017 Listeo. All Rights Reserved.</div>

				</div>
			</div>
			<!-- Pagination Container / End -->
		</section>

		</div>
	</div>
	<div class="fs-inner-container map-fixed">

		<!-- Map -->
		<div id="map-container">
	    	<div id="map" style="width: 100%; overflow: hidden;">
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

<!-- Maps -->
<%-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/infobox.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/markerclusterer.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/maps.js'/>"></script> --%>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=fa1e9654d15cae4c8c5f39d8b36f7984&libraries=clusterer"></script>
<script>
	var markers = [];//지도 마커
	var searchCount = 0;
	var searchWord="";
	var latitude;
	var longitude;
	var option=0;
	var locData=[];

	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = { 
		center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨
	};
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
	
	// 마커 클러스터러를 생성합니다 
    var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 6 // 클러스터 할 최소 지도 레벨 
    });
	
	function pageClickEvent(page){
		url = '/map/getPagingData?page='+page;
		var stringLocData = JSON.stringify(locData);		
  		$.ajax({
			url : url,
			data: {"data":stringLocData},
			type:"POST",
			dataType:"json",
			success : function(data) {
				locData = data.places;
				var length = data.places.length;
				var result = length+' Results Found';
				$('#resultCount').text(result);
				displayPlaces(data.places, data.pList, data.infoList); 	 
				
				clusterer.clear();
				clusterer.addMarkers(markers);
			},
			error : function(request, status, error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
		});
	}
	
	(function() {
		  if (!navigator.geolocation){
		  	alert('현재 위치를 확인할 수 없습니다.');
		  }
		  function success(position) {
			    latitude  = position.coords.latitude;
			    longitude = position.coords.longitude;
			    
			 // 마커가 표시될 위치입니다 
			    var markerPosition  = new daum.maps.LatLng(latitude, longitude); 

			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        position: markerPosition
			    });
			    map.setCenter(new daum.maps.LatLng(latitude, longitude));
			    marker.setMap(map);
			    var level = map.getLevel();
				url = '/map/getLocationData?level='+level+'&lat='+latitude+'&lon='+longitude;
				
				$.ajax({
					url : url,
					dataType : 'json',
					type:"POST",
					success : function(data) {
						locData = data.places;
						var length = data.places.length;
						var result = length+' Results Found';
						$('#resultCount').text(result);
						displayPlaces(data.places, data.pList, data.infoList);
						
						clusterer.clear();
						clusterer.addMarkers(markers);

					},
					error : function(request, status, error) {
						 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		           }
				});
				//이전 이벤트 삭제
				if(searchCount!=0){
					wheelEventRemove();
					moveEventRemove();	
				}
				//이전 이벤트 등록
				wheelEventAdd();
				moveEventAdd();
				searchCount++;
		  }
		  navigator.geolocation.getCurrentPosition(success);
	})();
	
	
	$(document).ready(function() {
		$("#search").click(function() {
			
			searchWord = document.getElementById('seachword').value;

			option = $("select[name=searchOption]").val();
			
			var level = map.getLevel();
			url = '/map/getLocationData?searchWord='+searchWord+'&categories=5 449 776'+'&level='+level+'&lat='+latitude+'&lon='+longitude+"&option="+option;
			
			$.ajax({
				url : url,
				dataType : 'json',
				type:"POST",
				success : function(data) {
					locData = data.places;
					var length = data.places.length;
					var result = length+' Results Found';
					$('#resultCount').text(result);
					displayPlaces(data.places, data.pList, data.infoList); 	 																
				},
				error : function(request, status, error) {
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	           }
			});
			//이전 이벤트 삭제
			if(searchCount!=0){
				wheelEventRemove();
				moveEventRemove();	
			}
			//이전 이벤트 등록
			wheelEventAdd();
			moveEventAdd();
			searchCount++;
			
		});
	});
	
	function displayPlaces(places, plist, infoList) {
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(),
	    pageList = document.getElementById('pageList'), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    var itemEl;
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	    
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();

	    
	    //페이징 리스트 만들기
	    for(var i=0;i<infoList.length;i++){
	    	// 검색 결과 항목 Element를 생성합니다
		    itemEl = getListItem(i, infoList[i]);
		 	// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		    fragment.appendChild(itemEl);
	    }
	    
	    //지도에 마커표시하기
	    for ( var i=0; i<places.length; i++ ) {
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i); 
/* 	            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
 */				
		       // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		       // LatLngBounds 객체에 좌표를 추가합니다
		       /* bounds.extend(placePosition); */


	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            daum.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	            });

	            daum.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            /* itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	            };

	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            }; */
	        })(marker, places[i].title);
		    //fragment.appendChild(itemEl);
	    }

 	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	    pageList.innerHTML = plist;
		
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
/* 	    map.setBounds(bounds);
 */
	}
	
	function getListItem(index, places) {
	    var el = document.createElement('div'),
	    itemStr ='<div class="listing-item-container list-layout" data-marker-id="1">'+
	  			   	'<a href="#" class="listing-item">';
	  			   	if(places.imageUrl){
		  			   	itemStr +=	'<div class="listing-item-image">'+
					  			    	'<img src="'+places.imageUrl+'" alt="">'+
					  			    	'<span class="tag">Hospital</span>'+
				  			    	'</div>';
	  			   	}else {
		  			  	itemStr +=	'<div class="listing-item-image">'+
	  			    					'<img src="/resources/images/hospital.jpg" alt="">'+
	  			    					'<span class="tag">Hospital</span>'+
				    				'</div>';		
		  			   	}
	  			  	itemStr +=	'<div class="listing-item-content">'+
				  			    	'<div class="listing-item-inner">'+
				  			    		'<h3>'+places.title+'</h3>'+
				  			    		'<span>'+places.address+' ('+places.radius+'km)</span>'+
				  			    		'<div class="star-rating" data-rating="3.5">'+
				  			    			'<div class="rating-counter">(12 reviews)</div>'+
				  			    		'</div>'+
				  			    	'</div>'+
				  			    	'<span class="like-icon"></span>'+
				  			    '</div>'+
				  			'</a>'+
				  		'</div>';
  		el.innerHTML = itemStr;
  		el.className = 'col-lg-12 col-md-12';
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(24, 36),  // 마커 이미지의 크기
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}

	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	 
	var wheelHandler = function zoomHandler(){
	    // 지도의 현재 레벨을 얻어옵니다
	    var eLevel = map.getLevel();
	    var center = map.getCenter(); 
		var lat = center.getLat();
		var lon = center.getLng();
	    var url = '/map/getLocationData?searchWord='+searchWord+'&categories=5 449 776'+'&level='+eLevel+'&lat='+lat+'&lon='+lon+'&option='+option;
	   	$.ajax({
			url : url,
			dataType : 'json',
			type:"POST",
			success : function(data) {
				locData = data.places;
				var length = data.places.length;
				var result = length+' Results Found';
				$('#resultCount').text(result);

				clusterer.clear();
				displayPlaces(data.places, data.pList, data.infoList); 	 																
				clusterer.addMarkers(markers);
			},
			error : function(request, status, error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
		});
	};
	
	function wheelEventAdd(){
		daum.maps.event.addListener(map, 'zoom_changed', wheelHandler);
	}
	
	function wheelEventRemove(){
		daum.maps.event.removeListener(map, 'zoom_changed', wheelHandler);
	}
	
	function moveEventAdd(){
		daum.maps.event.addListener(map, 'dragend', wheelHandler);
	}
	
	function moveEventRemove(){
		daum.maps.event.removeListener(map, 'dragend', wheelHandler);
	}
	
	
	
</script>
</body>
</html>
