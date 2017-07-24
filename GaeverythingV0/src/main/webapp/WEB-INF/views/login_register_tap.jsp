<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
#logEmailMessage,#logPWMessage,#nickMessage,#emailMessage,#checkPwd,#checkPwd2{
	font-size : 10px;
	float: right;
}
</style>
<!--Tabs -->
<div class="sign-in-form style-1">
	<ul class="tabs-nav">
		<li class=""><a href="#tab1">Log In</a></li>
		<li><a href="#tab2">Register</a></li>
	</ul>
	<div class="tabs-container alt">
		<!-- Login -->
		<div class="tab-content" id="tab1" style="display: none;">
			<form action="/login" name="loginform" id="loginform" method="post" class="login">
				<p class="form-row form-row-wide">
					<label for="email1" >
						Email Address:<span id="logEmailMessage"></span>
						<i class="im im-icon-Mail"></i>		
						<input type="text" class="input-text" name="email" id="email1" value="" onchange="javascript:chkLogEmail();"/>
						<input type="hidden" id="loginChk" value="N" />							
					</label>
				</p>

				<p class="form-row form-row-wide">
					<label for="password" >
					Password:<span id="logPWMessage"></span>
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password" name="pw" id="password" onchange="javascript:checkLogPwd();"/>
						<input type="hidden" id="loginChk2" value="N" />	
					</label>
					<span class="lost_password">
						<a href="/viewFindPW" >Lost Your Password?</a>
					</span>
				</p>

				<div class="form-row">
					<input type="button" class="button border margin-top-5" id="login" name="login" value="Login" />
					<div class="checkboxes margin-top-10">
						<input id="remember-me" type="checkbox" name="check"  >
						<label for="remember-me">Remember Me</label>
					</div>
				</div>
				<input type="hidden" name ="uri" value="${param.uri}">
			</form>
		</div>

		<!-- Register -->
		<div class="tab-content" id="tab2" style="display: none;">
			<form action="/signUp/registMember" name="signform" id="signform" method="post" class="register"> 
				<p class="form-row form-row-wide">					
					<label for="username2">
						Nickname: <span id="nickMessage"></span>
						<i class="im im-icon-Male"></i>		
						<input type="text" class="input-text" name="nickname" id="username2"  value="" onchange="javascript:chkDupNick();" />
					<input type="hidden" id="nickChk" value="N" />											
					</label>
					
				
				</p>
					
				<p class="form-row form-row-wide">
					<label for="email2">
						Email Address: <span id="emailMessage"></span>
						<i class="im im-icon-Mail"></i>		
						<input type="text" class="input-text" name="email" id="email2"  value="" onchange="javascript:chkDupEmail();" />				
					<!-- 이메일 중복체크하기 -->
					<input type="hidden" id="emailChk" value="N" />					
					</label>
					
				</p>
	
				<p class="form-row form-row-wide">
					<label for="password1"> 
					Password:<span id="checkPwd"></span> 
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password"  name="pw" id="password1" onchange="javascript:checkPwd();" />						
					</label>
					
				</p>
	
				<p class="form-row form-row-wide">
					<label for="password2">
						Repeat Password: <span id="checkPwd2"></span> 						
						<i class="im im-icon-Lock-2"></i>	
						<input class="input-text" type="password"  name="pw1" id="password2" onchange="javascript:checkPwd();"/>							
					</label>		
				
				</p>
				<input type="button" class="button border fw margin-top-10" id="register" name="register" value="Register" />
			</form>
		</div>
		
	</div>
</div>
<script type="text/javascript" src="<c:url value = '/resources/scripts/jquery-2.2.0.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/scripts/jquery.cookie.js'/>"></script>

<script type="text/javascript">
function setsave(name, value, expiredays) {
	var today = new Date();
	today.setDate(today.getDate() + expiredays);
	document.cookie = name + "=" + escape(value) + "; path=/; expires="+ today.toGMTString() + ";";
}

//Login 버튼 누를 시
$("#login").click(function(){
	chkLogEmail();
	checkLogPwd();
	//checkSaveID();
	if($("#loginChk").val()=='N' ||$("#loginChk2").val()=='N'){
		return;
	}else{
		$('#loginform').submit();
	}
});

//로그인할때 이메일 체크
function chkLogEmail(){
	  var prmEmail = $('#email1').val(); //email값 가져오기
	  var logEmailMessage = document.getElementById("logEmailMessage");	  
	  if($("#email1").val() == ''){ //이메일 입력안했을경우
		  logEmailMessage.style.color = "#f91942";
		  logEmailMessage.innerHTML="Email을 입력해주세요."; 
		  return;
	  } 	  
	  $.ajax({
	     type : 'POST',  
	     data:"prmEmail="+ prmEmail,
	     dataType : 'json',
	     url : '/signUp/checkEmail',  //체크하는 컨트롤러주소
	     success :  function(chkPoint2) {
	    var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	      var chkRst = chkPoint2;
	      if($("#email1").val().match(regExp)!=null){    	  
 			  var isGood = true;
	      }else{
	    	  var isGood = false;
	      }
	      if(isGood){
		      if(chkRst == 0){
		    	  logEmailMessage.style.color = "#f91942";
		    	  logEmailMessage.innerHTML = "등록되지 않은 이메일 입니다.";
		          $("#loginChk").val('N');
		      }else{
		    	  logEmailMessage.style.color = "#888";
		    	  logEmailMessage.innerHTML = "";
		       	  $("#loginChk").val('Y');
		      }
	      }else{
	    	  logEmailMessage.style.color = "#f91942";
	    	  logEmailMessage.innerHTML = "이메일 형식이 올바르지 않습니다.";
	    	  $("#loginChk").val('N');
	      }
	     },
	     error : function(xhr, status, e) {  
	      	  alert(e);
	     }     
	  }); 
}

