<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	outline: none;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	letter-spacing: -0.4px;
	width: 100%;
	position: relative;
	color: #333333;
	line-height: 24px;
}

a {
	color: #333333;
	text-decoration: none;
}

.Header {
	position:relative;
	z-index:999;	
	width: 100%;
	height: 190px;
	box-shadow: 0px 0px 7px #D5D5D5;
}

table, td {
	border-collapse: collapse;
}
/* 메인_회원가입 */
#mHeader1 {
	position: relative;
	width: 100%;
	height: 35px;
	background-color: white;
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
	padding: 0px 5px 0px 5px;
	font-size: 12px;
	letter-spacing: -.3px;
}


.mSubnav_dropdown{
	position: absolute;
	display: none;
	width: 100px;
	height: auto;
	font-size: 12px;
	padding: 5px;
	line-height: 200%;
	margin-top:0;
	z-index:9999;
}

/* 로고 */
#mHeader2 {
	position: relative;
	width: 100%;
	height: 90px;
}

.mLogoWrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
}

#mLogo {
	position: absolute;
	width: 110px;
	heigth: 72px;
	margin: 0 40%;
}
/* 메인_네비 */
#mHeader3 {
	position: relative;
	width: 100%;
	height: 60px;
	background-color: white;
}

#mHeader3.fixed {
	position: fixed;
	height: 60px;
	z-index: 1;
	box-shadow: 0px 1px 3px #D5D5D5;
	top: 0;
}

.mMainnav_wrap {
	position: relative;
	width: 1080px;
	margin: 0 auto;
	z-index: 1;
}

.mMainnav_wrap #menubar {
	margin-right: 15px;
	transform: translateY(4px);
	width: 24px;
	height: 23px;
}

.mMainnav_wrap ul {
	width: 70%;
	height: 60px;
	line-height: 60px;
	float: left;
	list-style: none;
}

.mMainnav_wrap ul li {
	float: left;
	padding: 0 22px 0 22px;
}

.mMainnav_wrap ul li a:hover {
	color: #425c5a;
}
/* 드롭다운 */
.mMainnav_wrap li ul {
	display: none;
	width: auto;
	height: auto;
	position: absolute;
	padding: 10px;
	line-height: 250%;
}

.mMainnav_wrap li:hover ul {
	clear: both;
	display: block;
	width: 150px; 
	background-color: rgba(253, 253, 253, 0.8);
/* 	transform : translateY(5px); */
}

.mMainnav_wrap ul li a {
	line-height: 20px;
	font-size: 15px;
	font-weight: 500;
}

.menu_line {
	color: #DCDCDC;
	font-size: 3px;
}

.mSearch {
	position: absolute;
	width: 30%;
	height: 60px;
	right: 0;
}

.mSearchBar_wrap {
	float: left;
	width: 60%;
	height: 30px;
	background-color: #F2F2F2;
	margin-top: 12px;
	margin-left: 75px;
	border-radius: 20px 20px 20px 20px;
}

#mSearchBar {
	vertical-align: top;
	width: 70%;
	height: 30px;
	margin-left: 20px;
	background-color: #F2F2F2;
	border: none;
	box-sizing: border-box;
	border-radius: 20px 20px 20px 20px;
	outline: none;
	cursor: text;
}

#mSearchBtn {
	margin-right: 5px;
	padding: 0;
	width: 10%;
	box-sizing: border-box;
	background-color: #F2F2F2;
	border-radius: 20px 20px 20px 20px;
	border: none;
	cursor: pointer;
}

#mSearchBtn img {
	padding-top: 5px;
	background-color: none;
}

#mCart {
	margin: 0;
	float: right;
	background-color: white;
	border: none;
	padding: 12px;
	cursor: pointer;
}

</style>
<script>
	$(document).ready(function() {
		var Mnav = $("#mHeader3").offset().top;
		$(window).scroll(function() {
			var window = $(this).scrollTop();
			if (Mnav <= window) {
				$("#mHeader3").addClass("fixed");
			} else {
				$("#mHeader3").removeClass("fixed");
			}
		});
	$(".mSubnav_cs").click(function(){
		$(".mSubnav_dropdown").toggle();
	});
	});
	
