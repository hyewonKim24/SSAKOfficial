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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">

<title>ssak, 나만의 책</title>
</head>
<body>

	<form class="form_wrap">
		<table id="id_search_end_tbl">

			<tr>
				<td>
					<p class="font_large form_title">아이디 찾기</p>
				</td>
			</tr>
			<tr>
				<td class="id_search_title"><svg width="50px" height="50px"
						viewBox="0 0 16 16" class="bi bi-file-person-fill"
						fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
							d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z" />
                      </svg></td>
			</tr>
			<tr>
				<td class="id_search_title">고객님의<br> 아이디 찾기가 완료 되었습니다!
				</td>
			</tr>
			<tr>
				<td id="id_search_view">아이디: <c:if
						test="${not empty id_search_mid }">
				${id_search_mid }
            
			</c:if>
				</td>
			</tr>

			<tr>
				<td class="form_login_btn"><input type="button"
					class="form_btn1" onclick="location.href='./memberLogin.jsp'"
					value="로그인 하기"></td>
			</tr>

		</table>
			<br><br><br><br>
	</form>
<%@include file="../main/footer.jsp"%>
</body>
</html>