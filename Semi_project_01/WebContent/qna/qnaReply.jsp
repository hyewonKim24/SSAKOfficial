<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link href="./reset.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAK ::</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

a {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
	color: gray;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

#header {
	background-color: #6946A7;
	width: 1080px;
	height: 222px;
	margin: auto;
}

#c_main {
	padding-top: 65px;
	width: 1080px;
	margin: auto;
}

#c_nav {
	float: left;
	width: 200px;
}

#c_nav .tit_c_nav {
	padding: 7px 0 34px;
}

.nav_t {
	display: block;
	width: 200px;
	height: 60px;
	background-color: gold;
}

#c_nav .nav_link {
	display: block;
	width: 200px;
	height: 130px;
	margin-top: 16px;
	padding-top: 19px;
	border: 1px solid #f7f5f7;
	background: #E6E6E6;
	background-size: 6px 11px;
	line-height: 20px;
	border-radius: 30px;
}

#c_nav .nav_link .emph {
	display: block;
	padding-bottom: 1px;
	font-weight: 700;
	font-size: 14px;
	text-align: center;
}

.inner_nav {
	border: 1px solid #dcdbde;
	border-bottom: 0;
}

.list_menu li {
	border-bottom: 1px solid #dcdbde;
}

.list_menu li a {
	display: block;
	overflow: hidden;
	padding: 16px 0 16px 19px;
	background: #fff url("./images/ico_arrow_on_12x22.png") no-repeat 174px
		50%;
	background-size: 6px 10px;
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

.CSq1_cont_board table {
	width: 100%;
	height: 450px;
	border: solid 1px;
	border-collapse: collapse;
}

.CSq1_cont_board tr td:nth-child(1) {
	font-size: 15px;
	text-align: center;
	font-weight: bold;
	width: 150px;
	line-height: 30px;
	border: solid 1px;
	vertical-align: middle;
	height: 10px;
}

.CSq1_cont_board tr td:nth-child(2) {
	font-size: 13px;
	width: 180px;
	border: solid 1px;
	vertical-align: middle;
}

.qna_desc {
	line-height: 250px;
	padding-top: 0px;
	vertical-align: middle;
}

.qna_box {
	background-color: gainsboro;
}

.subM {
	float: right;
	padding-top: 10px;
}

.hr_bottm {
	width: 100%;
	margin: 30px;
}
</style>
<script>
function goReply(){
	var frm = document.qnaReply;
		frm.action="<%=request.getContextPath()%>/qnaReply.do";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>

<body>
	<div class="register_res">
		<c:if test="${not empty register_fail}">
			<span>${register_fail}</span>
		</c:if>
	</div>
	<div id="wrap">
		<div id="c_main">
			<div id="c_nav">
				<h1 class="tit_c_nav">고객센터</h1>
				<div class="inner_nav">
					<ul class="list_menu">
					<li><a href="<%=request.getContextPath() %>/noticeList.do">공지사항</a></li>
					<li><a href="<%=request.getContextPath() %>/qna/fq.jsp">자주하는질문</a></li>
					<li><a href="<%=request.getContextPath() %>/qnaList.do">1:1문의</a></li>
					</ul>
				</div>
				<a href="#" class="nav_link">
					<div class="nav_text">고객센터</div>
					<div class="nav_text">111-1111</div>
					<div class="nav_text2">
						<div class="nav_text">월~금 09:00~18:00</div>
						<div class="nav_text">(토요일,공휴일 휴무)</div>
					</div>
				</a>
			</div>

			<div class="page_section">
				<div class="head_aticle">
					<h2 class="tit">
						1:1문의하기 <span class="tit_sub"> 최신 싹(SAKK)의 소식을 보실 수 있습니다. </span>
					</h2>
				</div>
				<div class="CSq1_cont_board">
					<form name="qnaReply">
						<table>
							<tr>
								<td class="qna_ctg qna_box">질문유형</td>
								<td colspan="2"
									style="background-color: gainsboro; padding-left: 8px;">
									<select class="qna_se" name="qtype" style="width: 320px; height: 30px;">
										<option value="${param.qtype }">${param.qtype }</option>
										<!-- <option value="주문결제">주문/결제</option>
										<option value="커스텀문의">커스텀문의</option>
										<option value="배송문의">배송문의</option>
										<option value="회원문의">회원문의</option>
										<option value="기타">기타</option> -->
								</select></td>
							</tr>
							<tr>
								<td class="qna_title qna_box">제목</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="text" name="qtitle" placeholder="제목을 입력해주세요."
									style="width: 640px; height: 30px;"></td>

							</tr>
							<tr>
								<td class="qna_desc qna_box">내용</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="text" name="qcontent"
									placeholder="질문내용을 구체적으로 작성해주시면 더 빠르고 정확한 답변을 받으실 수 있습니다."
									style="width: 640px; height: 250px;"></input></td>
							</tr>
							<tr>
								<td class="qna_email qna_box">비밀번호</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="password" name="qpw" style="width: 320px; height: 30px;"
									value="${param.qpw}"></td>
							</tr>
							<tr>
								<td colspan="3">
								<input type="hidden" name="qno"	value="${param.qno}"> 
								<input type="hidden" name="qref" value="${param.qref}"> 
								<input type="hidden" name="qref_step" value="${param.qref_step}"> 
								<input type="hidden" name="qref_level" value="${param.qref_level}">
									<button type="button" onclick="goReply()"
										style="height: 50px; width: 134px; background-color: gray; border-radius: 8px;">등록하기</button>
								</td>
							</tr>
						</table>
						
					</form>
				</div>
			</div>
			<p></p>
			<hr class="hr_bottm">
		</div>
	</div>
</body>
</html>