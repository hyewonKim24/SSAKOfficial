<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./reset.css" rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>아이디 찾기</title>
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
	width: 1080px;
	padding-top: 60px;
	display: block;
	margin: 0 auto;
}

.input_id_search {
	width: 100%;
	height: 54px;
	padding: 0 19px;
	border: 1px solid #ccc;
	border-radius: 3px;
	background-color: #fff;
	font-size: 14px;
	line-height: 20px;
	outline: none;
}

.login_font_size {
	font-size: 11pt;
	line-height: 30px;
}

.form_login_btn {
	text-align: center;
}

.form_btn1 {
	display: block;
	width: 340px;
	height: 54px;
	border-radius: 3px;
	text-align: center;
	border: 1px solid #425c5a;
	background-color: #425c5a;
	color:white;
	margin-top:30px;
}

.idsearch_res {
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	margin: 20px;
}

#id_search_tbl {
	margin: 0 auto;
	line-height: 40px;
	height: 40px;
	vertical-align: middle;
}

#id_search_tbl td {
	vertical-align: middle;
}

.id_search_res {
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	margin: 20px;
}
</style>
<script>
 function goIdSearch(){
	 var frm=document.idSearchfrm;
	 frm.action="<%=request.getContextPath()%>/memberIdSearch.do";
	 frm.method="post";
	 frm.submit();
 }
 
 </script>
</head>
<body>

	<form class="form_wrap" name="idSearchfrm">
		<div class="id_search_res">
			<c:if test="${not empty id_search_error}">
				${id_search_error }
			</c:if>

		</div>

		<table id="id_search_tbl">

			<tr>
				<td colspan="5">
					<p class="font_large form_title">아이디 찾기</p>
				</td>
			</tr>
			<tr>
				<td>이름</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="mname"
					class="input_id_search" name="mname"
					placeholder="가입 시 등록했던 이름을 입력해주세요"></td>

			</tr>
			<tr>
				<td>이메일</td>
			</tr>
			<tr>
				<td colspan="4"><input type="text" id="memail"
					class="input_id_search" name="memail"
					placeholder="가입 시 등록했던 이메일을 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button
						class="form_btn1" onclick="goIdSearch();">찾기</button></td>
			</tr>


		</table>
	</form>

</body>
</html>