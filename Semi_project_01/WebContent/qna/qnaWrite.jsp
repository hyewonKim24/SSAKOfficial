<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link href="./reset.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SSAK ::</title>
<style>
/***************section****************/
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
	font-size: 13px;
	width: 150px;
}

.qna_desc {
	line-height: 250px;
	padding-top: 0px;
	vertical-align: middle;
}

.qna_box {
	background-color: gainsboro;
}

/***************section****************/
* {
	margin: 0;
}

body {
	width: 100%;
	position: relative;
}

.Header {
	width: 100%;
	height: 170px;
}

table, td {
	border-collapse: collapse;
}

/* 메인_회원가입 */
#mHeader1 {
	position: relative;
	width: 100%;
	height: 25px;
	background-color: rgb(224, 224, 224);
}

.mSubnav {
	position: relative;
	width: 1080px;
	margin: 0 auto;
}

.mSubnav ul {
	float: right;
	margin-top: 10px;
}

.mSubnav ul li {
	float: left;
	padding-right: 10px;
	font-size: 15px;
}

#mSubnav_dropdown>li {
	display: none;
	font-size: 15px;
}

/* 로고 */
#mHeader2 {
	position: relative;
	width: 100%;
	height: 100px;
	background-color: rgb(224, 224, 224);
}

.mLogoWrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
}

#mLogo {
	position: absolute;
	height: 100px;
	margin: 0 40%;
}

/* 메인_네비 */
#mHeader3 {
	position: relative;
	width: 100%;
	height: 45px;
	background-color: rgb(224, 224, 224);
}

#mHeader3.fixed {
	position: fixed;
	height: 45px;
	z-index: 1;
	top: 0;
}

.mMainnav_wrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
	z-index: 1;
}

.mMainnav_wrap ul {
	width: 65%;
	height: 45px;
	float: left;
	list-style: none;
}

.mMainnav_wrap ul li {
	float: left;
	padding-right: 60px;
	line-height: 45px;
}

.mMainnav_wrap ul li a {
	text-decoration: none;
	font-size: 18px;
	color: black;
}

#mMainnav_dropdown li {
	display: none;
	font-size: 15px;
}

.mSearch {
	position: absolute;
	width: 35%;
	right: 0;
	line-height: 45px;
}

.mSearch #mSearchBar {
	width: 50%;
	box-sizing: border-box;
}

#mSearchBtn {
	width: 15%;
	box-sizing: border-box;
}

#mCart {
	width: 20%;
	box-sizing: border-box;
}

/* footer */
footer {
	position: relative;
	width: 100%;
	background-color: rgb(224, 224, 224);
}

.footer_cont {
	position: relative;
	width: 1080px;
	height: 300px;
	margin: 0 auto;
	padding-top: 20px;
	margin-top: 60px;
}

/* footer right */
.mCS {
	position: absolute;
	width: 50%;
}

#mCS_title {
	font-size: 30px;
	padding-top: 20px;
}

#mCS_info_left {
	float: left;
	width: 50%;
}

#mCS_phone {
	font-size: 25px;
	padding: 20px 0;
}

#mCS_address, #mCS_email {
	font-size: 15px;
	padding: 10px 0;
}

.mCS_opertime {
	font-size: 15px;
	padding: 10px 0;
}

/* footer left */
.mSsakInfo {
	position: absolute;
	width: 50%;
	left: 50%;
}

#mSsakInfo_nav {
	width: 100%;
	padding-top: 20px;
	font-size: 15px;
	height: 30px;
}

#mSsakInfo_nav ul li {
	float: left;
	padding-right: 10%;
}

#mSsakInfo_text {
	clear: both;
	height: 130px;
}

#mSsakInfo_sns {
	height: 60px;
}
</style>
<script type="text/javascript">
function goRegister(){
	var frm = document.qnaWrite;
		frm.action="<%=request.getContextPath()%>/qnaWrite.do";
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
					1:1 문의하기 <span class="tit_sub"> 고객님의 문의사항에 최대한 만족할 수 있는 답변을
						드리도록 노력하겠습니다. </span>
				</h2>
			</div>
			<div class="CSq1_cont_board">
				<form name="qnaWrite">
					<table>
						<tr>
							<td class="qna_ctg qna_box">질문유형</td>
							<td colspan="2"
								style="background-color: gainsboro; padding-left: 8px;">
								<select class="qna_se" name="qtype" style="width: 320px; height: 30px;">
									<option value="기타">선택하세요</option>
									<option value="주문결제">주문/결제</option>
									<option value="커스텀문의">커스텀문의</option>
									<option value="배송문의">배송문의</option>
									<option value="회원문의">회원문의</option>
									<option value="기타">기타</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">제목</td>
							<td colspan="2" style="padding-left: 8px;"><input
								type="text" name="qtitle" placeholder="제목을 입력해주세요."
								style="width: 640px; height: 30px;"></td>

						</tr>
						<tr>
							<td class="qna_desc qna_box">내용</td>
							<td colspan="2" style="padding-left: 8px;"><input type="text" 
									name="qcontent" placeholder="질문내용을 구체적으로 작성해주시면 더 빠르고 정확한 답변을 받으실 수 있습니다."
									style="width: 640px; height: 250px;"></input></td>
						</tr>
						<tr>
							<td class="qna_email qna_box">비밀번호 </td>
							<td colspan="2" style="padding-left: 8px;"><input type="password"
								name="qpw" style="width: 320px; height: 30px;">
							
<%-- 							<input type="hidden" name="qref" value="${param.qref}">
							<input type="hidden" name="qref_step" value="${param.qref_step}">
							<input type="hidden" name="qref_level" value="${param.qref_level}"> --%>
							</td>
						</tr>
						<tr>
							<td colspan="3">
							<button type="button" onclick="goRegister()"
								style="height: 50px; width: 134px; background-color: gray; border-radius: 8px;">접수하기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
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