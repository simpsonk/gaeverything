<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>


<!-- CSS
================================================== -->
<link rel="stylesheet" href= "<c:url value = '/resources/css/style.css'/>">
<link rel="stylesheet" href= "<c:url value = '/resources/css/colors/main.css'/>" id="colors">


</head>
<body>

<div class="sign-in-form style-1">
	<ul class="tabs-nav">
		<h4 class="tab-title">일정등록</h4>
		<form action="/login" method="post" class="login">
				<p class="form-row form-row-wide">
					<label for="username">Username:
						<i class="im im-icon-Male"></i>
						<input type="text" class="input-text" name="email" id="username" value="" />
					</label>
				</p>

				<p class="form-row form-row-wide">
					<label for="password">Password:
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password" name="pw" id="password"/>
					</label>
					<span class="lost_password">
						<a href="#" >Lost Your Password?</a>
					</span>
				</p>

				<div class="form-row">
					<input type="submit" class="button border margin-top-5" name="login" value="Login" />
					<div class="checkboxes margin-top-10">
						<input id="remember-me" type="checkbox" name="check">
						<label for="remember-me">Remember Me</label>
					</div>
				</div>
			</form>
	</ul>
	<div class="tabs-container alt">
		<!-- Login -->
		<div class="tab-content" id="tab1" style="display: none;">
			<form action="/login" method="post" class="login">
				<p class="form-row form-row-wide">
					<label for="username">Username:
						<i class="im im-icon-Male"></i>
						<input type="text" class="input-text" name="email" id="username" value="" />
					</label>
				</p>

				<p class="form-row form-row-wide">
					<label for="password">Password:
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password" name="pw" id="password"/>
					</label>
					<span class="lost_password">
						<a href="#" >Lost Your Password?</a>
					</span>
				</p>

				<div class="form-row">
					<input type="submit" class="button border margin-top-5" name="login" value="Login" />
					<div class="checkboxes margin-top-10">
						<input id="remember-me" type="checkbox" name="check">
						<label for="remember-me">Remember Me</label>
					</div>
				</div>
			</form>
		</div>

		<!-- Register -->
		<div class="tab-content" id="tab2" style="display: none;">
			<form  action="/signUp/registMember" method="post" class="register">
				<p class="form-row form-row-wide">
					<label for="username2">Nickname:
						<i class="im im-icon-Male"></i>
						<input type="text" class="input-text" name="nickname" id="username2" value="" />
					</label>
				</p>
					
				<p class="form-row form-row-wide">
					<label for="email2">Email Address:
						<i class="im im-icon-Mail"></i>
						<input type="text" class="input-text" name="email" id="email2" value="" />
					</label>
				</p>
	
				<p class="form-row form-row-wide">
					<label for="password1">Password:
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password" name="pw" id="password1"/>
					</label>
				</p>
	
				<p class="form-row form-row-wide">
					<label for="password2">Repeat Password:
						<i class="im im-icon-Lock-2"></i>
						<input class="input-text" type="password" name="pw1" id="password2"/>
					</label>
				</p>
				<input type="submit" class="button border fw margin-top-10" name="register" value="Register" />
			</form>
		</div>
	</div>
</div>

<br>
<div id="id02" class="w3-modal">
	<form action="" class="w3-modal-content w3-animate-zoom w3-card-4"
		method='post' id='calendarAdd'>
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button
						onclick="document.getElementById('id02').style.display='none'"
						type="button" class="w3-button w3-display-topright"
						data-dismiss="modal">x</button>
					<h4 class="modal-title">일정등록</h4>
				</div>
				<div class="modal-body">
					<div class='form-group'>
						<label>제목</label> <input type='text' class='form-control'
							id='title' name='title' placeholder="예: 오후 7시에 멕시코 음식점에서 저녁식사"
							value=''>
					</div>
					<div class='form-group'>
						<label>강아지 선택</label><br> <select id='dogid' name='dogid'>
							<option value="1" selected='selected'>1번개
							<option value="2">2번개
							<option value="3">3번개
						</select>
					</div>
					<div class='form-group'>
						<label>시작시간</label> <input class='form-control' type="time"
							id='startTime' name='startTime' value=''>
					</div>
					<div class='form-group'>
						<label>시작날짜</label> <input class='form-control startDate'
							type="date" id='startDate' name='startDate' value =''>
					</div>
					<div class='form-group'>
						<label>종료시간</label> <input class='form-control' type="time"
							id='endTime' name='endTime' value=''>
					</div>
					<div class='form-group'>
						<label>종료날짜</label> <input class='form-control startDate'
							type="date" id='endDate' name='endDate' value=''>
					</div>
					<div class='form-group'>
						<label>장소</label> <input type='text' class='form-control'
							id='place' name='place' placeholder="예: 강남구 서초동" value=''>
					</div>
					<div class='form-group'>
						<label>내용</label>
						<textarea rows="7" class='form-control' id="message"
							name='message' value=''></textarea>
					</div>
					<div class='modal-footer'>
						<input type="button" class='btn btn-sm btn-warning' value="확인"
							onclick="schedule(1)" /> <input type="button"
							class='btn btn-sm btn-warning' value="수정" onclick="schedule(2)" />
						<input type="button" class='btn btn-sm btn-warning' value="삭제"
							onclick="schedule(3)" /> <input type="reset"
							class='btn btn-sm btn-warning' value="초기화" /> <input
							type='button' class='btn btn-sm btn-warning'
							onclick="document.getElementById('id02').style.display='none'"
							data-dismiss='modal' value="취소" />
					</div>
				</div>
			</div>
		</div>
	</form>
</div>
</body>
</html>