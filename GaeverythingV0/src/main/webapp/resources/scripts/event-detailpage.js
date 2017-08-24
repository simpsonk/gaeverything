var longitude = document.getElementById('longitude').value;
var latitude = document.getElementById('latitude').value;

var mapContainer = document.getElementById('singleListingMap'), // 지도를 표시할 div
	mapOption = { 
		center: new daum.maps.LatLng(latitude, longitude), // 지도의 중심좌표
		level: 3 // 지도의 확대 레벨
	};
var map = new daum.maps.Map(mapContainer, mapOption); 
var markerPosition  = new daum.maps.LatLng(latitude, longitude); 
var marker = new daum.maps.Marker({
	position: markerPosition
});
map.setCenter(new daum.maps.LatLng(latitude, longitude));
marker.setMap(map);

$('#bookNow').on('click',function(){
	var eventNo = document.getElementById("eventNo").value;
	
	var date = document.getElementById("booking-date").value;
	var name = document.getElementById("eventName").value;	
	var address = document.getElementById("eventAddress").value
	checkBooking(eventNo);
	var book = document.getElementById("booking-calendar");
	var url = "/mypage/calendar/addBookingEvent?eventNo="+eventNo+"&startDate="+date+"&name="+name+"&address="+address;
	var isLogin = document.getElementById("isLogin3");
	if(isLogin.value!=''){
		var check = confirm("일정을 캘린더에 등록하시겠습니까?");
		if(check == true){
			alert("일정이 등록되었습니다.");
			book.action = url;
			book.submit();
		}else{
			alert("등록이 취소되었습니다.");
			return;
		}
	}
});

function checkBooking(eventNo){
	var isLogin = document.getElementById("isLogin3");
	if(isLogin.value==''){
		alert("일정등록은 회원만 가능합니다.");
		location.href = "/viewLogin?uri=/map/detail/viewDetailPage?eventNo="+eventNo;
	}
}

//댓글 등록 버튼 클릭시
$('#registComment').click(function(){
	var eventNo = document.getElementById("eventNo").value;
	checkMessage(eventNo);
	var ds = document.getElementById("add-comment");
	var url = "/event/detail/addComment";
	ds.action = url;
	if($("#commMsg").val()!='' && 
			$('input:radio[name="rating"]').is(":checked")){
		ds.submit();
	}else{
		return;
	}			
});

//댓글 수정 버튼 클릭시
$('#modifyComment').click(function(){
	var ds = document.getElementById("add-comment");
	var url = "/event/detail/editComment";
	ds.action = url;
	ds.submit();
});

//댓글  Edit, Delete
function go_url(type, commNo){	
	var commentNo = document.getElementById("commentNo");
	var commMsg = document.getElementById("commMsg");
	var changeMsg = document.getElementById("changeMsg"+commNo);
	var ratingVal = document.getElementById("ratingVal"+commNo);
	var ment = document.getElementById("ment");
	alert(changeMsg.innerHTML);
	if(type==1){		
		commentNo.value = commNo;
		commMsg.innerHTML = changeMsg.innerHTML;
		if(ratingVal.value==0.5){
			$('input:radio[name=rating]:input[value="0.5"]').attr("checked", true);			
		}else if(ratingVal.value==1.0){
			$('input:radio[name=rating]:input[value="1.0"]').attr("checked", true);		
		}else if(ratingVal.value==1.5){
			$('input:radio[name=rating]:input[value="1.5"]').attr("checked", true);		
		}else if(ratingVal.value==2.0){
			$('input:radio[name=rating]:input[value="2.0"]').attr("checked", true);		
		}else if(ratingVal.value==2.5){
			$('input:radio[name=rating]:input[value="2.5"]').attr("checked", true);		
		}else if(ratingVal.value==3.0){
			$('input:radio[name=rating]:input[value="3.0"]').attr("checked", true);		
		}else if(ratingVal.value==3.5){
			$('input:radio[name=rating]:input[value="3.5"]').attr("checked", true);		
		}else if(ratingVal.value==4.0){
			$('input:radio[name=rating]:input[value="4.0"]').attr("checked", true);		
		}else if(ratingVal.value==4.5){
			$('input:radio[name=rating]:input[value="4.5"]').attr("checked", true);		
		}else if(ratingVal.value==5.0){
			$('input:radio[name=rating]:input[value="5.0"]').attr("checked", true);		
		}		
		commMsg.focus();
 		$('#modifyComment').show();
		$('#registComment').hide();
		ment.innerHTML = 'Edit Comment';
	}else if(type==2){
		var ds = document.getElementById("add-comment");
		var url = "/event/detail/deleteComment?commentNo="+commNo;
		ds.action = url;
		ds.submit();
	}
}

