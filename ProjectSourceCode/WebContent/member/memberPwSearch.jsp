<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/memberSearch.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>ssak, 나만의 책</title>
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
	<br><br><br><br><br>
<%@include file="../main/footer.jsp"%>
</body>
</html>