//로그인할때 패스워드 체크
function checkLogPwd(){
	  var logPWMessage = document.getElementById("logPWMessage");
	  var email = document.getElementById("email1").value;
 	  var password = document.getElementById("password").value;
	  if($("#password").val() == ''){ //nickname 입력안했을경우
		  logPWMessage.style.color = "#f91942";
		  logPWMessage.innerHTML="패스워드를 입력해주세요."; 
		  $("#loginChk2").val('N');
		  return;
	  }
	  $.ajax({
		     type : 'POST',  
		     data: {password: password, email: email},
		     dataType : 'json',
		     url : '/signUp/checkPW',  //체크하는 컨트롤러주소
		     success : function(chkPoint) {
		    	  var chkRst = chkPoint;
		    	  if(chkRst == 1){
		    		  logPWMessage.style.color = "#888";
		    		  logPWMessage.innerHTML=""; 
		    		  $("#loginChk2").val('Y');
		    	  }else if(chkRst == 0){
		    		  logPWMessage.style.color = "#f91942";
		    		  logPWMessage.innerHTML="올바른 패스워드를 입력해주세요."; 
		    		  $("#loginChk2").val('N');
		    	  }
		     }
	  });
}


//register 버튼 누를 시
$("#register").click(function(){
	chkDupNick();
	chkDupEmail();
	checkPwd();
	if($("#nickChk").val()=='N' ||$("#emailChk").val()=='N'||
			$("#password1").val()!=$("#password2").val()||
			$("#password1").val().length<8){
		return;
	}
	var f = confirm("회원가입을 완료하겠습니까?");
	if(f){
		$('#signform').submit();
	}else{
		return false;
	}
});


//가입시 닉네임 체크
function chkDupNick(){
	  var prmNick = $('#username2').val(); //nickname값 가져오기
	  var nickMessage = document.getElementById("nickMessage");
	  
	  if($("#username2").val() == ''){ //nickname 입력안했을경우
		  nickMessage.style.color = "#f91942";
		  nickMessage.innerHTML="Nickname을 입력해주세요."; 
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
		    	 nickMessage.style.color = "#888";
		    	 nickMessage.innerHTML = "등록 가능 합니다.";
		       $("#nickChk").val('Y');
		      }else{
		    	 nickMessage.style.color = "#f91942";
		    	 nickMessage.innerHTML = "이미 등록된 닉네임입니다.";
		       $("#nickChk").val('N');
		      }
		   }else{
			   nickMessage.style.color = "#f91942";
		    	 nickMessage.innerHTML = "Nickname을 입력해주세요. (3자 이상)";
		       $("#nickChk").val('N');
		   }
	     },
	     error : function(xhr, status, e) {  
	      alert(e);
	     }
	  }); 
}



//가입시 이메일 체크
function chkDupEmail(){
	  var prmEmail = $('#email2').val(); //email값 가져오기
	  var emailMessage = document.getElementById("emailMessage");	  
	  if($("#email2").val() == ''){ //이메일 입력안했을경우
		  emailMessage.style.color = "#f91942";
		  emailMessage.innerHTML="Email을 입력해주세요."; 
		  return;
	  } 	  
	  $.ajax({
	     type : 'POST',  
	     data:"prmEmail="+ prmEmail,
	     dataType : 'json',
	     url : '/signUp/checkEmail',  //체크하는 컨트롤러주소
	     success : function(chkPoint2) {
	      var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	      var chkRst = chkPoint2;
	      if($("#email2").val().match(regExp)!=null){    	  
 			  var isGood = true;
	      }else{
	    	  var isGood = false;
	      }
	      if(isGood){
		      if(chkRst == 0){
		    	  emailMessage.style.color = "#888";
		    	  emailMessage.innerHTML = "등록 가능 합니다.";
		          $("#emailChk").val('Y');
		      }else{
		    	  emailMessage.style.color = "#f91942";
		    	  emailMessage.innerHTML = "이미 등록된 이메일입니다.";
		       	  $("#emailChk").val('N');
		      }
	      }else{
	    	  emailMessage.style.color = "#f91942";
	    	  emailMessage.innerHTML = "이메일 형식이 올바르지 않습니다.";
	    	  $("#emailChk").val('N');
	      }
	     },
	     error : function(xhr, status, e) {  
	      	  alert(e);
	     }     
	  });
}

//가입시 비밀번호 체크
function checkPwd(){
 	  var pw1 = document.getElementById("password1").value;
	  var pw2 = document.getElementById("password2").value;

	  if(pw1.length<8){
		  document.getElementById('checkPwd').style.color = "#f91942";
		  document.getElementById('checkPwd').innerHTML = "암호를 입력해주세요.(8자 이상)";
		  document.getElementById('checkPwd2').style.color = "#f91942";
		  document.getElementById('checkPwd2').innerHTML = ""; 
	  }else{
		  document.getElementById('checkPwd').style.color = "888";
		  document.getElementById('checkPwd').innerHTML = "";
		  document.getElementById('checkPwd2').style.color = "#f91942";
		  document.getElementById('checkPwd2').innerHTML = "동일한 암호를 입력하세요."; 
		  if(pw1==pw2 && pw1.length>=8){
		  	document.getElementById('checkPwd2').style.color = "#888";
		  	document.getElementById('checkPwd2').innerHTML = "암호가 확인 되었습니다."; 
		  }
	  }
}

</script>