function addEventPhoto(){
	var url = "/event/detail/addPhoto";
	addPhoto.action = url;
	addPhoto.submit();
}

function box_clicked(eventNo){
	alert("댓글작성은 회원만 가능합니다.");	
	location.href = "/viewLogin?uri=/event/detail/view?no="+eventNo;
}

function no_login_like(eventNo){
	alert("로그인을 해주세요!");
	var eventNo = document.getElementById("eventNo").value;
	location.href = "/viewLogin?uri=/event/detail/view?no="+eventNo;
}

function like_clicked(){
	var class_name = document.getElementById("like").className;
	var eventNo = document.getElementById("eventNo").value;
	var email = document.getElementById("memberEmail").value;
	var url = '/review/updateEventDetailLike?like='+class_name+'&eventNo='+eventNo+'&email='+email;
	var id = document.getElementById("numOflike");
	
	$.ajax({
        url 	 : url,
        dataType : 'json',
        type	 : "POST",
        success  : function(data) {
        	id.innerHTML = data+' people bookmarked this event.';
        },
        error : function(request, status, error) {
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
          }
     });
}


//등록시 필수항목 체크
function checkMessage(eventNo){
	  var isLogin = document.getElementById("isLogin");
	  if(isLogin.value==''){
		  alert("댓글작성은 회원만 가능합니다.");	
		  location.href = "/viewLogin?uri=/event/detail/view?no="+eventNo;
	  }else{
		  if($('input:radio[name="rating"]').is(":checked")==false){
			  alert('별점을 표시해주세요.');
		  }
		  if($("#commMsg").val()==''){
			  alert('코멘트를 입력해주세요.');
		  }	
	  }
}