</script>
</head>
<body>
	<div class="Header">
		<div id="mHeader1">
			<div class="mSubnav">
				<nav>
					<c:if test="${empty member}">
						<ul>
							<li><a href="<%=ctxPath%>/member/memberRegister.jsp">회원가입</a></li>
							<li class="menu_line">|</li>
							<li><a href="<%=ctxPath%>/member/memberLogin.jsp">로그인</a></li>
							<li class="menu_line">|</li>
							<li><a href="#" class="mSubnav_cs">고객센터&nbsp;▼</a>
								<ul class="mSubnav_dropdown">
									<li><a href="<%=ctxPath%>/noticeList.do">공지사항</a></li>
									<li><a href="<%=ctxPath%>/qna/fq.jsp">자주하는 질문</a></li>
									<li><a href="<%=ctxPath %>/qnaList.do">1:1 문의</a></li>
								</ul></li>
						</ul>
					</c:if>

					<c:if test="${not empty member}">
						<c:if test="${member.authority eq 0}">
						<ul>
							<li><a href="<%=ctxPath%>/member/myOrderList.jsp">마이페이지</a></li>
							<li><a href="<%=ctxPath%>/memberLogout.do">로그아웃</a></li>
							<li><a href="#" class="mSubnav_cs">고객센터&nbsp;▼</a>
								<ul class="mSubnav_dropdown">
									<li><a href="<%=ctxPath%>/noticeList.do">공지사항</a></li>
									<li><a href="<%=ctxPath%>/qna/fq.jsp">자주하는 질문</a></li>
									<li><a href="<%=ctxPath %>/qnaList.do">1:1 문의</a></li>
								</ul></li>
						</ul>
					</c:if>
						<c:if test="${member.authority eq 1}">
						<ul>
							<li><a href="<%=ctxPath%>/member/memberList">회원관리</a></li>
							<li><a href="<%=ctxPath%>/memberLogout.do">로그아웃</a></li>
							<li><a href="#" class="mSubnav_cs">고객센터&nbsp;▼</a>
								<ul class="mSubnav_dropdown">
									<li><a href="<%=ctxPath%>/noticeList.do">공지사항</a></li>
									<li><a href="<%=ctxPath%>/qna/fq.jsp">자주하는 질문</a></li>
									<li><a href="<%=ctxPath %>/qnaList.do">1:1 문의</a></li>
								</ul></li>
						</ul>
						</c:if>
						</c:if>
				</nav>
			</div>
		</div>
		<div id="mHeader2">
			<div class="mLogoWrap">
				<a href="<%=ctxPath%>/ssakMain.do"><img
					src="<%=ctxPath %>/imgs/ssak_logo_darkGreen.png;" id="mLogo" width="110px" height="74px"></a>
			</div>
		</div>
		<div id="mHeader3">
			<div class="mMainnav_wrap">
				<nav>
					<ul>
						<li><img src="<%=ctxPath %>/imgs/menu.png" id="menubar" alt="menubar">
							<a href="<%=ctxPath %>/bookCategory.do">카테고리</a>
							<ul id="mMainnav_dropdown">
								<li><a href="<%=ctxPath %>/bookCategory.do">소설</a></li>
								<li><a href="#">시/에세이/개발</a></li>
								<li><a href="#">자기계발</a></li>
								<li><a href="#">인문/교양/철학</a></li>
								<li><a href="#">역사/문화</a></li>
								<li><a href="#">예술/대중문화</a></li>
								<li><a href="#">학습/참고서</a></li>
								<li><a href="#">컴퓨터/IT</a></li>
								<li><a href="#">잡지</a></li>
								<li><a href="#">여행/지도</a></li>
							</ul></li>

						<li class="menu_line">|</li>
						<li><a href="<%=ctxPath %>/bookBestSeller.do">베스트 셀러</a></li>
						<li class="menu_line">|</li>
						<li><a href="<%=ctxPath %>/bookNew.do">새로나온 책</a></li>
						<li class="menu_line">|</li>
						<li><a href="#">이벤트</a></li>
						<li class="menu_line">|</li>
						<li><a href="<%=ctxPath%>/book/bookCustom01.jsp">CUSTOM</a></li>
					</ul>
				</nav>

				<div class="mSearch">
					<form action="<%=ctxPath %>/bookSearch.do" class="mSearchBar_wrap" method="get">
						<input type="text" id="mSearchBar" name="mSearchBar">
						<button type="submit" id="mSearchBtn">
							<img src="<%=ctxPath %>/imgs/search.png" style="width: 20px; height: 20px;">
						</button>
					</form>
					<button type="button" id="mCart">
						<img src="<%=ctxPath %>/imgs/shoppingcart.png"
							style="width: 28px; height: 28px;">
					</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>