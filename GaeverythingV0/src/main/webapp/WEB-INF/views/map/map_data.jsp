<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post">
		<select name="page" id="page">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
		</select> 
		<input type="text" name="query" id="query" value="">
		<input type="button" id="search" value="submit">
	</form>
	

<script type="text/javascript" src="<c:url value = '/resources/scripts/jquery-2.2.0.min.js'/>"></script>
<script>

$('#search').click(function(){
	var page = document.getElementById('page').value;
	var query = document.getElementById('query').value;
	var url = '/map/searchMapData?page='+page+'&query='+query;
	$.ajax({
		url : url,
		dataType : 'json',
		type:"POST",
		success : function(data) {
		
		},
		error : function(request, status, error) {
			 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	   }
	});
});

</script>
</body>
</html>