$(document).ready(function() {
	var eventNo = document.getElementById("eventNo").value;
	url = '/event/detail/getCmtData?eventNo='+eventNo;
	$.ajax({
		url 	 : url,
		dataType : 'json',
		type	 :"POST",
		success  : function(commentlist) {
			list = commentlist;
			if(commentlist.length<=5){
				displayInfoList(0,commentlist.length,commentlist);
			}else{
				displayInfoList(0,5,commentlist);	
				commentStart = 5;
				commentEnd = commentlist.length>10?10:commentlist.length;
			}
		},
		error : function(request, status, error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	});		
});

function displayInfoList(start,end,commentlist){
    var listEl = document.getElementById('replyList'),
    fragment = document.createDocumentFragment(),
    itemEl; 
	for(var i=start;i<end;i++){
	    itemEl = getListItem(commentlist[i]);
	    fragment.appendChild(itemEl);
	 }    
    listEl.appendChild(fragment);
    clearStarRating('.star');
    starRating('.star');       
} 

var commentStart;
var commentEnd;
 
$('#commentMore').click(function(){
	 displayInfoList(commentStart,commentEnd,list);	
	 if(commentEnd==list.length){
		 $('#commentMore').hide();
	 }	
	 commentStart = commentStart+5;
	 commentEnd = commentEnd+5;
	 commentEnd = commentEnd>list.length?list.length:commentEnd;
});   

function getListItem(reply) {
	    var el = document.createElement('div');
	    var nickname = document.getElementById('isLogin').value;
	    var regi = new Date(reply.regiDate); 
	    regi = regi.getFullYear() + '-' + leadingZeros((regi.getMonth()+1),2) + '-' + leadingZeros(regi.getDate(),2)
	    +' '+leadingZeros(regi.getHours(),2)+':'+leadingZeros(regi.getMinutes(),2)+':'+leadingZeros(regi.getSeconds(),2);
	    var itemStr ='	<input type="hidden" id="ratingVal'+reply.commentNo+'" value="'+reply.rating+'">'+
		  	'<li><div class="avatar" ><img src="/resources/upload/'+reply.photo+'" alt="" style="width:80px; height:80px; object-fit:cover;"/></div>'+
		'<div class="comment-content"><div class="arrow-comment"></div>'+
			'<div class="comment-by">'+reply.nickname+ ' ';
	    if(reply.gradename=='beganner'){
	    	itemStr += "<i class='fa fa-smile-o'></i>";
	    }else if(reply.gradename=='gaeneral'){
	    	itemStr += "<i class='fa fa-trophy'></i>";
	    }else if(reply.gradename=='gaexpert'){
	    	itemStr += "<i class='fa fa-trophy'></i><i class='fa fa-trophy'></i>";
	    }else if(reply.gradename=='gaenius'){
	    	itemStr += "<i class='fa fa-trophy'></i><i class='fa fa-trophy'></i><i class='fa fa-trophy'></i>";
	    }
	    
	    itemStr += '<span class="date">'+regi+'</span>'+
				'<div class="star star-rating" data-rating="'+reply.rating+'"></div>'+
			'</div>'+
			'<p id="changeMsg'+reply.commentNo+'">'+reply.message+'</p></div>';
			if(nickname==reply.nickname){
				itemStr +=	'<div class="comment-by" >'+
							'	<a class="reply" style="margin-top: 20px;" " onclick="go_url(1, '+reply.commentNo+');" return false; ><i class="sl sl-icon-note"></i> Edit</a>'+
							'</div>';
				itemStr +=	'<div class="comment-by">'+
							'	<a class="reply" style="margin-top: 60px;" " onclick="go_url(2, '+reply.commentNo+');" return false; ><i class="sl sl-icon-note"></i> Delete</a>'+
							'</div>';		
	 		}
			el.innerHTML = itemStr;	
	    return el;
	}	

function leadingZeros(n, digits) {
	  var zero = '';
	  n = n.toString();

	  if (n.length < digits) {
	    for (var i = 0; i < digits - n.length; i++)
	      zero += '0';
	  }
	  return zero + n;
	}

//검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
   while (el.hasChildNodes()) {
       el.removeChild (el.lastChild);
   }
}

var list = [];

var count=1;

function photoListView(start,end,photoList){
    var photoListEl = document.getElementById('photoMoreView'),
    photoFragment = document.createDocumentFragment(),
    photoEl; 
    var El = document.createElement('div');
    photoEl = '<div class="review-images col-lg-12" style="padding-top: 8px;" id="mfp-'+count+'">';
	
	for(var i=start;i<end;i++){
		photoEl += getPhotoList(photoList[i]);
	 }  
	photoEl += '</div>';
	El.innerHTML = photoEl;
    photoFragment.appendChild(El);
    count++;
    photoListEl.appendChild(photoFragment);
} 

var photoStart;
var photoEnd;


$('#photoMore').click(function(){
	 photoListView(photoStart,photoEnd,pList);	
	 if(photoEnd==pList.length){
		 $('#photoMore').hide();
	 }	
	 photoStart = photoStart+4;
	 photoEnd = photoEnd+4;
	 photoEnd = photoEnd>pList.length?pList.length:photoEnd;
});  

var pList = [];

