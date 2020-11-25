<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../main/header.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="reset.css"></script>
<script type="text/javascript" src="plugin/jquery-3.5.1.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"></script>
<title>싹-신간도서</title>
<style>
ul {
	margin: 0;
	padding: 0;
}

#navi {
	cursor: pointer;
	padding-left: 40px;
}

.sub li {
	padding-left: 20px;
	font-size: 13px;
}

.new_content {
	width: 1080px;
	margin: 0 auto;
	display: flex;
	margin-top: 80px;
}

.new_content #category {
	float: left;
	width: 200px;
	height: 750px;
	margin-right: 60px;
	border: 1px solid #b9b6b6;
}

.classify {
	font-weight: bold;
	font-size: 30px;
	padding: 20px;
}

.new_content #category ul {
	font-size: 15px;
	padding-bottom: 11px;
}

.new_content #category ul li {
	list-style-type: none;
	margin: 10px 0;
}

#newbook {
	float: right;
	width: 820px;
}

#newbooktitle {
	font-size: 24px;
	margin-top: 20px;
}

#subtitle {
	font-size: 20px;
	/* font-weight: bold; */
	margin: 39px 15px 40px 0;
}

.noticeable {
	display: flex;
	flex-wrap: nowrap;
	list-style-type: none;
	text-align: center;
	width: 700px;
	margin: 0 auto;
}

.img_book {
	margin-right: 10px;
	width: 150px;
	height: 220px;
	margin: 0 auto;
}

.new_noticeable {
	margin: 2px;
	text-decoration: none;
	color: black;
}

.slick-prev:before, .slick-next:before {
	color: purple;
}
.pagediv {
	text-align: center;
}

#list_table {
	background-color: rgb(206, 206, 206);
	width: 820px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	margin: 60px 0 20px 0;
}

.list_btn {
	float: right;
	margin: 3px;
}

.list_btn button {
	background-color: lightgrey;
	border: gray solid 1px;
	border-radius: 8px;
	padding: 5px 10px;
}

#new_list {
	float: none;
	display: block;
}

#new_list ul {
	list-style-type: none;
}

#new_list ul a {
	text-decoration: none;
}

.new_list2 {
	display: flex;
	/* justify-content: space-around; */
	position: relative;
	padding-top:30px;
	padding-bottom:30px;
}

.new_thumb img {
	width: 180px;
}

.new_money {
	font-size: 17px;
}

.new_btn {
	float: right;
	position: absolute;
	right: 0;
}

.new_btn button {
	width: 130px;
	height: 50px;
	margin: 5px;
	background-color: white;
	border: gray solid 1px;
	border-radius: 8px;
}

.new_btn input {
	width: 30px;
	text-align: center;
}

.new_info {
	width: 480px;
}
.scr_btn {
	float: right;
}
</style>

<script type="text/javascript">
        $(document).ready(function () {
            $(".noticeable").slick({
                arrows: true,
                dots: true,
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 4,
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev"
                }
            });
        });

      //aside 드롭다운
      $(document).ready(function() {
      	$(".sub").css({
      		display : "none"
      	});
      	$(".title").click(function() {
      		$(".sub").each(function() {
      			console.log($(this).css("display"));
      			if ($(this).css("display") == "block") {
      				$(this).slideUp("fast");
      			}
      		});
      		$(this).next("ul").slideDown("fast");
      	})
      
      
		$('.cartIn').click(function () {
			//mid ok, bisbn, oamount ok
			var $t = $(this).parents('div.new_list2');
			
			var stat = $t.find('input.num').val(); //oamount
			console.log(stat);
			var bisbn = $t.find('input.bisbn').val();
			console.log(bisbn);
			if(stat<1){
				alert("주문은 한 개 이상부터 가능합니다.")
				$t.find('input.num').val(1);
			} else{
				location.href = "CartInsert?bisbn=" + bisbn + "&oamount=" + stat;	
			}
		});
		
		$('.orderIn').click(function () {
			//mid ok, bisbn, oamount ok
			var $t = $(this).parents('div.new_list2');
			
			var stat = $t.find('input.num').val(); //oamount
			console.log(stat);
			var bisbn = $t.find('input.bisbn').val();
			console.log(bisbn);
			if(stat<1){
				alert("주문은 한 개 이상부터 가능합니다.")
				$t.find('input.num').val(1);
			} else{
				location.href = "OrderDirect?bisbn=" + bisbn + "&oamount=" + stat;	
			}
		});
		
		$('#cartIns').click(function(){
			var checkbox = $("input[name=check]:checked");
			var checkboxVal = $("input[name=check]:checked").val();
			//console.log(checkbox);
			var bisbn = new Array();
			var stat = new Array();
			
			checkbox.each(function(){
				bisbn.push($(this).val());
				stat.push($(this).siblings('input[name=oamount]').val());
				if(stat<1){
					alert('상품을 한 개 이상 선택해주세요.');
					$(this).siblings('input[name=oamount]').val(1);
				}
			});	
			
			if(checkboxVal==null){
				alert("상품을 한 개 이상 선택해주세요.")
			} else{
				location.href = "CartInserts?bisbn=" + bisbn + "&oamount=" + stat;				
			}
		});
      });
    </script>

