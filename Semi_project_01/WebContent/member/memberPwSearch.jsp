<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>비밀번호 찾기</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	margin: 0 auto;
}

.form_title {
	line-height: 70px;
	font-weight: bold;
}

.font_large {
	font-size: 30px;
	font-weight: bolder;
	text-align: center;
}

.form_wrap {
	padding-top: 60px;
	width: 1080px;
	display: block;
	margin: 0 auto;
}

.input_pw_search {
	padding-top: 0;
	width: 350px;
	height: 40px;
	vertical-align: middle;
	column-span: 2;
}

.login_font_size {
	font-size: 11pt;
	line-height: 30px;
}

.form_login_btn {
	text-align: center;
}

.form_btn1 {
	width: 360px;
	margin-top: 10px;
	line-height: 40px;
	background-color: #6946A7;
	color: white;
	border: none;
	border-radius: 5%;
}

#pw_search {
	margin: 0 auto;
	line-height: 30px;
	height: 40px;
	vertical-align: middle;
}

#pw_search td {
	vertical-align: middle;
}

#pw_search_com {
	text-align: center;
	font-size: 13px;
}

#pw_search_tbl {
	margin: 0 auto;
	line-height: 40px;
	height: 40px;
	vertical-align: middle;
}

.pw_search_res{
			text-align: center;
			font-size:14px;
			font-weight:bold;
			margin:20px;
			
		}
</style>
<script>
 function goPwSearch(){
	 var frm=document.pw_search_frm;
	 frm.action="<%=request.getContextPath()%>/memberPwSearch.do";
	 frm.method="post";
	 frm.submit();
 }
 </script>
</head>
<body>

	<form name="pw_search_frm" class="form_wrap">
			<div class="pw_search_res">
				<c:if test="${not empty pw_Search_error}">
				${pw_Search_error}
			</c:if>

			</div>
		<table id="pw_search_tbl">
			<tr>
				<td colspan="5">
					<p class="font_large form_title">비밀번호 찾기</p>
				</td>
			</tr>
			<tr>
				<td class=>아이디</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="mid"
					class="input_pw_search" name="mid"
					placeholder="가입 시 등록했던 아이디를 입력해주세요"></td>

			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="memail"
					class="input_pw_search" name="memail"
					placeholder="가입 시 등록했던 이메일을 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><input type="button"
					class="form_btn1" value="찾기" onclick="goPwSearch();"></td>
			</tr>
			<tr>
				<td colspan="5" id="pw_search_com">임시 비밀번호가 담긴 이메일이 보내집니다.</td>
			</tr>


		</table>
	</form>

</body>
</html>