$(document).ready(function() {
	var eventNo = document.getElementById("eventNo").value;
	url = '/event/detail/getPhotoData?eventNo='+eventNo;
	$.ajax({
		url 	 : url,
		dataType : 'json',
		type	 :"POST",
		success  : function(photoList) {
			pList = photoList;
			if(pList.length<=4){
				photoListView(0,pList.length,pList);
			}else{
				photoListView(0,4,pList);	
				photoStart = 4;
				photoEnd = pList.length>8?8:pList.length;
			}
		},
		error : function(request, status, error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
	});		
});

function getPhotoList(photo) {
    var itemStr ='<a href="/resources/upload/'+photo.eventPhoto+'" class="mfp-gallery listing-item-container">'
    			+'<div class="listing-item">'
    			+'<img src="/resources/upload/'+photo.eventPhoto+'" alt="">'
    			+'</div> </a>';
    return itemStr;
}



$(document).ready(function() {
	var eventNo = document.getElementById("eventNo").value;
	var url = "/event/detail/getNearby?eventNo="+eventNo;
	$.ajax ({
		url 	 : url,
		dataType : 'JSON',
		type 	 : "POST",
		success	 : function(list){
			//alert(member.nickname);
			makeNearByList(list.nearby, list.dto);
			nearbySlide();
		},
		error : function(request, status, error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
	});
});



function nearbySlide(){
	$('.sim').slick({
		infinite: true,
		slidesToShow: 3,
		slidesToScroll: 3,
		});
}



function makeNearByList(near, event){
	var date = event.startDate;
	var startDate = date.toString();
	var ele = document.getElementById("nearbyList");
	nearbyFragment = document.createDocumentFragment();
	for(var i=0; i<near.length; i++){
		var itemEle = document.createElement("div");
		var nearbyItem = 
		'	<div class="listing-item-container">'+
		'		<div class="listing-item">'+
		'		<a href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='+near[i].title+'">'+
		'				<img src="/resources/images/event-cafe.jpg" alt="">		'+
		'				<div class="listing-item-content">'+
		'					<span class="tag" style="background: #f91942;">Cafe</span>'+
		'					<h3>'+near[i].title+'</h3>'+
		'					<span>'+near[i].address+'</span>'+
		'				</div>'+
		'		</a>';
		if(near[i].scheduleAdded == null){
			nearbyItem += '	<span class="add-schedule" onclick = "no_log_in('+event.eventNo+')" id = "add-schedule'+i+'"></span>';	
		}else {
			
			nearbyItem += '	<span class="'+near[i].scheduleAdded+'" id = "add-schedule'+i+'" onclick = "addToCal('+near[i].locationSeq+','+event.eventNo+',\''+startDate.toString()+'\','+i+')"></span>';
		}
		
		nearbyItem +=
		'		</div>'+
		'	</div>';
		itemEle.innerHTML = nearbyItem;
		
		itemEle.className = 'carousel-item';
		nearbyFragment.appendChild(itemEle);
	}
	ele.appendChild(nearbyFragment);
	return ele;
}


function no_log_in(eventNo){
		alert("일정등록은 회원만 가능합니다.");
		location.href = "/viewLogin?uri=/event/detail/view?no="+eventNo;
}
	

function addToCal(locationSeq, eventNo, startDate, index){
	
	//startDate = startDate.toString();
	var added = document.getElementById("add-schedule"+index).className;
	alert('addToCal alert'+startDate.toString());
	var url = "/mypage/calendar/addBookingNearby?added="+added+"&eventNo="+eventNo+"&startDate="+startDate+"&loc="+locationSeq;
	location.href = url;
	var id ='#add-schedule'+index; 
	$(id).toggleClass('liked');
	$(id).children('.add-schedule').toggleClass('liked');
		
}



function checkBooking(eventNo){
	var isLogin = document.getElementById("isLogin");
	if(isLogin.value==''){
		alert("일정등록은 회원만 가능합니다.");
		location.href = "/viewLogin?uri=/event/detail/view?no="+eventNo;
	}
}