</head>

<body>
</head>
<div class="new_content">
	<aside id="category">
		<h3 class="classify">소설</h3>
		<hr style="border: solid 1px #bdbbbb;">
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
	</aside>
	<section id="newbook">
		<div id="bigSubtitle">
			<div id="newbooktitle">종합</div>
		</div>
		<hr style="margin-top:30px;">
		<div id="subtitle">주목할만한 신간도서</div>
		<div class="noticeable">
			<c:forEach items="${newList}" var="bsb" varStatus="a" begin="0"
				end="8">
				<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }" class="new_noticeable"> <img src="${bsb.bcover }"
					alt="book" class="img_book">
					<div class="noticeable_text">
						<span>${bsb.btitle }</span><br> <span>${bsb.bauthor }</span><br>
						<span>${bsb.bpricesales }</span>
					</div>
				</a>
			</c:forEach>
		</div>
		<!--Add Arrows-->
		<div class="swiper-button-next"></div>
		<div class="swiper-button-prev"></div>
		<table id="list_table">
			<tr>
				<td>
					<div class="list_btn">
						<button type="button" onclick="location.href='#'">전체선택</button>
						<button type="button" id="cartIns">장바구니 담기</button>
					</div>
				</td>
			</tr>
		</table>

		<div id="new_list">
			<c:if test="${not empty newList }">
				<c:forEach items="${newList}" var="bsb" varStatus="a">

					<div class="new_list2">
						<h3 class="new_num">${bsb.bno }</h3>
						<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }" class="new_thumb"> <img src="${bsb.bcover }"
							alt="book">
						</a>
						<div class="new_info">
							<ul>
								<li><a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }">${bsb.btitle }</a></li>
								<li class="new_block"><span>${bsb.bauthor }</span></li>
								<li class="new_money"><span>정가${bsb.bpriceStandard }->판매가(10%할인)${bsb.bpricesales
										}</span></li>
								<li class="new_text">${bsb.bdiscription }</li>
							</ul>
						</div>
						<div class="new_btn">
							<p>
								<input type="hidden" value="${bsb.BISBN}" name="bisbn" class="bisbn">
								<input type="hidden" value="0" name="dno" class="dno">
								<input class="checkbox" type="checkbox" name="check" value="${bsb.BISBN}"> <span
									class="new_num" >수량</span> <input type="number" id="cntVal_1234"
									value="1" class="num" size="3" name="oamount">
							</p>
							<button type="button" class="cartIn">장바구니</button>
							</br>
							<button type="button" class="orderIn">구매하기</button>
							</br>
							<button type="button" onclick="location.href='#'">북커버
								커스텀</button>
						</div>
					</div>
					<hr>
				</c:forEach>
			</c:if>

		</div>
		<div class="pagediv">
		<c:if test="${startPage != 1}">
			<a href="/bookNew.do?pageNum=${prev}">이전</a>
				</c:if>
			<c:if test="${startPage != endPage}">
				<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
					step="1">
					<a href="<%=ctxPath %>/bookNew.do?pageNum=${s.current}">${s.current}</a>
					<!--변경 : href 경로 -->
				</c:forEach>
			</c:if>
			<c:if test="${next < pageCount}">
					<a href="<%=ctxPath %>/bookNew.do?pageNum=${next}">다음</a>
				</c:if>
			</div>
			<div class="scr_btn">
				<!-- <a href="#" onClick="javascript:window.scrollTo(0,0)">맨 위로</a>  -->
				<input type="image" src="../imgs/arrow-circle-up.png"
					style="width: 40px;" onClick="javascript:window.scrollTo(0,0)"
					alt="맨위로" />
			</div>
	</section>
</div>
</body>

</html>