<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Basic Page Needs
================================================== -->
<title>Listeo</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet"
	href="<c:url value = '/resources/css/blueimp-gallery.css'/>">
<link rel="stylesheet"
	href="<c:url value = '/resources/css/colors/main.css'/>" id="colors">

</head>

<body>
<form method="post" id="data" name="data" action="">
<table>
	<tr>
		<td><input type="text" id="search" name="search"></td>
		<td><button onclick="searchPlace()">검색</button></td>
	</tr>
	<tr>
		<td><input type="text" id="searchPlace" name="searchPlace"></td>
		<td><button onclick="" >입력</button></td>
	</tr>
</table>
</form>
<script type="text/javascript">
function searchPlace(){
	data.action = ""
}
</script>
</body>
</html>
