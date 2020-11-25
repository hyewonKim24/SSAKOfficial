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
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.js"></script>
<title>카테고리-소설</title>
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

.bestseller {
	width: 1080px;
	margin: 0 auto;
	display: flex;
	margin-top: 80px;
}

a {
	text-decoration: none;
}

#category {
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

.bestseller #category ul {
	font-size: 15px;
	padding-bottom: 11px;
}

.bestseller #category ul li {
	list-style-type: none;
	margin: 10px 0;
}

#bestseller__Nobel {
	float: right;
	width: 820px;
}

.bestseller__class {
	display: flex;
	justify-content: space-between;
	margin-bottom: 30px;
}

.bestseller__class .subtitle {
	margin: 0, 0, 20px, 0;
}

.subtitle {
	font-size: 18px;
	font-weight: bold;
	margin: 15px 15px 15px 0;
}

.additem {
	font-size: 13px;
	margin: auto 0;
	color: gray;
}

.noticeable {
	float: none;
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

.new_book {
	display: flex;
	justify-content: space-around;
}

.new_book__detail .title {
	font-weight: bold;
}

.banner {
	width: 820px;
	margin: 35px 0;
}

.bloger_wrap {
	float: none;
	display: flex;
	justify-content: space-around;
	height: 300px;
}

.img_book2 {
	width: 150px;
	height: 220px;
	float: left;
	margin-left: 100px;
}

.bloger_best{
	width:820px;
	height: 300px;
}

.bloger_best__text {
	border: 1px solid black;
	width: 380px;
	height: 180px;
	float: right;
	padding: 20px;
	margin-right: 100px;
}

.bloger_best__text>p {
	width: 380px;
	height: 90px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	word-wrap: break-word;
	-webkit-line-clamp: 4;
	-webkit-box-orient: vertical;
	text-align: left;
}

.noticeable_text {
	width: 150px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$(".noticeable").slick({
			arrows : true,
			dots : true,
			infinite : true,
			slidesToShow : 4,
			slidesToScroll : 4,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		});

		$(".bloger_best").slick({
			arrows : true,
			dots : true,
			infinite : true,
			slidesToShow : 1,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		})
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
	});
</script>
</head>

<body>
	<div class="bestseller">
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
		<section id="bestseller__Nobel">
			<div class="bestseller__class">
				<div class="subtitle">이 분야 베스트 셀러</div>
				<a href="bookBestSeller.do" class="additem">더보기+</a>
			</div>
			<div class="noticeable">
				<c:forEach items="${bestSeller }" var="bsb" varStatus="a" begin="0"
					end="8">
					<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }" class="new_noticeable"> <img src="${bsb.bcover }"
						alt="book" class="img_book">	
						<style>
						.b_title{
						font-weight:bold;
						}
						.b_author{
						color: #919191;
						font-size:12px;
						}
						.b_price{
						font-size:15px;
						}
						</style>
						<div class="noticeable_text">
						
							<span class="b_title">${bsb.btitle }</span><br>
							 <span class="b_author">${bsb.bauthor }</span><br>
							<span class="b_price">${bsb.bpricesales }원</span>
						</div>
					</a>
				</c:forEach>
			</div>
			<!--Add Arrows-->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
			<!-- </div> -->
			<hr>
			<div class="bestseller__class">
				<div class="subtitle">새로나온 책</div>
				<a href="bookNew.do" class="additem">더보기+</a>
			</div>
			<div class="new_book">
				<c:forEach items="${NewList }" var="bsb" varStatus="a" begin="1"
					end="2">
					<div class="new_book__block">
						<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }"><img src="${bsb.bcover }" alt="book" width="180px" height="270px"
							class="img_book"> </a>
					</div>
					<div class="new_book__detail">
						<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }">
							<div class="title">${bsb.btitle }</div>
						</a>
						<div>${bsb.bauthor }</div>
						<p>정가${bsb.bpriceStandard }->판매가(10%할인)${bsb.bpricesales }</p>
						<div>${bsb.bdiscription }</div>
					</div>
				</c:forEach>

			</div>
			<a href="#"><img
				src="http://www.canwa.com.au/wp-content/uploads/2019/09/KK-Facebook-Header-820px-x-360px-No-tag.jpg"
				alt="book" class="banner"></a>
			<div class="subtitle">블로거 베스트셀러</div>
			<div class="bloger_best">
				<c:forEach items="${blogBest }" var="bsb" varStatus="a" begin="0"
					end="4">
					<div class="bloger_wrap" height="300px">
						<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }"> <img src="${bsb.bcover }" alt="book"
							class="img_book2">
						</a>
						<!-- </div>
                    <div class="bloger_wrap"> -->
						<div class="bloger_best__text">
							<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }"><span>${bsb.btitle}</span></a><br> <span>${bsb.bauthor }</span><br>
							<span>${bsb.bpricesales }</span>
							<p>${bsb.bdiscription }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</section>
	</div>
</body>

</html>