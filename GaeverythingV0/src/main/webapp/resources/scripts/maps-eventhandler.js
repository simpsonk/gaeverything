	var wheelHandler = function zoomHandler(){
	    // 지도의 현재 레벨을 얻어옵니다
	    var eLevel = map.getLevel();
	    var center = map.getCenter(); 
		var lat = center.getLat();
		var lon = center.getLng();
		var categories = "";
		$('input[name="check"]:checked').each(function() {
			categories+= $(this).val()+",";
		 });
		
		
	    var url = '/map/getSearchLocationData?searchWord='+searchWord+'&categories='+categories+'&level='+eLevel+'&lat='+lat+'&lon='+lon+'&option='+option;
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
				displayPlaces(data.places);
				displayInfoList(data.pList, data.infoList, 0, 5);
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
				displayPlaces(data.places);
				displayInfoList(data.pList, data.infoList, page, 5);

				clusterer.clear();
				clusterer.addMarkers(markers);
			},
			error : function(request, status, error) {
				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
           }
		});
	}