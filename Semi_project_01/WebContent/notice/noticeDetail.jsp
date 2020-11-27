<link href="<%=request.getContextPath() %>/reset.css" rel="stylesheet" type="text/css">
<%@page import="service.notice.NoticeService"%>
<%@page import="notice.model.NoticeVO"%>
<%@page import="dao.NoticeDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
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
a:link {
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

#c_nav .link_inquire .emph {
	display: block;
	padding-bottom: 1px;
	font-weight: 700;
	font-size: 14px;
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

.page_section {
	float: right;
	width: 820px;
}

.head_aticle {
	padding: 5px 0 10px;
	padding-bottom: 42px;
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
	height: 515px;
	/* border: solid 1px; */
	border-collapse: collapse;
    border-top: 3px solid #425c5a;
}

.CSq1_cont_board tr td:nth-child(1) {
	font-size: 12px;
	text-align: center;
	font-weight: bold;
	width: 150px;
	padding-top: 15px;
	line-height: 30px;
	border: 1px solid #e8e8e8;
}

.CSq1_cont_board tr td:nth-child(2) {
	font-size: 12px;
	width: 180px;
	padding-top: 15px;
	border: 1px solid #e8e8e8;
}

.CSq1_cont_board tr td:nth-child(3) {
	font-size: 12px;
	width: 150px;
	text-align: center;
	font-weight: bold;
	border: 1px solid #e8e8e8;
}

.CSq1_cont_board tr td:nth-child(4) {
	font-size: 12px;
	width: 150px;
	text-align: center;
	border-right: 1px solid lightgray;
}

.qna_desc {
	line-height: 250px;
	padding-top: 0px;
	vertical-align: middle;
}

.qna_box {
	background-color: #f7f7f7;
	border: 1px solid #e8e8e8;
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

.b_button2 {
	margin-top: 15px;
}

/***************section****************/
</style>

<script type="text/javascript">
	function startUpdate() {
		var frm = document.noticeDetail;
		frm.method = "get";
		frm.action = "noticeUpdate.jsp";
		frm.submit();
	}
	function goBackList() {
		window.history.back();
	}
	function goDelete(){
		var frm = document.noticeDetail;
		frm.method = "get";
		frm.action = "noticeDelete.do";
		frm.submit();
	}
</script>

</head>

<body>
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
			<a href="#"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span> 1:1
				문의하기
			</a>
		</div>

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					공지사항 <span class="tit_sub"> 최신 싹(SSAK)의 소식을 보실 수 있습니다.</span>
				</h2>
			</div>
			<form name="noticeDetail">
				<div class="CSq1_cont_board">
					<input type="hidden" name="nno" value="${ndetail.nno}">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="ntitle" name="ntitle"
								style="padding-left: 8px;">
								<input type="hidden" name="ntitle" value="${ndetail.ntitle}">
								${ndetail.ntitle}
								</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
							<input type="hidden" name="mid" value="${ndetail.mid}">
							${ndetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id=ndate " name="ndate">
							<fmt:formatDate value ="${ndetail.ndate}" pattern="yyyy-MM-dd" var="date"/> 
							<input type="hidden" name="ndate" value="${date}">
							${date}
							</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="nview" name="nview">
							<input type="hidden" name="nview" value="${ndetail.nview}">
							${ndetail.nview}
							</td>

						</tr>
						<tr>
							<td colspan="4" id="ncontent" name="ncontent"
								style="height: 350px;">
								<input type="hidden" name="ncontent" value="${ndetail.ncontent}">
								${ndetail.ncontent}</td>
						</tr>
					</table>
					<div class="b_button2">
			<c:if test="${not empty member}">
				<c:if test="${member.authority eq 1}">
						<button type="button" class="b_button" onclick="startUpdate()">수정</button>
						<button type="button" class="b_button" onclick="goDelete()">삭제</button>
				</c:if>
				</c:if>
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