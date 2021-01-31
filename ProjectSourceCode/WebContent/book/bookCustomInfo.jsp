<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ssak, 나만의 책</title>
<style>
* {
	margin: 0;
}
body {
	width: 100%;
	position: absolute;
}
#custom_info{
	width: 1080px;
	margin: 20px auto;
}
#custom_btn{
	width:210px;
	height: 60px;
	cursor: hand;
	opacity: 0;
	position: absolute;
	top: 2100px;
	left: 42%;
	z-index: 100;
}
</style>
</head>
<body>
	<div id="custom_info">
		<img src="<%=request.getContextPath()%>/imgs/custom_info.png" alt="custom_info_img" id="custom_info_img">
	</div>
		<button id="custom_btn" type="button" onclick="location.href='<%=request.getContextPath()%>/book/bookCustom02.jsp'"></button>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>