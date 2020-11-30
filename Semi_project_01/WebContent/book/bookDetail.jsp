<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bookDetail.css" />
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
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
<title>ssak, 나만의 책</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<script type="text/javascript">
//aside 드롭다운
$(document).ready(function () {
        $('.sub').hide();
        $('.title').click(function () {
            var checkElement = $(this).next();
            if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                $('#navi ul:visible').slideUp(400);
                return false;
            }
            if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                $('#navi ul:visible').slideUp(400);
                checkElement.slideDown(400);
                return false;
            }
        });
    });
	</script>
</head>
<body>
	<div id="bookdetail_wrap">
		<nav class="category_nav">
			<div class="classify">카테고리</div>
			<hr style="height: 1px; background-color: #dcdcdc; border-width: 0;">
			<ul id="navi">
				<li class="group">
					<div class="title">소설</div>
					<ul class="sub">
						<li>한국소설</li>
						<li>일본소설</li>
						<li>영미소설</li>
						<li>스페인/중남미소설</li>
						<li>프랑스소설</li>
						<li>독일소설</li>
						<li>중국소설</li>
						<li>러시아소설</li>
						<li>세계의 소설</li>
						<li>추리/미스터리소설</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">시/에세이</div>
					<ul class="sub">
						<li>한국에세이</li>
						<li>외국에세이</li>
						<li>동물에세이</li>
						<li>명상에세이</li>
						<li>심리치유에세이</li>
						<li>사진/그림에세이</li>
						<li>여행에세이</li>
						<li>독서에세이</li>
						<li>예술에세이</li>
						<li>종교에세이</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">자기계발</div>
					<ul class="sub">
						<li>성공</li>
						<li>리더십</li>
						<li>행복론</li>
						<li>인간관계</li>
						<li>힐링</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">인문/교양/철학</div>
					<ul class="sub">
						<li>사상가/인문학자</li>
						<li>교양 인문학</li>
						<li>인문 에세이</li>
						<li>이문 비평</li>
						<li>인문학전문사전</li>
						<li>철학 일반</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">역사/문화</div>
					<ul class="sub">
						<li>동양사일반</li>
						<li>북한사</li>
						<li>역사학</li>
						<li>한국사일반</li>
						<li>조선사</li>
						<li>한국근현대사</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">예술/대중문화</div>
					<ul class="sub">
						<li>컬러링북</li>
						<li>미술</li>
						<li>음악</li>
						<li>영화/드라마</li>
						<li>사진</li>
						<li>건축</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">학습/참고서</div>
					<ul class="sub">
						<li>공무원</li>
						<li>취업/상식</li>
						<li>운전면허</li>
						<li>한자시험</li>
						<li>경제/금융</li>
						<li>TESAT</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">컴퓨터/IT</div>
					<ul class="sub">
						<li>그래픽/멀티미디어</li>
						<li>모바일 프로그래밍</li>
						<li>스마트폰</li>
						<li>웹디자인</li>
						<li>컴퓨터공학</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">잡지</div>
					<ul class="sub">
						<li>건강/의학</li>
						<li>경제/경영</li>
						<li>과학/기술</li>
						<li>교육/취업</li>
						<li>시사지</li>
						<li>유아</li>
					</ul>
				</li>
				<li class="group">
					<div class="title">여행/지도</div>
					<ul class="sub">
						<li>국내 여행에세이</li>
						<li>제주도 여행</li>
						<li>캠핑여행</li>
						<li>미국여행</li>
						<li>프랑스여행</li>
						<li>북유럽여행</li>
					</ul>
				</li>
			</ul>
		</nav>
		

		<article id="detail_wrap">
			<div class="detail_book_img"></div>
			<div id="detail_book_desc">
				<p id="detail_category"></p>
				<div id="detail_title"></div>
				<div id="detail_descripton">
					<span id="detail_author">저자 : </span> <span id="detail_publisher">
						&nbsp; | &nbsp; 출판사 : </span> <span class="detail_pubDate">
						&nbsp;| &nbsp;출판일 : </span>
				</div>
				<hr class="detail_hr1" >

				<table id="price_table">
					<tr>
						<td>판매가 &nbsp; &nbsp;</td>
						<td id="detail_price" name="bookprice" colspan="2" style="text-align : right;"></td>
						<td>원</td>
					</tr>
					<tr>
						<td>배송료 &nbsp; &nbsp;</td>
						<td colspan="2">2500원</td>
					</tr>
				</table>

					<hr class="detail_hr1">
				<form name="detail_frm" id="detail_amount">
					<span id="detail_count">수량 </span>
					 <input type="number" value="1" min="1" max="50"
						 name="bookamount" id="bookamount">
					<span id="detail_order">
						<button type="button" class="detail_order_btn cartIn"><img src="<%=request.getContextPath() %>/imgs/shoppingcart_white.png" style="-webkit-filter: opacity(1) drop-shadow(0 0 0 white); filter: opacity(1) drop-shadow(0 0 0 white);"></button>
						<button type="button" class="detail_order_btn orderIn">구매하기</button>
						<button type="button" class="detail_order_btn bookcoverIn" onclick="goBookcustom();">북커버커스텀</button>
				<!-- <button type="button" class="detail_order_btn">
							<svg width="20px" height="15px" viewBox="0 0 16 16"
								class="bi bi-cart-fill" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd"
									d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z" />
                  </svg>
						</button> -->

					</span>
				</form>
					</div>
		</article>

		<div class="detail_book_more">
			<input type="radio" name="tab" class="d_tab" id="book_info" checked>
			<input type="radio" name="tab" class="d_tab" id="book_author">
			<input type="radio" name="tab" class="d_tab" id="book_delivery">
			<section class="detail_buttons">
				<label for="book_info">도서정보</label> 
				<label for="book_author">저자소개</label>
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
						ISBN : <span id="detail_bisbn"></span> <input type="hidden"
							id="bisbn" value="<%=bisbn%>">

					</p>
					<p>
						페이지수 : <span id="detail_pageNum"></span>
					</p>
					<br>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">책 소개</h3>
					<hr class="detail_hr2">
					<div class="detail_description" id="description"></div>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">목차</h3>
					<hr class="detail_hr2">
					<div class="detail_description" id="detail_top"></div>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">이 분야의 베스트셀러</h3>
					<hr class="detail_hr2">
					<br>
					
					<c:if test="${not empty bestseller }">
					<c:forEach items="${bestseller }" var="bst">
					<div class="detail_bestseller">
						<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${bst.BISBN}"> <img
							src="${bst.bcover }" width="140px"></a>
						<p id="bst_title"><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${bst.BISBN}">${bst.btitle }</a></p>
					</div>
					</c:forEach>
					</c:if>
				</div>

				<div class="detail_div_wrap">
					<h3 class="detail_font_large">반품/교환</h3>
					<hr class="detail_hr2">
					<div class="detail_table_wrap">
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
			var bisbn = $("#bisbn").val();
			console.log("bisbn"+bisbn);
			$('.cartIn').click(function () {
				
				var member="<%=member%>";
					if(member==null || member=="" ||member=="null"){
						console.log(member);
						alert('로그인 후 이용해주세요');
					}else{
				//mid ok, bisbn, oamount ok
				var stat = $('#bookamount').val(); //oamount
				console.log(stat);
				location.href = "CartInsert.do?bisbn=" +bisbn+"&oamount=" + stat;	
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
				
				location.href = "OrderDirect.do?bisbn=" +bisbn+ "&oamount=" + stat;	
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
					location.href = "./bookCustom.do?bisbn=" +bisbn+ "&bookamount=" + stat;	
				}
			});			
});
	</script>

</body>
</html>