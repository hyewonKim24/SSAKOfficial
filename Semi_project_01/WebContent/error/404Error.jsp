<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ include file="../main/header.jsp"%>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssak, 나만의 책</title>
<style>
.error_wrap{
	width: 1080px;
	margin: 0 auto;
	text-align: center;
	padding-top:100px;
}
.error_title{
	font-size: 1.17em;
	font-weight: bold;
}
.error_contents{
	font-size: 12px;
	color: gray;
}
.error_btn{
	border: 1px solid #425c5a;
	background-color: #fff;
	color: #425c5a;
	display: inline-block;
	width: 120px;
	margin-left: 5px;
	vertical-align: top;
	margin-top: 5px;
	height: 44px;
	border-radius: 3px;
	font-weight: 700;
	font-size: 14px;
	line-height: 40px;
	text-align: center;
	height: 44px;
}
</style>
</head>
<body>
<div class="error_wrap">
<svg width="200px" height="200px" viewBox="0 0 17 16" class="bi bi-exclamation-triangle-fill" fill="#425c5a" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5a.905.905 0 0 0-.9.995l.35 3.507a.552.552 0 0 0 1.1 0l.35-3.507A.905.905 0 0 0 8 5zm.002 6a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg><br>
<p class="error_title">페이지를 찾을 수 없습니다.</p><br>
<p class="error_contents">요청하신 페이지가 제거되었거나, 이름이 변경되었거나,<br>
일시적으로 사용이 중단 되었습니다. </p><br>
<button type="button" onclick="location.href='<%=request.getContextPath()%>/ssakMain.do';" class="error_btn">SSAK 메인</button>

</div>
<br><br><br><br><br>
<%@include file="../main/footer.jsp"%>
</body>
</html>