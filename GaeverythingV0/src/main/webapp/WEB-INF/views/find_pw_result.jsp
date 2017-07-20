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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">
<script type="text/javascript">
</script>
</head>

<body>
<!-- Wrapper -->
<div id="wrapper">

<!-- Header Container
================================================== -->
<header id="header-container">
	<%@include file = 'header.jsp' %>
</header>
<div class="clearfix"></div>
<!-- Header Container / End -->

<!-- Content
================================================== -->
<div class="container margin-top-75">
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
				<p>비밀번호를 이메일로 전송하였습니다.</p>
		</div>
		<div class="col-sm-4"></div>
	</div>
	
</div>
<!-- Footer
================================================== -->
<%@include file = "footer.jsp" %>
<!-- Footer / End -->


<!-- Back To Top Button -->
<div id="backtotop"><a href="#"></a></div>


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
$("#find").click(function(){
	chkNick();
	chkEmail();
	if($("#nickChk").val()=='N' ||$("#emailChk").val()=='N'){
		return;
	}
	var f = confirm("비밀번호 찾기를 진행하겠습니까?");
	if(f){
		$('#findform').submit();
	}else{
		return false;
	}
});


function chkNick(){
	 var prmNick = $('#nickname').val(); //nickname값 가져오기
	  var nickMessage = document.getElementById("nickMessage");
	  
	  if($("#nickname").val() == ''){ //nickname 입력안했을경우
		  nickMessage.style.color = "red";
		  nickMessage.innerHTML="***Nickname을 입력해주세요."; 
		  return;
	  }
	  
	  $.ajax({
	     type : 'POST',  
	     data:"prmNick="+ prmNick,
	     dataType : 'json',
	     url : '/signUp/checkNickname',  //체크하는 컨트롤러주소
	     success : function(chkPoint) {
	    	 
	      var chkRst = chkPoint;
	      if(prmNick.length>=3){
		      if(chkRst == 0){
		    	 nickMessage.style.color = "red";
		    	 nickMessage.innerHTML = "***등록되지 않은 닉네임입니다.";
		       $("#nickChk").val('N');
		      }else{
		    	 nickMessage.style.color = "black";
		    	 nickMessage.innerHTML = "";
		       $("#nickChk").val('Y');
		      }
		   }else{
			   nickMessage.style.color = "red";
		    	 nickMessage.innerHTML = "***Nickname을 입력해주세요.";
		       $("#nickChk").val('N');
		   }
	     },
	     error : function(xhr, status, e) {  
	      alert(e);
	     }
	  }); 
	
}

function chkEmail(){
	var email = $('#email').val(); //email값 가져오기
	 var nickname = $('#nickname').val();
	  var emailMessage = document.getElementById("emailMessage");	  
	  if($("#email").val() == ''){ //이메일 입력안했을경우
		  emailMessage.style.color = "red";
		  emailMessage.innerHTML="***Email을 입력해주세요."; 
		  return;
	  } 	  
	  $.ajax({
	     type : 'POST',  
	     data: {email:email , nickname:nickname},
	     dataType : 'json',
	     url : '/mypage/checkPW',  //체크하는 컨트롤러주소
	     success : function(chkPoint) {
	      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	      var chkRst = chkPoint;
	      if($("#email").val().match(regExp)!=null){    	  
			  var isGood = true;
	      }else{
	    	  var isGood = false;
	      }
	      if(isGood){
		      if(chkRst){
		    	  emailMessage.style.color = "red";
		    	  emailMessage.innerHTML = "***닉네임과 이메일 계정이 일치하지 않습니다.";
		          $("#emailChk").val('N');
		      }else{
		    	  emailMessage.style.color = "black";
		    	  emailMessage.innerHTML = "";
		       	  $("#emailChk").val('Y');
		      }
	      }else{
	    	  emailMessage.style.color = "red";
	    	  emailMessage.innerHTML = "***이메일 형식이 올바르지 않습니다.";
	    	  $("#emailChk").val('N');
	      }
	     },
	     error : function(xhr, status, e) {  
	      	  alert(e);
	     }     
	  });
}
</script>

</body>
</html>
