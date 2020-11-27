<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<title>Document</title>
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
}

#c_nav {
	float: left;
	width: 200px;
	padding-bottom: 10px;
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
	padding-top: 20px;
	padding-bottom: 20px;
}

.qtitle {
	text-align: left;
	padding-left: 70px;
}

.nav_link .nav_text {
	text-align: center;
}

.nav_link .nav_text2 {
	text-align: center;
	padding-top: 30px;
}

.pagediv {
	display: inline-block;
	text-align: center;
	margin-left: 200px;
	margin-top: 12px;
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

.page_write {
	display: inline-block;
	width: 134px;
	height: 45px;
	background-color: gray;
	margin-left: 155px;
	border-radius: 6px;
	text-align: center;
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

/***************section****************/
</style>
<script type="text/javascript">
function goSearch(){
	var frm = document.qnaSearch;
	frm.action="<%=request.getContextPath()%>/qnaSearch.do";
		frm.method = "post";
		frm.submit();

/* 		var a = $("#qSearch").val();
		console.log(a);
		$.ajax({
			url : "qnaSearch.do",
			data : {qSearch : a	},
			type : "get",
			success : function(res) {
				console.log(res);
				if(res == null){
					alert("검색어를 하나 이상 입력해주세요.");
				} else {
					loction.href = "qnaSearch.do";
				} 
			}
		})*/
	}
</script>
</head>

<body>
	<c:if test="${msg =='delete'}">
		<c:set var="msg" value="삭제시 비밀번호가 틀렸습니다." />
	</c:if>
	
	<c:if test="${not empty search_error }">
		<script>
			alert('${search_error}');
		</script>
	</c:if>
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
											<th width="50%;">제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<!--목록 뿌리기 -->
										<c:if test="${not empty qnaList}">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<c:forEach items="${qnaList}" var="v" varStatus="s">
												<tr>
													<td>${v.qno}</td>
													<td class="qtitle"><c:if test="${v.qref_step=='1'}">
															<a href="qnaDetail.do?qno=${v.qno}&pageNum=${s.count}">${v.qtitle}</a>
														</c:if> <c:if test="${v.qref_step=='2'}">
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															답글 : <a
																href="qnaDetail.do?qno=${v.qno}&pageNum=${s.count}">${v.qtitle}</a>
														</c:if></td>
													<td>${v.mid}</td>
													<td><fmt:formatDate value="${v.qdate}"
															pattern="yyyy-MM-dd" var="date" /> ${date}</td>
													<td>${v.qview}</td>
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
					<a href="qnaList.do?pageNum=${prev}">이전</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">

						<a href="qnaList.do?pageNum=${s.current}">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a href="qnaList.do?pageNum=${next}">다음</a>
				</c:if>
			</div>
			<div id="qWritebtn">
				<button type="button" id="qWrite" name="qWrite"
					onclick="location.href='./qna/qnaWrite.jsp'">글쓰기</button>
			</div>
		</div>
	</div>
	<table class="xans-board-search xans-board-search2">
		<tbody>
			<tr>
				<td>
					<div class="search_bt">
						<form name="qnaSearch" action="qnaSearch.do">
							<select class="opt_bt" name="qtype">
								<option value="전체">전체</option>
								<option value="주문결제">주문/결제</option>
								<option value="커스텀문의">커스텀문의</option>
								<option value="배송문의">배송문의</option>
								<option value="회원문의">회원문의</option>
								<option value="기타">기타</option>
							</select>
							<button type="button" id="qSearchbtn" name="qSearchbtn"
								onclick="goSearch()">검색</button>
							<input type="text" id="qSearch" name="qSearch"
								placeholder="검색어를 입력해주세요">
						</form>
					</div>
				</td>
			</tr>
		</tbody>
	</table>

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