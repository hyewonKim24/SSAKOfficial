<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link href="./reset.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>SSAK ::</title>
<style>
/***************section****************/
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

/***************section****************/
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
	display: flow-root;
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
	height: 600px;
	border: solid 1px;
	border-collapse: collapse;
}

.CSq1_cont_board tr td:nth-child(1) {
	font-size: 15px;
	text-align: center;
	font-weight: bold;
	width: 150px;
	padding-top: 15px;
	line-height: 30px;
	border: solid 1px;
}

.CSq1_cont_board tr td:nth-child(2) {
	font-size: 13px;
	width: 180px;
	padding-top: 15px;
	border: solid 1px;
}

.CSq1_cont_board tr td:nth-child(3) {
	font-size: 15px;
	width: 150px;
	text-align: center;
	font-weight: bold;
	border: solid 1px;
}

.CSq1_cont_board tr td:nth-child(4) {
	font-size: 13px;
	width: 150px;
	text-align: center;
}

.qna_desc {
	line-height: 250px;
	padding-top: 0px;
	vertical-align: middle;
}

.qna_box {
	background-color: gainsboro;
}

.b_button {
	display: inline;
	float: right;
	height: 50px;
	width: 134px;
	background-color: gray;
	border-radius: 8px;
}

.b_button2 {
	margin-top: 15px;
}

/***************section****************/
</style>

<script type="text/javascript">
	function startUpdate() {
		var frm = document.qnaDetail;
		frm.method = "post";
		frm.action = ".//qna/qnaUpdate.jsp";
		frm.submit();
	}
	function goBackList() {
		window.history.back();
	}
	function goDelete(){
		var frm = document.qnaDetail;
		frm.method = "post";
		frm.action = "<%=request.getContextPath()%>qnaDelete.do";
		frm.submit();
	}
	function goReply(){
		var frm = document.qnaDetail;
		frm.method="post";
		frm.action="./qna/qnaReply.jsp";
		frm.submit();
	}
</script>

</head>

<body>
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
					공지사항 <span class="tit_sub"> 최신 싹(SSAK)의 소식을 보실 수 있습니다.</span>
				</h2>
			</div>
			<form name="qnaDetail">
				<div class="CSq1_cont_board">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="qtitle" name="qtitle"
								style="padding-left: 8px;">
								<input type="hidden" name="qtitle" value="${qdetail.qtitle}">
								${qdetail.qtitle}
								</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
							<input type="hidden" name="mid" value="${qdetail.mid}">
							${qdetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id=qdate " name="qdate">
							<fmt:formatDate value ="${qdetail.qdate}" pattern="yyyy-MM-dd" var="date"/> 
							<input type="hidden" name="qdate" value="${date}">
							${date}
							</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="qview" name="qview">
							<input type="hidden" name="qview" value="${qdetail.qview}">
							${qdetail.qview}
							</td>

						</tr>
						<tr>
							<td colspan="4" id="qcontent" name="qcontent"
								style="height: 350px;">
								<input type="hidden" name="qcontent" value="${qdetail.qcontent}">
								${qdetail.qcontent}
								
						<input type="hidden" name="qno" value="${qdetail.qno}">
						<input type="hidden" name="qpw" value="${qdetail.qpw}">	
						<input type="hidden" name="qref" value="${qdetail.qref}">	
						<input type="hidden" name="qref_step" value="${qdetail.qref_step}">	
						<input type="hidden" name="qref_level" value="${qdetail.qref_level}">	
						<input type="hidden" name="qtype" value="${qdetail.qtype}">	
							</td>
						</tr>
					</table>
					<div class="b_button2">
						<button type="button" class="b_button" onclick="goReply()">답글달기</button>
						<button type="button" class="b_button" onclick="startUpdate()">수정</button>
						<button type="button" class="b_button" onclick="goDelete()">삭제</button>
						<button type="button" class="b_button" onclick="goBackList()">글목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<footer>
		<div class="footer_cont">
			<div class="mCS">
				<div id="mCS_title">고객센터</div>
				<div class="mCS_info">
					<div id="mCS_info_left">
						<p id="mCS_phone">1544-1000</p>
						<p id="mCS_address">서울특별시 중구 남대문로 120 대일빌딩 2F,3F</p>
						<p id="mCS_email">ssakofficial@gmail.com</p>
					</div>
					<div id="mCS_info_right">
						<p class="mCS_opertime">
							고객센터 운영시간<br> 평일 오전 9시 ~ 오후 6시<br> 주말 및 공휴일 상담불가<br>
						</p>
						<p class="mCS_opertime">
							온라인문의<br> 24시간 접수 가능<br> 친절히 상담해드리겠습니다!<br>
						</p>
					</div>
				</div>
			</div>
			<div class="mSsakInfo">
				<nav id="mSsakInfo_nav">
					<ul>
						<li><a href="#">ssak 소개</a></li>
						<li><a href="#">이용약관</a></li>
						<li><a href="#">개인정보처리방침</a></li>
						<li><a href="#">이용안내</a></li>
					</ul>
				</nav>
				<div id="mSsakInfo_text">
					안녕하세요 ssak입니다<br> 환영합니다.
				</div>
				<div id="mSsakInfo_sns">SNS링크 부분</div>
			</div>
		</div>
	</footer>

</body>

</html>