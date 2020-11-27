<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	border-radius: 0 30px 30px 0;
}

#c_nav .nav_link .emph {
	display: block;
	padding-bottom: 1px;
	font-weight: 700;
	font-size: 14px;
	text-align: center;
}

/***************side menu   END ****************/





/***************page_section   START ****************/
.page_section {
	float: right;
	width: 820px;
}
.head_aticle {
	padding: 5px 0 10px;
	padding-bottom: 42px;
}
.tit_a {
	font-size: 24px;
	padding-bottom: 34px;
}
.tit_sub {
	padding-left: 11px;
	font-size: 14px;
	color: #999;
	line-height: 20px;
	letter-spacing: -.3px;
	vertical-align: 3px;
}

.qtitle {
	text-align: left;
	padding-left: 70px;
}








.board-listheader {
	font-size: 13px;
	line-height: 140%;
}

.board-listheader th {
	padding: 20px 0;
	vertical-align: middle;
	font-size: 12px;
}

.board-listheader thead {
	border-top: 3px solid #425c5a;
	border-bottom: 1px solid gray;
}

.board-listheader tbody tr {
	text-align: center;
	border-bottom: 1px solid #e8e8e8;
}

.board-listheader tbody td a {
	color: #555;
}

.board-listheader tbody tr td {
	padding-top: 20px;
	padding-bottom: 20px;
}


/***************page_section   END ****************/



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

#qWritebtn {
	float: right;
	padding-bottom: 16px;
}
#qWrite {
	width: 100px;
	line-height: 30px;
	font-size: 13px;
	text-align: center;
	background-color: #425c5a;
	border: 1px solid #425c5a;
	color: #fff;
}




/***************SEARCH   START ****************/
.board-search {
	width: 100%;
	border-top: 2px solid #425c5a;
	clear: both;
}
.board-search2 {
	height: 60px;
	padding: 0;
}

/* .xans-board-search input[type=text] {
	float: right;
	height: 34px;
	width: 220px;
} */

.search_bt {
	padding-top: 10px;
	float: right;
	word-spacing: -4px;
}
.opt_bt {
	height: 34px;
	border: 1px solid #bfbfbf;
	border-right: 0;
}
#qSearch {
	width: 200px;
	height: 34px;
	border: 1px solid #bfbfbf;
	border-right: 0;
	box-sizing: border-box;
	vertical-align: middle;
}
#qSearchbtn {
	width: 34px;
	height: 34px;
	border: 1px solid #425c5a;
	box-sizing: border-box;
	padding: 0;
	vertical-align: middle;
	background-color: #425c5a;
}


a.current {
	background-color: #fafafa;
	color: #425c5a !important;
	font-weight: 700;
}

/***************SEARCH   END ****************/


/***************section****************/
</style>
<script type="text/javascript">
function goSearch(){
   var frm = document.qnaSearch;
   	frm.action="<%=request.getContextPath()%>/qnaSearch.do";
      frm.method = "post";
      frm.submit();

      /*       var a = $("#qSearch").val();
       console.log(a);
       $.ajax({
       url : "qnaSearch.do",
       data : {qSearch : a   },
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
				<h2 class="tit_a">
					1:1 문의하기 <span class="tit_sub"> 고객님의 문의사항에 최대한 만족할 수 있는 답변을
						드리도록 노력하겠습니다. </span>
				</h2>
			</div>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="section_t">
								<table width="100%" class="board-listheader" cellpadding="0" cellspacing="0">
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
                                             답글 : <a href="qnaDetail.do?qno=${v.qno}&pageNum=${s.count}">${v.qtitle}</a>
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

			<script>
$(function () {
    $('.layout-pagination-button').each(function () {
        if ($(this).prop('href') == window.location.href) {
            $(this).addClass('current');
        }
    });
});
</script>


			<div class="layout-pagination">
				<div class="pagediv">
					<c:if test="${startPage != 1}">
						<a href="qnaList.do?pageNum=${prev}"
							class="layout-pagination-button layout-back"><</a>
					</c:if>
					<c:if test="${startPage != endPage}">
						<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
							step="1">
							<a href="qnaList.do?pageNum=${s.current}"
								class="layout-pagination-button">${s.current}</a>
							<!--변경 : href 경로 -->
						</c:forEach>
					</c:if>
					<c:if test="${next < pageCount}">
						<a href="qnaList.do?pageNum=${next}"
							class="layout-pagination-button layout-next">></a>
					</c:if>
				</div>



				<div id="qWritebtn">
					<button type="button" id="qWrite" name="qWrite"
						onclick="location.href='./qnaWrite.jsp'">글쓰기</button>
				</div>
			</div>
		</div>



		<table class="board-search board-search2">
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
								 <input type="text" id="qSearch" name="qSearch"
									placeholder="검색어를 입력해주세요">
								<button type="button" id="qSearchbtn" name="qSearchbtn"
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