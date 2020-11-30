<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/memberSearch.css" rel="stylesheet" type="text/css">
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>ssak, 나만의 책</title>
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
		<br><br><br><br><br>
	</form>
<%@include file="../main/footer.jsp"%>
</body>
</html>