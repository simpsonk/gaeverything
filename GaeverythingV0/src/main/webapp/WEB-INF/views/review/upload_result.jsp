<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Gaeverything</title>
<script type="text/javascript">
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${file_path}','파일전송 완료!');
	
 	if(window.parent.document.getElementById("upload").value==""){
 		window.parent.document.getElementById("upload").value ='${filename}';	
 	}
	alert('${filename}');
</script>
</head>
<body>


</body>
</html>