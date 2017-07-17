<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<!--Tabs -->
<div class="sign-in-form style-1" style="margin-top: 100px;margin-left: 100px;margin-right: 100px;">
	<ul class="tabs-nav">
		<li class=""><a href="#tab1">shop name</a></li>
		<li><a href="#tab2">location</a></li>
	</ul>
	<div class="tabs-container alt">
		<!-- Login -->
		<div class="tab-content" id="tab1" style="display: none;">
			<div class="col-fs-12">
				<form action="" method="post" id="dataset">
					<div class="row with-forms">
						<div class="col-fs-3">	
							<select data-placeholder="Option" class="chosen-select" name="searchCategory">
								<option value="0">Category</option>
								<option value="5 449 776" ${searchCategory=='5 449 776'?'selected="selected"':''}>Hospital</option>
								<option value="2">########</option>
							</select>
						</div>
						<div class="col-fs-6">
							<div class="input-with-icon">
								<i class="sl sl-icon-magnifier"></i>
								<input type="text" placeholder="What are you looking for?" value="${searchWord}" id="searchWord" name = "searchWord">
							</div>
						</div>
						<div class="col-fs-3" style="text-align:center">
							<button type = "button" class="button" id = "search"  style="margin: auto; width: 130px;">search</button>			
						</div>
					</div>
				</form>
			</div>
			<c:if test="${list!=null}">
				<div class="dashboard-list-box with-icons margin-top-20">
					<h4>Result Shopname(count:${list.size()})</h4>
					<ul>
					<c:forEach items="${list}" var="data">
						<li>
							<strong><span id="title">${data.title}</span></strong><span>(${data.address})</span>
						</li>
					</c:forEach>		
					</ul>
				</div>
			</c:if>
			

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

$(document).ready(function() {
	$("#search").click(function() {
		var word = document.getElementById('searchWord').value;
		var category = $("select[name=searchCategory]").val();
		var formEle = document.getElementById('dataset');
		
		if(word===''){
			alert('검색어를 입력하세요.');
			return;
		}
		
		if(category==0){
			alert('카테고리를 선택하세요.');
			return;
		}
		
		if((word!='')&&(category!=0)){
			formEle.action = "map/getSearhShopname";
			formEle.submit();
		}
	});
	
	$("li").click(function(){
		alert($(this).find("#title").text());
	});
});
	

</script>

</body>
</html>