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
<style type="text/css">
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 2px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
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
			<input type="hidden" id = "memberEmail" value = "${member.email}">
			<!-- Search -->
			<section class="search">
				<div class="row">
					<div class="col-fs-12">
						<div class="row with-forms">
							<div class="col-fs-3">	
								<select  class="chosen-select" name="searchOption" onchange="changeAction()">
									<option value="2"  selected="selected" ${option==2?'selected="selected"':''}>Location</option>
									<option value="1" ${option==1?'selected="selected"':''}>Shop name</option>
								</select>
							</div>
							<div class="col-fs-6">
								<div class="input-with-icon">
									<i class="sl sl-icon-magnifier"></i>
									<input type="text" placeholder="What are you looking for?" value="${word}" id="seachword">
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
						<input id="check-1" type="checkbox" name="check" checked="checked" value="HP8">
						<label for="check-1">Hospital</label>

						<!-- <input id="check-2" type="checkbox" name="check" value="HP8">
						<label for="check-2">Hotels</label> -->
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
               <div class="copyrights margin-top-0">© 2017 gaeverything. All Rights Reserved.</div>

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
<script type="text/javascript" src="<c:url value = '/resources/scripts/maps-eventhandler.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/maps-itemlist.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/maps-marker.js'/>"></script>

<%-- <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/infobox.min.js'/>"></script>
<script type="text/javascript" src="<c:url value = '/resources/scripts/markerclusterer.js'/>"></script>
 --%>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ebfbfbd7a5ec71c10c63936dd90beb22&libraries=clusterer"></script>
<script>
	var overlay=new daum.maps.CustomOverlay();
	var searchCount = 0;
	var searchWord="";
	var latitude = 37.4946444;
	var longitude = 127.02759279999998;
	var option=0;
	var locData=[];
	var markers = [];//지도 마커
	var listPage = 0;
	var currentMarker;

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = { 
		center: new daum.maps.LatLng(37.4946444, 127.02759279999998), // 지도의 중심좌표
		level: 4 // 지도의 확대 레벨
	};
	
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

     var clusterer = new daum.maps.MarkerClusterer({
        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
        minLevel: 6 // 클러스터 할 최소 지도 레벨 
    });

	
	//현재 위치에 따라 마커를 생성한다.
	
	$(document).ready(function() {
		currentPostionSet();
		option = $("select[name=searchOption]").val();
		
		$("#search").click(function() {
			if(option==2){
				searchLocation("location", 0);
			}else if(option==1){
				searchShopname();
			}
		});
	});
	
	function currentPostionSet() {
		  if (!navigator.geolocation){
		  	alert('현재 위치를 확인할 수 없습니다.');
		  }
		  function success(position) {
			    latitude  = position.coords.latitude;
			    longitude = position.coords.longitude;
				searchWord = document.getElementById('seachword').value;
				var categories = "";
				$('input[name="check"]:checked').each(function() {
					categories+= $(this).val()+",";
				 });

			 // 마커가 표시될 위치입니다 
			    var markerPosition  = new daum.maps.LatLng(latitude, longitude); 
				
			    // 마커를 생성합니다
			    currentMarker = new daum.maps.Marker({
			        position: markerPosition
			    });
			    map.setCenter(new daum.maps.LatLng(latitude, longitude));
			    
			    var level = 4;
			    map.setLevel(level);
			    
				url = '/map/getSearchLocationData?searchWord='+searchWord+'&level='+level+'&lat='+latitude+'&lon='+longitude+'&categories='+categories;
				
				$.ajax({
					url : url,
					dataType : 'json',
					type:"POST",
					success : function(data) {
						locData = data.places;
						var length = data.places.length;
						var result = length+' Results Found';
						$('#resultCount').text(result);
						displayPlaces(data.places);
						displayInfoList(data.pList, data.infoList, 5, 0);
						currnetMarkerSet();
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
		}
	
	function changeAction(){
		option = $("select[name=searchOption]").val();	
		if(option==2){
			currentPostionSet();
		}
	}
	
	function searchShopname(){
		searchWord = document.getElementById('seachword').value;
		listPage = 0;
		var categories = "";
		
	    currentMarker.setMap(null);
	    
		$('input[name="check"]:checked').each(function() {
			categories+= $(this).val()+",";
		 });
		
		var level = map.getLevel();
		if(searchWord===""){
			alert("검색어를 입력하세요!");
			return;
		}
		url = '/map/getSearchShopNameData?searchWord='+searchWord+'&level='+level+'&lat='+latitude+'&lon='+longitude+'&categories='+categories;
		
		$.ajax({
			url : url,
			dataType : 'json',
			type:"POST",
			success : function(data) {
					locData = data.places;
				var length = data.places.length;
				var result = length+' Results Found';
				$('#resultCount').text(result);
				displaySearhPlaces(data.places);
				displayInfoList(data.pList, data.infoList, 5, listPage);
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
	}
	
	function searchLocation(type, page){
		searchWord = document.getElementById('seachword').value;
	
		option = $("select[name=searchOption]").val();
		var categories = "";

		$('input[name="check"]:checked').each(function() {
			categories+= $(this).val()+",";
		 });
		
		var level = map.getLevel();
		
		if(level<4){
		    map.setLevel(4);
		}
		
		if(!(type =='like')){
			var loc = map.getCenter();	
			latitude = loc.getLat();
			longitude = loc.getLng();
		}
	
		url = '/map/getSearchLocationData?searchWord='+searchWord+'&level='+level+'&lat='+latitude+'&lon='+longitude+"&option="+option+'&categories='+categories+'&page='+page;
		$.ajax({
			url : url,
			dataType : 'json',
			type:"POST",
			success : function(data) {
				locData = data.places;
				var length = data.places.length;
				var result = length+' Results Found';
				$('#resultCount').text(result);
				displayPlaces(data.places);
				displayInfoList(data.pList, data.infoList, 5, page);
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
	
	function like_clicked(locationSeq){
		var ele = document.getElementById("like"+locationSeq);
		var class_name = ele.className;
		var email = document.getElementById("memberEmail").value;
		var url = '/review/updateDetailPageLike?like='+class_name+'&locationSeq='+locationSeq+'&email='+email;
		/*var id = document.getElementById("numOflike");*/
		$.ajax({
	        url : url,
	        dataType : 'json',
	        type:"POST",
	        success : function(data) {
	        	/*id.innerHTML=data+' people bookmarked this place'; */
	        	if($("select[name=searchOption]").val()==2){
	        		searchLocation('like', listPage);
	        	}else{
	        		searchShopname();
	        	}
	        },
	        error : function(request, status, error) {
	            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
	     });
	}
	
	function no_login_like(locationSeq){
		alert("로그인을 해주세요!");
		location.href = "/viewLogin?uri=/map/viewMapList";
	}	
	
	
	function pageClickEvent(page){
		url = '/map/getPagingData?page='+page;
		listPage = page;
		var stringLocData = JSON.stringify(locData);
  		$.ajax({
			url : url,
			data: {"data":stringLocData},
			type:"POST",
			dataType:"json",
			success : function(data) {
				locData = data.places;
				displayInfoList(data.pList, data.infoList, 5, listPage);
			},
			error : function(request, status, error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
		});
	}
	
</script>
</body>
</html>