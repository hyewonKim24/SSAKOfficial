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
	font-size: 14px;
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
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	background-color: gainsboro;
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

.layout-pagination-button {
	display: inline-block;
	width: 45px;
	height: 40px;
	border: 1px solid #ddd;
	border-radius: 7px;
	background-color: #dddd;
	vertical-align: top;
	margin: 0 2px 0 2px;
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

.xans-board-search input[type=text] {
	float: right;
	height: 34px;
	width: 220px;
}

.search_bt {
	padding-top: 10px;
}

#nWritebtn {
	right: 0;
}

#nSearchbtn {
	float: right;
	margin-left: 10px;
}
</style>
<script type="text/javascript">
function goSearch(){
	var frm = document.noticeSearch;
	frm.action="<%=request.getContextPath()%>/noticeSearch.do";
		frm.method = "post";
		frm.submit();
/* 	var a = $("#nSearch").val();
	console.log(a);
	$.ajax({
		url:"noticeSearch.do",
		data:{ nSearch : a },
		type: "get",
		success : function(res){
				console.log(res);
				if(res == null){
					alert("검색어를 하나 이상 입력해주세요.");
				} else {
					loction.href = "noticeSearch.do";
				}
		}
		}) */
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
					<a href="noticeSearch.do?pageNum=${prev}">이전</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a href="noticeSearch.do?pageNum=${s.current}&nSearch=${nSearch}">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a href="noticeSearch.do?pageNum=${next}">다음</a>
				</c:if>
			</div>



		</div>
		<table class="xans-board-search xans-board-search2">
			<tbody>
				<tr>
					<td>
						<div class="search_bt">
							<form name="noticeSearch" action="noticeSearch.do">
								<button type="button" id="nSearchbtn" name="nSearchbtn"
									onclick="goSearch()">검색</button>
								<input type="text" name="nSearch" placeholder="검색어를 입력해주세요">
							</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
