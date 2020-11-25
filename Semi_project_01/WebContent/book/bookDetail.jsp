<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<%@ include file="../main/recentSide.jsp"%>
<%
	String bisbn = request.getParameter("bisbn");
System.out.println(bisbn);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>책 상세페이지</title>
<script src="../css/reset.css"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0 auto;
}

#bookdetail_wrap {
	margin: 0 auto;
	width: 1080px;
	padding-top: 60px;
}

.classify {
	font-weight: bold;
	margin: 0 0 10px 0;
}

.category_nav a {
	text-decoration: none;
	color: black;
}
/* 왼쪽 */
.category_nav {
	width: 200px;
	height: 700px;
	display: block;
	float: left;
	box-sizing: border-box;
	border: 1px solid black;
}

.category_nav {
	padding: 20px;
}

.category_nav ul>li {
	padding-left: 20px;
	margin-left: 20px;
	line-height: 20px;
	font-size: 12px;
}

.category_nav ol>li {
	font-size: 15px;
	line-height: 30px;
}

.category_list {
	display: none;
}

/* 오른쪽 */
#detail_wrap {
	width: 880px;
	display: flex;
}

.detail_book_img {
	padding: 10px;
	display: block;
	width: 200px;
	float: left;
	margin: 0 20px 0 60px;
}

#detail_book_desc {
	display: block;
	float: right;
	padding: 10px;
}

#detail_category {
	font-size: 12px;
	margin-bottom: 20px;
}

.detail_title {
	font: bold;
	font-size: 20px;
}

.detail_font_large {
	font: bold;
	margin: 10px 0 10px 0;
	font-size: 20px;
}

#detail_descripton {
	margin: 25px 0 25px 0;
}

#detail_hr {
	border: 0;
	height: 1px;
	color: lightgray;
}

#detail_table {
	margin: 25px 0 25px 0;
}

#detail_table {
	line-height: 20px;
}

#detail_amount {
	margin: 25px 0 25px 0;
	line-height: 20px;
}

#detail_order {
	margin-left: 140px
}

.detail_order_btn {
	margin: 0 10px 0 5px;
	border: 1px solid lightgray;
	height: 25px;
	border-radius: 10%;
	background-color: white;
	line-height: 20px;
}

section {
	margin-left: 60px;
	width: 820px;
}

section.detail_buttons>label {
	display: block;
	float: left;
	width: 273px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border: 1px solid black;
	background: black;
	color: white;
	box-sizing: border-box;
}

.d_tab:nth-of-type(1) {
	display: none;
}

.d_tab:nth-of-type(1) ~div:nth-of-type(1) {
	display: none;
}

.d_tab:nth-of-type(1):checked ~.detail_book_info:nth-of-type(1) {
	display: block;
}

.d_tab:nth-of-type(1):checked ~section.detail_buttons>label:nth-of-type(1)
	{
	background: white;
	color: black;
}

.d_tab:nth-of-type(2) {
	display: none;
}

.d_tab:nth-of-type(2) ~.div:nth-of-type(2) {
	display: block;
}

.d_tab:nth-of-type(2):checked ~.div:nth-of-type(2) {
	display: block;
}

.d_tab:nth-of-type(2):checked ~section.detail_buttons>label:nth-of-type(2)
	{
	background: white;
	color: black;
}

.d_tab:nth-of-type(3) {
	display: none;
}

.d_tab:nth-of-type(3) ~div:nth-of-type(3) {
	display: none;
}

.d_tab:nth-of-type(3):checked ~div:nth-of-type(3) {
	display: block;
}

.d_tab:nth-of-type(3):checked ~section.detail_buttons>label:nth-of-type(3)
	{
	background: white;
	color: black;
}

section.detail_buttons {
	overflow: hidden;
}

.detail_div_wrap {
	width: 820px;
}

#price_table {
	margin: 10px 0 10px 0;
	line-height: 20px;
}

#detail_book_info_wrap {
	width: 780px;
	padding: 20px;
}

.detail_book_info {
	margin-left: 60px;
}

.detail_book_more {
	display: block;
	position: relative;
	margin-left: 200px;
	width: 820px;
	line-height: 20px;
}

.detail_description {
	line-height: 20px;
}

#bst_title {
	width: 150px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.detail_bestseller {
	margin-left: 9px;
	display: inline-block;
}

.detail_bestseller>p {
	text-align: center;
}

.detail_table {
	border: 1px solid black;
	width: 800px;
}

.detail_table_th {
	width: 100px;
	background-color: lightgray;
	text-align: center;
	line-height: 30px;
	border-bottom: 1px solid black;
	border-right: 1px solid black;
}

