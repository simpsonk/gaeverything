

	//most reviewed 
	function mostReviewed(){
		$.ajax({
			url 	 : "/mostReviewed",
			dataType : "json", 
			type	 : 'post',
			success  : function(hList){
				makeMostReviewdList(hList);
				nearbySlide();
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	function nearbySlide(){
		$('.sim').slick({
			infinite: true,
			slidesToShow: 3,
			slidesToScroll: 3,
			});
	}	
	
	
	
	function makeMostReviewdList(hList){
		var ele = document.getElementById("mostReviewed");
		var fragment = document.createDocumentFragment();
		for(var i=0; i<5; i++){
			var itemEle = document.createElement("div");
			var item = "";
						if(hList[i].category == 'HP8'){
							item = 	'	<a href="/map/detail/viewDetailPage?locationSeq='+hList[i].no+'" class="listing-item-container">'+
							  		'		<div class="listing-item">';
						}else{
							item = 	'	<a href="/event/detail/view?no='+hList[i].no+'" class="listing-item-container">'+
							   		'		<div class="listing-item">';
						}

					   if(hList[i].image== null && hList[i].category == "HP8"){
						   item +='	<img src="/resources/images/hospital.jpg" alt="">';
					   }else if(hList[i].image == null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/dogevent.jpg" alt="">';
					   }else if(hList[i].image != null && hList[i].category == "HP8"){
						   item +='	<img src="'+hList[i].image+'" alt="">';
					   }else if(hList[i].image != null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/event/'+hList[i].image+'" alt="">';
					   }
					   
					   item +=
							'<div class="listing-item-details">'+
							'	<ul>'+
							'		<li><h1><strong>'+hList[i].totalReview+'</strong></h1> reviews</li>'+
							'	</ul>'+
							'</div>'+
					 		'<div class="listing-item-content">';
					   if(hList[i].category == 'HP8'){
						   item +=	 '<span class="tag" style="background: #f91942;">Hospital</span>';
					   }else if(hList[i].category == 'event1'){
						   item +=	 '<span class="tag" style="background: #f91942;">Event</span>';
					   }
					   item +=
					   '		<h3>'+hList[i].title+'</h3>'	+
					   '		<span>'+hList[i].address+'</span>'+
					   '	</div>'+
					   '	<span class="like-icon"></span>'+
					   '</div>'+
					   '<div class="star-rating" data-rating="'+hList[i].avgRating+'">'+
					   '	<div class="rating-counter"> 평균 '+ hList[i].avgRating+' 점</div>'+
					   '</div>'+
					   '</a>';
			itemEle.innerHTML = item;
			itemEle.className = 'carousel-item';
			fragment.appendChild(itemEle);
		}
		ele.appendChild(fragment);
		starRating('.star-rating');
		return ele;	   
	}
		
	//most rated
	function mostRated(){
		$.ajax({
			url 	 : "/mostRated",
			dataType : "json", 
			type	 : 'post',
			success  : function(hList){
				makeMostRatedList(hList);
				nearbySlide2();
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	function makeMostRatedList(hList){
		var ele = document.getElementById("mostRated");
		var fragment = document.createDocumentFragment();
		for(var i=0; i<5; i++){
			var itemEle = document.createElement("div");
			var item = "";
			
						if(hList[i].category == 'HP8'){
							item = 	'	<a href="/map/detail/viewDetailPage?locationSeq='+hList[i].no+'" class="listing-item-container compact">'+
							  		'		<div class="listing-item">';
						}else{
							item = 	'	<a href="/event/detail/view?no='+hList[i].no+'" class="listing-item-container compact">'+
							   		'		<div class="listing-item">';
						}
						
					 	if(hList[i].image== null && hList[i].category == "HP8"){
						  	 item +='	<img src="/resources/images/hospital.jpg" alt="">';
					 	}else if(hList[i].image == null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/dogevent.jpg" alt="">';
					  	}else if(hList[i].image != null && hList[i].category == "HP8"){
						   item +='	<img src="'+hList[i].image+'" alt="">';
					  	}else if(hList[i].image != null && hList[i].category == "event1"){
						   item +='	<img src="/resources/images/event/'+hList[i].image+'" alt="">';
					 	}
						
					 	item += '<div class="listing-item-content">'+
					 			'<div class="star-rating" data-rating="'+hList[i].avgRating+'">'+
					 			'<div class="numerical-rating" data-rating="'+hList[i].avgRating+'"></div></div>'+
					 			'	<h3>'+hList[i].title+'</h3>'+
								'	<span>'+hList[i].address+'</span>'+
								'</div>'+
								'<span class="like-icon"></span>'+
								'</div>'+
								'</a>'+
								'</div>';
				itemEle.className = 'carousel-item';
				itemEle.style = 'padding-top: 10px;padding-bottom: 10px;padding-left: 15px;padding-right: 15px';
				itemEle.innerHTML = item;
				fragment.appendChild(itemEle);
			}
			ele.appendChild(fragment);
			numericalRating('.numerical-rating');
			starRating('.star-rating');
			return ele;	 	
	}
	
	//newest reviews
	function newestReview(){
		$.ajax({
			url 	 : "/newestReview",
			dataType : "json", 
			type	 : 'post',
			success  : function(list){
				makeNewestReviewList(list);
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	function makeNewestReviewList(list){
		var ele = document.getElementById("reviews");
		var fragment = document.createDocumentFragment();
		for(var i=0; i<3; i++){
			var itemEle = document.createElement("div");
			var item = '<a href="/review/readPost/'+list[i].boardNo+'" class="blog-compact-item-container">'+
					   '	<div class="blog-compact-item">';
					   if(list[i].uploadImg != null){
						   item += '	<img src="/resources/upload/'+list[i].uploadImg+'" alt="">';
					   }else{
						   item += '	<img src="/resources/images/walkthedog.jpg" alt="">';
					   }
			
						if(list[i].boardCategory == 'CARE'){
							item +=	'		<span class="blog-item-tag">Care</span>';
						}else{
							item +=	'		<span class="blog-item-tag">Event</span>';	
						}
					   item +=	
					   '		<div class="blog-compact-item-content">'+
					   '			<ul class="blog-post-tags">'+
					   '				<li>'+list[i].regiDate+'</li>'+
					   '			</ul>'+
					   '			<h3>'+list[i].title+'</h3>'+
					   '			<div class="preview_box"><p>'+list[i].onlyText+'</p></div>'+
					   '		</div>'+
					   '	</div>'+
					   '</a>'+
					   '</div>';
			itemEle.className = 'col-md-4';
			itemEle.innerHTML = item;
			fragment.appendChild(itemEle);
		}
		ele.appendChild(fragment);
		return ele;
	
	}
	
	//most bookmarked
	function mostBookmarked(){
		$.ajax({
			url 	 : "/mostReviewed",
			dataType : "json", 
			type	 : 'post',
			success  : function(data){
				
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "message:"+ request.responseText + "\n" + "error:"+ error);
			}
		});
	}
	
	function nearbySlide2(){
		$('.mostRated').slick({
			infinite: true,
			slidesToShow: 3,
			slidesToScroll: 3,

			});
	}	
	