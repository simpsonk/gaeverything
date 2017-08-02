<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<!-- Basic Page Needs
================================================== -->
<title>gaeverything</title>
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
		<li><a href="#tab1">shop name</a></li>
	</ul>
	<div class="tabs-container alt" style="margin-bottom: 100px;">
		<!-- Login -->
		<div class="tab-content" id="tab1" style="display: none;">
			<div class="col-fs-12">
				<form action="" method="post" id="dataset">
					<div class="row with-forms">
						<div class="col-fs-2">	
							<select data-placeholder="Option" class="chosen-select" name="selectOp1" id = "selectOp1">
								<option value="1" ${searchData['selectOp1']=='1'?'selected="selected"':''}>Shop Name</option>
								<option value="2" ${searchData['selectOp1']=='2'?'selected="selected"':''}>Location</option>
							</select>
						</div>
						<div id = "hiddenOption" class="col-fs-2">	
							<select class="chosen-select" name="selectOp2" id = "selectOp2">
								<option value="0" ${searchData['selectOp2']=='0'?'selected="selected"':''}>Category</option>
								<option value="HP8" ${searchData['selectOp2']=='HP8'?'selected="selected"':''}>Hospital</option>
								<option value="3">#######</option>
							</select>
						</div>
						<div id = "textContainer" class="col-fs-6">
							<div class="input-with-icon">
								<i class="sl sl-icon-magnifier"></i>
								<input type="text" placeholder="What are you looking for?" value="${searchData['searchWord']}" id="searchWord" name = "searchWord">
							</div>
						</div>
						<div class="col-fs-2" style="text-align:center">
							<button type = "button" class="button" id = "search"  style="margin: auto; width: 130px; float: left;" >search</button>			
						</div>
					</div>
				</form>
			</div>
			<c:if test="${list!=null}">
				<div class="dashboard-list-box with-icons margin-top-20">
					<h4>Result Shopname(count:${list.size()})</h4>
					<ul>
					<c:forEach items="${list}" var="data">
						<li class = "list">
							<strong><span id="title">${data.title}</span></strong><span>(${data.address})</span><span id="locationSeq" style="visibility: hidden;">${data.locationSeq}</span>
						</li>
					</c:forEach>		
					</ul>
				</div>
			</c:if>
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
		var searchWord = document.getElementById('searchWord').value;
		var selectOp1 = $("select[id='selectOp1']").val();
		var selectOp2 = $("select[id='selectOp2']").val();
		var formEle = document.getElementById('dataset');
		
		if(searchWord===''){
			alert('검색어를 입력하세요.');
			return; 
		}
		
		if(selectOp1==0){
			alert('옵션을 선택하세요.');
			return;
		}
		
		if(selectOp2==0){
			alert('카테고리를 선택하세요.');
			return;
		}
		
		if((searchWord!='')&&(selectOp1!=0)&&(selectOp2!=0)){
			formEle.action = "/review/getSearhShopname";
			formEle.submit();
		}
	});
	
	$("li").filter('.list').click(function(){
		window.opener.document.getElementById('address').value = $(this).find("#title").text();
		window.opener.document.getElementById('locationSeq').value = $(this).find("#locationSeq").text(); 
		self.close();	
	});
});
</script>

</body>
</html>