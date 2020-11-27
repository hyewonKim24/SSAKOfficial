<link href="<%=request.getContextPath() %>/reset.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSAK ::</title>
<style>
/***************section****************/
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;

/***************section****************/
* {
	margin: 0;
}

body {
	width: 100%;
	position: relative;
	font-family: 'Noto Sans KR', sans-serif;
}

table, td {
	border-collapse: collapse;
}

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

li {
	list-style: none;
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

.xans-board-listheader {
	font-size: 13px;
	line-height: 140%;
}

.xans-board-listheader th {
	padding: 20px 0;
	vertical-align: middle;
	font-size: 12px;
}

.xans-board-listheader thead {
	border-top: 3px solid #425c5a;
	border-bottom: 1px solid gray;
}

.xans-board-listheader tbody tr {
	text-align: center;
	border-bottom: 1px solid #e8e8e8;
}

.xans-board-listheader tbody tr td {
	padding: 20px 0;
}

.nav_link .nav_text {
	text-align: center;
}

.nav_link .nav_text2 {
	text-align: center;
	padding-top: 30px;
}

.pagediv {
	margin: 60px 0 0;
	margin-bottom: 30px;
	text-align: center;
}


.layout-pagination-number {
	line-height: 40px;
}

.xans-board-search2 {
	height: 80px;
	padding: 0;
}

.xans-board-search {
	width: 100%;
	margin-top: 30px;
	border-top: 2px solid gray;
	clear: both;
}


.search_bt {
	padding-top: 10px;
	float: right;
	word-spacing: -4px;
}

#nSearch {
	width: 200px;
	height: 34px;
	border: 1px solid #bfbfbf;
	border-right: 0;
	box-sizing: border-box;
	vertical-align: middle;
}


#nSearchbtn {
	width: 34px;
	height: 34px;
	border: 1px solid #425c5a;
	box-sizing: border-box;
	padding: 0;
	vertical-align: middle;
	background-color: #425c5a;
	
}

/***************pagination   START ****************/
.pagediv {
	letter-spacing: -0.4px;
	word-spacing: -3px;
}
.pagediv a:hover {
	background: #fafafa;
	font-weight: 700;
	color: #425c5a;
}
.layout-pagination {
	margin: 60px 0 0;
	text-align: center;
}
.layout-pagination-button {
	display: inline-block;
	width: 34px;
	height: 34px;
	border: 1px solid #ddd;
	border-left: 0;
	vertical-align: top;
	font-size: 12px;
	line-height: 32px;
}
.layout-pagination-button:nth-child(1) {
	border-left: 1px solid #ddd !important;
}
.layout-back {
	/* 	background: url("./arrow-left2.png") no-repeat 50%; */
	background-size: 8px 8px;
	border-left: 1px solid #ddd !important;
}

.layout-next {
	/* 	background: url("./arrow-right2.png") no-repeat; */
	background-position: 50% 50%;
	background-size: 8px 8px;
}

/***************pagination   END ****************/
</style>
<script type="text/javascript">
function goSearch(){
	var frm = document.noticeSearch;
	frm.action="<%=request.getContextPath()%>/noticeSearch.do";
		frm.method = "post";
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
		<%-- 		<hr>${noticeList.size() } , ${startPage } , ${endPage} <hr> --%>
		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					공지사항 <span class="tit_sub"> ' ${nSearch} ' (으)로 검색한 결과입니다. </span>
				</h2>
			</div>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="xans-element- xans-myshop xans-myshop-couponserial ">
								<table width="100%" class="xans-board-listheader jh"
									cellpadding="0" cellspacing="0">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>등록일</th>
											<th>조회수</th>
										</tr>
									</thead>

									<!--목록 뿌리기 -->
									<c:if test="${not empty searchList}">
										<!--변경 : el태그 - servlet이랑 맞추기 -->
										<c:forEach items="${searchList}" var="v" varStatus="s">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<tr>
												<td>${v.ncount}</td>
												<td><a
													href="noticeDetail.do?nno=${v.nno}&pageNum=${s.count}">${v.ntitle}</a></td>
												<td>${v.ndate}</td>
												<td>${v.nview}</td>
											</tr>
										</c:forEach>
									</c:if>
									</tbody>

								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<!--페이징 아래 숫자-->
			<div class="pagediv">
				<c:if test="${startPage != 1}">
					<a href="noticeSearch.do?pageNum=${prev}"class="layout-pagination-button layout-back"><</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a href="noticeSearch.do?pageNum=${s.current}&nSearch=${nSearch}" class="layout-pagination-button">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a href="memberSearch?pageNum=${next}&msearchbar=${msearchbar}" class="layout-pagination-button layout-next">></a>
				</c:if>
			</div>
		</div>
		<table class="xans-board-search xans-board-search2">
			<tbody>
				<tr>
					<td>
					<div class="search_bt">
							<form name="noticeSearch" action="noticeSearch.do">
								
								 <input type="text" id="nSearch" name="nSearch"
									placeholder="검색어를 입력해주세요">
								<button type="button" id="nSearchbtn" name="nSearchbtn"
									onclick="goSearch()">
									<img src="./search-w.png" style="width: 15px; height: 15px;">
								</button>

							</form>
						</div>
					
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
