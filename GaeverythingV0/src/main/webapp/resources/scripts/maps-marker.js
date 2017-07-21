	var markers = [];//지도 마커

	function displayPlaces(places) {
		
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    closeOverlay();
	    
	    var url = '/map/detail/viewDetailPage?locationSeq=';
	    //지도에 마커표시하기
	    for ( var i=0; i<places.length; i++ ) {
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	            marker = addMarker(placePosition, i); 
	        
	        var detailUrl = url+places[i].locationSeq; //마커에 상세정보 클릭시 이동할 Url

	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title, imageUrl, address, detailUrl, radius) {
	            daum.maps.event.addListener(marker, 'click', function() {
	            	setOverlay(map, makeContent(title, imageUrl, address, url+places.locationSeq, radius), marker.getPosition());
	            });
	        })(marker, places[i].title, places[i].imageUrl, places[i].address, url+places[i].locationSeq , places[i].radius);
	    }
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

	
	
	function customOverlayContent(locationURL,locationImg,locationTitle, locationAddress, radius, locationRating, locationRatingCounter) {
       /* var content = '<div class="wrap">' + 
			        '	<div class="info">' + 
			        '       <div class="title">'+ locationTitle+ 
			        '       <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			        '	</div>' + 
			        '	<div class="body">' + 
			        '		<div class="img">';
        if(locationImg){
        	content +=  '		<img src="'+locationImg+'" width="73" height="70">';
        }else{
        	content +=  '		<img src="/resources/images/hospital.jpg" width="73" height="70">';
        }
        	content +=  '	</div>' + 
			        '       <div class="desc">' + 
			        '			<div class="ellipsis">'+locationAddress+'('+radius+'km)</div>' + 
			        '			<div><a href="'+locationURL+'" target="_blank" class="link">상세정보</a></div>' + 
			        '		</div>' + 
			        '		<div class="listing-content">'+
		            '			<div class="listing-title">'+
		            '				<div class="star-rating" data-rating="'+locationRating+'"><div class="rating-counter">('+locationRatingCounter+' reviews)</div></div>'+
		            '			</div>'+
		            '		</div>'+
			        '	</div>' + 
			        '  </div>' +    
			        '</div>'*/;
			        
			        
		return content;
    }
	
    function closeOverlay() {
        overlay.setMap(null);     
    }
    
    function setOverlay(map, content, position){
    	overlay.setContent(content);
    	overlay.setPosition(position);
    	overlay.setMap(map);
    }
    
    function makeContent(title, imageUrl, address, placeUrl, radius){
    	var content = 	'<div class="wrap">' + 
				        '    <div class="info">' + 
				        '        <div class="title">' + title+ 
				        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
				        '        </div>' + 
				        '        <div class="body">' + 
				        '           <div class="img">';
    	if(imageUrl){
    		content+=	'                <img src="'+imageUrl+'" width="73" height="70">';
    	}else {
    		content+=	'                <img src="/resources/images/hospital.jpg" width="73" height="70">';
    	}
    		content+=   '			</div>' + 
				        '           <div class="desc">' + 
				        '				<div class="ellipsis">'+address+'('+radius+'km)</div>' + 
				        '				<div><a href="'+placeUrl+'" target="_blank" class="link">상세정보</a></div>' + 
				        '            </div>' + 
				        '        </div>' + 
				        '    </div>' +    
				        '</div>';
    	return content;
    }
    	            
    
