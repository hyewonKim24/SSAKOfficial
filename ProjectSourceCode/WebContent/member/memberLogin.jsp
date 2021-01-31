<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/memberLogin.css" rel="stylesheet" type="text/css">
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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>ssak, 나만의 책</title>
<script>
 function goLogin(){
		var frm=document.login_frm;
			frm.action="<%=request.getContextPath()%>/memberLogin.do";
			frm.method = "post";
			frm.submit();
		}
 </script>
</head>
<body>

	<form name="login_frm" class="form_wrap">
		<div class="register_res">
			<c:if test="${not empty login_error}">
				${login_error }
			</c:if>
			<c:if test="${not empty register_ok}">
				${register_ok}
			</c:if>

		</div>

		<table id="login_tbl">
			<tr>
				<td colspan="5">
					<p class="font_large" id="form_title">로그인</p>
				</td>
			</tr>
			<tr class="login_input_border">
				<td colspan="5" class="input_login_wrap"><input type="text"
					name="mid" id="mid" class="input_login" size="20" tabindex="1"
					placeholder="아이디를 입력해주세요"></td>

			</tr>
			<tr class="login_input_border">
				<td colspan="5"><input type="password" id="mpw"
					class="input_login" name="mpw" size="20" tabindex="1"
					placeholder="비밀번호를 입력해주세요"></td>
			</tr>
			<tr>
				<td colspan="3"><input type="checkbox" id="login_keep"
					name="login_keep" width="20px"> <label for="login_keep"
					class="login_font_size">로그인 상태 유지</label></td>
				<td colspan="2"><p id="login_search">
						<a href="./memberIdSearch.jsp" class="login_font_size">아이디 찾기</a>&nbsp;
						| &nbsp; <a href="./memberPwSearch.jsp" class="login_font_size">비밀번호
							찾기</a>
					</p></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button
						class="form_btn1" onclick="goLogin();">로그인</button></td>
			</tr>
			<tr>
				<td colspan="5" class="form_login_btn"><button type="button"
						class="form_btn2" onclick="location.href='./memberRegister.jsp'">회원가입</button></td>
			</tr>

		</table>
	</form>
	<br><br><br><br><br>
<%@include file="../main/footer.jsp"%>
</body>
</html>