.detail_table td {
	border-bottom: 1px solid black;
	border-right: 1px solid black;
	text-align: center;
}
</style>

</head>
<body>

	<header> </header>

	<div id="bookdetail_wrap">
		<nav class="category_nav">
			<h3 class="classify">카테고리</h3>
			<hr>
			<ol>
				<li class="category_ol"><a href="#">소설</a></li>
				<ul class="category_list">
					<li>한국소설</li>
					<li>일본소설</li>
					<li>영미소설</li>
					<li>스페인/중남미소설</li>
					<li>프랑스소설</li>
					<li>독일소설</li>
					<li>중국소설</li>
					<li>러시아소설</li>
					<li>세계의소설</li>
					<li>추리/미스테리 소설</li>
				</ul>
				<li>시/에세이</li>
				<li>자기계발</li>
				<li>인문/교양/철학</li>
				<li>역사/문화</li>
				<li>예술/대중문화</li>
				<li>학습/참고서</li>
				<li>컴퓨터/IT</li>
				<li>잡지</li>
				<li>여행/지도</li>
			</ol>

		</nav>
		<script>
			$(".category_ol").click(function() {
				$(".category_list").toggle();
			});
		</script>

		<article id="detail_wrap">
			<div class="detail_book_img"></div>
			<div id="detail_book_desc">
				<p id="detail_category"></p>
				<h3 id="detail_title"></h3>
				<div id="detail_descripton">
					<span id="detail_author">저자 : </span> <span id="detail_publisher">
						&nbsp; | &nbsp; 출판사 : </span> <span class="detail_pubDate">
						&nbsp;| &nbsp;출판일 : </span>
				</div>
				<hr id="detail_hr" width="570" color="gray" height="1px">

				<table id="price_table">
					<tr>
						<td>판매가 &nbsp; &nbsp;</td>
						<td id="detail_price" name="bookprice" colspan="2"></td>
						<td>원</td>
					</tr>
					<tr>
						<td>배송료 &nbsp; &nbsp;</td>
						<td colspan="2">무료배송</td>
					</tr>
				</table>

				<form name="detail_frm" id="detail_amount">
					<hr id="detail_hr" width="570" color="gray" height="1px">
					<span>수량 </span> <input type="number" value="1" min="1" max="50"
						width="10px" margin-right="20px" name="bookamount" id="bookamount">
					<span id="detail_order">
						<button type="button" class="detail_order_btn cartIn">장바구니</button>
						<button type="button" class="detail_order_btn orderIn">구매하기</button>
						<button type="button" class="detail_order_btn bookcoverIn">북커버커스텀</button>
					</span>
					<p></p>
				</form>
			</div>
		</article>

		<div class="detail_book_more">
			<input type="radio" name="tab" class="d_tab" id="book_info" checked>
			<input type="radio" name="tab" class="d_tab" id="book_author">
			<input type="radio" name="tab" class="d_tab" id="book_delivery">
			<section class="detail_buttons">
				<label for="book_info">도서정보</label> <label for="book_author">저자소개</label>
				<label for="book_delivery">배송/반품/교환</label>
				<!--    <hr id="detail_hr" width="820" color="black" height="1px"> -->
			</section>


			<div class="detail_book_info"></div>


			<div class="detail_book_info">
				<div id="detail_book_info_wrap">
					<p>
						출간정보 : <span class="detail_pubDate"></span>출간
					</p>
					<p>
						ISBN : <span id="detail_bisbn"></span>
					</p>
					<p>
						페이지수 : <span id="detail_pageNum"></span>
					</p>
					<br>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">책 소개</h3>
					<hr id="detail_hr" width="820px" color="black" height="1px">
					<br>
					<div class="detail_description" id="description"></div>
					<br> <br> <br>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">목차</h3>
					<hr id="detail_hr" width="820px" color="black" height="1px">
					<br>

					<div class="detail_description" id="detail_top"></div>
					<br> <br> <br>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">이 분야의 베스트셀러</h3>
					<hr id="detail_hr" width="820px" color="black" height="1px">
					<br>

					<c:if test="${not empty bestseller }">
						<c:forEach items="${bestseller }" var="bst">
							<div class="detail_bestseller">
								<a
									href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${bst.BISBN}">
									<img src="${bst.bcover }" width="140px">
								</a>
								<p id="bst_title">
									<a
										href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${bst.BISBN}">${bst.btitle }</a>
								</p>
							</div>
						</c:forEach>
					</c:if>
					<br> <br> <br>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">반품/교환</h3>
					<hr id="detail_hr" width="820px" color="black" height="1px">
					<br>

					<table class="detail_table">
						<tr>
							<td class="detail_table_th">반품/교환 방법</td>
							<td>홈 > 고객센터 > 자주찾는 질문 "반품/교환/환불"안내 참고 또는 1:1 상담게시판</td>
						</tr>
						<tr>
							<td class="detail_table_th">반품/교환 가능 기간</td>
							<td>반품, 교환은 배송완료 후 7일 이내, 상품의 결함 및 계약내용과 다를 경우 문제발견후 30일 이내
								신청가능</td>
						</tr>
						<tr>
							<td class="detail_table_th">반품/교환 비용</td>
							<td>변심 혹은 구매착오의 경우에만 반송료 고객 부담(별도 지정 택배사 없음)</td>
						</tr>
						<tr>
							<td class="detail_table_th">반품 교환 불가 사유</td>
							<td>
								<ol>
									<li>소비자의 책임 사유로 상품 등이 손실 또는 훼손된 경우</li>
									<li>소비자의 사용, 포장 개봉에 의해 상품 등의 가치가 현저히 감소한 경우</li>
									<li>복제가 가능한 상품 등의 포장을 훼손한 경우</li>
									<li>소비자의 요청에 따라 개별적으로 주문 제작되는 상품의 경우</li>
									<li>시간의 경과에 의해 재판매가 곤란한 정도로 가치가 현저히 감소한 경우</li>
									<li>전자상거래 등에서의 소비자보호에 관한 법률이 정하는 소비자 청약철회 제한 내용에 해당되는 경우</li>
								</ol>
							</td>
						</tr>

					</table>
					<br> <br> <br>
				</div>

			</div>

		</div>

	</div>
	</div>
	</div>
	</div>
	<script>
		function abc(success, data) {
			console.log(data);
			var title = data.item[0].title;
			var cover = data.item[0].cover;
			var author = data.item[0].author;
			var categoryId = data.item[0].categoryId;
			var isbn = data.item[0].isbn;
			var priceSales = data.item[0].priceSales;
			var priceStandard = data.item[0].priceStandard;
			var pubDate = data.item[0].pubDate;
			var publisher = data.item[0].publisher;
			var toc = data.item[0].bookinfo.toc;
			var categoryName = data.item[0].bookinfo.categoryName;
			var description = data.item[0].description;
			var itemPage = data.item[0].bookinfo.itemPage;
			console.log(title);
			$("#detail_title").text(title);
			$("#detail_category").append(categoryName);
			var cover = ("<img src='"+cover+"'/>");
			$(".detail_book_img").append(cover);
			$("#detail_author").append(author);
			$("#description").append(description);
			$("#detail_publisher").append(publisher);
			$("#detail_top").append(toc);
			$(".detail_pubDate").append(pubDate);
			$("#detail_bisbn").append(isbn);
			$("#detail_pageNum").append(itemPage);
			$("#detail_price").append(priceSales);
		}
		//요청에 대한 정보
		$.ajax({
			method : "get",
			dataType : "jsonp",
			url : "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx",
			data : {
				TTBKey : "ttbhagalaz04301822001",
				ItemId : "<%=bisbn%>",
				output : "JS",
				cover : "big",
				callback : "abc"
			}

		})
		
		<%String member = String.valueOf(session.getAttribute("member"));%>
		$(document).ready(function () {
			
			$('.cartIn').click(function () {
				
				var member="<%=member%>";
					if(member==null || member=="" ||member=="null"){
						console.log(member);
						alert('로그인 후 이용해주세요');
					}else{
				//mid ok, bisbn, oamount ok
				var stat = $('#bookamount').val(); //oamount
				console.log(stat);
				location.href = "CartInsert?bisbn=" + <%=bisbn%> + "&oamount=" + stat;	
			}
			});
			
			$('.orderIn').click(function () {
				
				var member="<%=member%>";
				if(member==null || member=="" ||member=="null"){
					console.log(member);
					alert('로그인 후 이용해주세요');
				}else{
				//mid ok, bisbn, oamount ok
				var stat = $('#bookamount').val(); //oamount
				console.log(stat);
				
				location.href = "OrderDirect?bisbn=" + <%=bisbn%> + "&oamount=" + stat;	
				}
			});
			
			//북커버로 이동
			$('.bookcoverIn').click(function () {
				
				var member="<%=member%>";
				if(member==null || member=="" ||member=="null"){
					console.log(member);
					alert('로그인 후 이용해주세요');
				}else{
				//mid ok, bisbn, oamount ok
				
				var stat = $('#bookamount').val(); //oamount
				console.log(stat);
					location.href = "./bookCustom.do?bisbn='" + <%=bisbn%> + "'&bookamount=" + stat;	
				}
			});			

});
	</script>

</body>
</html>