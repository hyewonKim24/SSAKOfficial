<link href="<%=request.getContextPath() %>/reset.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>SSAK ::</title>
<style>
a {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: gray;
}
a:link {
	color: gray;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#c_main {
	padding-top: 65px;
	width: 1080px;
	margin: auto;
}

/***************side menu   START****************/
ul {
	margin: 0;
	padding: 0;
}

#c_nav {
	float: left;
	width: 200px;
	padding-bottom: 10px;
}

#c_nav .tit_c_nav {
	font-size: 30px;
	padding: 7px 0 34px;
	letter-spacing: -0.4px;
}

.inner_nav {
	border: 1px solid #dcdbde;
	border-bottom: 0;
}

.list_menu li {
	border-bottom: 1px solid #dcdbde;
	list-style: none;
}

.list_menu li a {
	display: block;
	overflow: hidden;
	padding: 15px 0 15px 20px;
	line-height: 20px;
	background: #fff /* url("./arrow-right2.png") no-repeat 169px 50% */;
	background-size: 10px 11px;
	font-size: 14px;
}

.list_menu li a:hover {
	background: #fafafa /* url("./arrow-right2.png") no-repeat 169px 50% */;
	background-size: 10px 11px;
	font-weight: 700;
	color: #425c5a;
}

.aside_arrow {
	float: right;
	padding-right: 20px;
	right: 0;
	line-height: 20px;
	font-size: 14px;
}

#c_nav .link_inquire {
	display: block;
	overflow: hidden;
	height: 60px;
	margin-top: 20px;
	padding: 9px 0 0 21px;
	border-radius: 0 100px 100px 0;
	background: #fafafa url("./arrow-right2.png") no-repeat 169px 50%;
	background-size: 10px 11px;
	font-size: 12px;
	color: #333;
	line-height: 20px;
}

#c_nav .link_inquire .emph {
	display: block;
	padding-bottom: 1px;
	font-weight: 700;
	font-size: 14px;
}

.page_section {
	float: right;
	width: 820px;
}

.head_aticle {
	padding: 5px 0 10px;
}

.tit {
	font-size: 25px;
}

.tit_sub {
	padding-left: 11px;
	font-size: 14px;
	color: #999;
	line-height: 20px;
	letter-spacing: -.3px;
	vertical-align: 3px;
}

.nav_link .nav_text {
	text-align: center;
}

.nav_link .nav_text2 {
	text-align: center;
	padding-top: 30px;
}

/* 1:1문의 글등록 content board*/
.CSq1_cont_board {
	width: 100%;
}

.qna_desc {
	line-height: 250px;
	padding-top: 0px;
	vertical-align: middle;
}

.qna_box {
	background-color: #f7f7f7;
}

.subM {
	float: right;
	padding: 10px 0;
}

.hr_bottm {
	width: 100%;
	margin: 30px;
}

.b_button {
	width: 100px;
	line-height: 30px;
	font-size: 11px;
	text-align: center;
	background-color: #425c5a;
	border: 1px solid #425c5a;
	color: #fff;
}

.CSq1_cont_board table {
	width: 100%;
	height: 450px;
	border: 1px solid #e8e8e8;
	border-collapse: collapse;
	border-top: 3px solid #425c5a;
	
}

.CSq1_cont_board tr td:nth-child(1) {
	font-size: 15px;
	text-align: center;
	font-weight: bold;
	width: 150px;
	line-height: 30px;
	border: 1px solid #e8e8e8;
	vertical-align: middle;
	height: 10px;
}

.CSq1_cont_board tr td:nth-child(2) {
	font-size: 13px;
	width: 180px;
	border: 1px solid #e8e8e8;
	vertical-align: middle;
}
</style>
<script type="text/javascript">
	function endUpdate() {
		var frm = document.nDetialUpdate;
		frm.action = "noticeUpdate.do";
		frm.method = "get";
		frm.submit();
	}
	function goBack() {
		window.history.back();
	}
</script>
<c:if test="${not empty noticeUpdate}">
	<c:forEach items="${noticeUpdate}">
		alert(${noticeUpdate});
	</c:forEach>
</c:if>
</head>
<body>
	<%-- 	<div class="register_res">
		<c:if test="${not empty update_fail}">
			<span>${update_fail}</span>
		</c:if>
	</div> --%>
	<div id="wrap">
		<div id="c_main">
			<div id="c_nav">
				<h2 class="tit_c_nav">고객센터</h2>
				<div class="inner_nav">
					<ul class="list_menu">
						<li><a href="noticeList.do">공지사항<span class="aside_arrow">></span></a></li>
						<li><a href="#">자주하는질문<span class="aside_arrow">></span></a></li>
						<li><a href="qnaList.do">1:1문의<span class="aside_arrow">></span></a></li>
					</ul>
				</div>

				<a href="#" class="link_inquire"> <span class="emph">도움이
						필요하신가요 ?</span> 1:1 문의하기
				</a>
			</div>

			<div class="page_section">
				<div class="head_aticle">
					<h2 class="tit">
						공지사항 <span class="tit_sub"> 최신 싹(SAKK)의 소식을 보실 수 있습니다. </span>
					</h2>
				</div>
	

				<div class="CSq1_cont_board">
					<form name="nDetialUpdate">
						<input type="hidden" name="nno" value="${param.nno}">
						<table class="qnq_board" style="margin-top: 34px;">
							<tr>
								<td class="qna_title qna_box">제목</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="text" id="ntitle" name="ntitle"
									style="width: 640px; height: 30px; border: 1px solid #e8e8e8;" value="${param.ntitle}"></td>
							</tr>
							<tr>
								<td class="qna_desc qna_box">내용</td>
								<td colspan="2" style="padding-left: 8px;">
								<textarea cols="50" rows="10" id="ncontent" name="ncontent" style="width: 640px; height: 350px; border: 1px solid #e8e8e8; "  value="${param.ncontent}"></textarea>
								
								</td>
							</tr>
						</table>
						<div class="subM">
							<input type="button" onclick="endUpdate()" value="수정하기"
								class="b_button"> <input type="button" class="b_button"
								value="취소" onclick="goBack()">
						</div>
					</form>
				</div>
			</div>
			<p></p>
			<hr class="hr_bottm">
		</div>
	</div>
</body>
</html>