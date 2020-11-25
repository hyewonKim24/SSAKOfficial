<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<%@ include file="./header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/22634e2e1a.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slick.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/slick-theme.css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/slick.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>ssak, 나만의 책</title>
<style>
* {
	margin: 0;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
	width: 100%;
	position: relative;
}

/* 배너_slick */
#slick-items1 {
	position: relative;
	width: 1080px;
	height: 360px;
	margin: 0 auto;
	overflow: hidden;
}

.mBanner_img {
	width: 100%;
	height: 360px;
}

.sub {
	font-size: 16px;
	height: 40px;
	font-weight: 700;
	color: #425c5a;
}
/* 오늘의 책, 블로그 베스트 셀러 */
.mCont {
	position: relative;
	width: 1080px;
	height: 340px;
	margin: 10 auto;
	overflow: hidden;
}

.mTodayB {
	position: absolute;
	width: 60%;
	height: 310px;
	margin-top: 30px;
	margin-right: 10px;
}

.mTodayB_title {
	font-weight: 700; font-size : 20px;
	height: 40px;
	font-size: 20px;
}

.mTodayB_author {
	font-size: 14px;
}

.mTodayB_cont {
	width: 100%;
	height: 270px;
}

.mTodayB_img {
	width: 30%;
	height: 270px;
	float: left;
	margin-right: 5%;
}

.mTodayB_cont dl {
	height: 270px;
	overflow: hidden;
}

dl:nth-child(1) {
	display: none;
}

dl:nth-child(2) {
	display: none;
}

dl:nth-child(3) {
	display: none;
}

dl:nth-child(4) {
	display: none;
}

dl:nth-child(1).active {
	display: block;
	font-size: 14px;
}

dl:nth-child(2).active {
	display: block;
	font-size: 14px;
}

dl:nth-child(3).active {
	display: block;
	font-size: 14px;
}

dl:nth-child(4).active {
	display: block;
	font-size: 14px;
}

.mTodayB_title {
	font-size: 18px;
}

.mTodayB_desc {
	padding-top: 16px;
	font-size: 12px;
	line-height: 16px;
	text-overflow: ellipsis;
}

.mTodayB_cont>ul {
	position: absolute;
	left: 35%;
	width: 65%;
	height: 130px;
	bottom: 0;
}

.mTodayB_cont ul li {
	float: left;
	padding-right: 20px;
}

.mTodayB_others_img {
	width: 85px;
	height: 120px;
}
/*세로 경계선*/
.vertical-line {
	position: absolute;
	display: inline-block;
	width: 1px;
	background-color: #DCDCDC;
	height: 320px;
	left: 65%;
	margin: 40px 0 0 0;
	padding: 0;

	/*       float: left;  */
	/* Causes the line to float to left of content. 
        You can instead use position:absolute or display:inline-block
        if this fits better with your design */
}

/* 블로그베스트 셀러 */
.mBlogbest {
	position: absolute;
	width: 30%;
	height: 310px;
	left: 70%;
	margin-top: 35px;
}

.mBlogbest_title {
	font-size: 20px;
	height: 40px;
	line-height: 16px;
	text-align: center;
}

.mBlogbest_cont {
	width: 100%;
	height: 270px;
}

.mBlogbest_cont img {
	width: 150px;
	height: 210px;
	margin: 0 25%;
}

.mBlogbest_cont p {
	padding-top: 10px;
	height: 50px;
	margin: 0 25%;
}
/* 커스텀소개 이미지 */
.mCustomIntro {
	position: relative;
	width: 1080px;
	height: 250px;
	margin: 80px auto;
}

#mCustomIntro_img {
	position: absolute;
	width: 100%;
}

/* 베스트셀러 소개  */
.mBestsell {
	position: relative;
	width: 1080px;
	height: 320px;
	margin: 0 auto;
}

#mBestsell_title {
	font-size: 20px;
	height: 40px;
}

.mBestsell_cont {
	position: absolute;
	width: 100%;
	height: 320px;
	margin: 0 auto;
}

.mBestsell_btn {
	float: left;
	height: 320px;
}

.mBestsell_cont ul {
	width: 80%;
	margin-left: 60px;
}

.mBestsell_cont ul li {
	float: left;
	margin: 0 2%;
	width: 150px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.mBestsell_cont_img {
	width: 150px;
	height: 230px;
}

a .mBestsell_cont_txt {
	font-size: 15px;
	height: 40px;
}
/* 새로나온책 소개  */
.mNewbook {
	position: relative;
	width: 1080px;
	height: 310px;
	margin: 50px auto;
	margin-bottom: 100px;
}

#mNewbook_title {
	font-size: 20px;
	height: 40px;
}

.mNewbook_cont {
	position: absolute;
	width: 100%;
	height: 280px;
}

.mNewbook_btn {
	float: left;
	height: 270px;
}

.mNewbook_cont ul {
	width: 80%;
	margin-left: 60px;
}

.mNewbook_cont ul li {
	float: left;
	margin: 0 2%;
	width: 150px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.mNewbook_cont_img {
	width: 150px;
	height: 230px;
}

.mNewbook_cont_txt {
	font-size: 15px;
	height: 40px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$('#slick-items1').slick({
			autoplay : true,
			dots : true,
			speed : 500 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite : true,
			autoplaySpeed : 4000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			arrows : true,
			slidesToShow : 1,
			slidesToScroll : 1,
			fade : false,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		});
		$('#slick-items2').slick({
			autoplay : true,
			dots : true,
			speed : 500 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite : true,
			autoplaySpeed : 4000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			arrows : true,
			slidesToShow : 1,
			slidesToScroll : 1,
			fade : false,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		});
		$('#slick-items3').slick({
			autoplay : true,
			dots : false,
			speed : 900 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite : true,
			autoplaySpeed : 3000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			arrows : true,
			slidesToShow : 1,
			slidesToScroll : 1,
			fade : false,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		});
		$('#slick-items4').slick({
			autoplay : true,
			dots : false,
			speed : 900 /* 이미지가 슬라이딩시 걸리는 시간 */,
			infinite : true,
			autoplaySpeed : 4000 /* 이미지가 다른 이미지로 넘어 갈때의 텀 */,
			arrows : true,
			slidesToShow : 1,
			slidesToScroll : 1,
			fade : false,
			navigation : {
				nextEl : ".swiper-button-next",
				prevEl : ".swiper-button-prev"
			}
		});
		var Mnav = $("#mHeader3").offset().top;
		$(window).scroll(function() {
			var window = $(this).scrollTop();
			if (Mnav <= window) {
				$("#mHeader3").addClass("fixed");
			} else {
				$("#mHeader3").removeClass("fixed");
			}
		});

		$("#hover_img1").hover(function() {
			$("dl:nth-child(1)").addClass("active");
			$("dl:nth-child(2)").removeClass("active");
			$("dl:nth-child(3)").removeClass("active");
			$("dl:nth-child(4)").removeClass("active");
		});
		$("#hover_img2").hover(function() {
			$("dl:nth-child(1)").removeClass("active");
			$("dl:nth-child(2)").addClass("active");
			$("dl:nth-child(3)").removeClass("active");
			$("dl:nth-child(4)").removeClass("active");
		});
		$("#hover_img3").hover(function() {
			$("dl:nth-child(1)").removeClass("active");
			$("dl:nth-child(2)").removeClass("active");
			$("dl:nth-child(3)").addClass("active");
			$("dl:nth-child(4)").removeClass("active");
		});
		$("#hover_img4").hover(function() {
			$("dl:nth-child(1)").removeClass("active");
			$("dl:nth-child(2)").removeClass("active");
			$("dl:nth-child(3)").removeClass("active");
			$("dl:nth-child(4)").addClass("active");
		});

	});
</script>
</head>
<body>
	<!-- 탈퇴했을 때 알람뜨게 함 -->
	<c:if test="${not empty wrer_end}">
		<script>
			alert('${wrer_end}');
		</script>
	</c:if>


	<div id="slick-items1" class="mBanner">
		<div>
			<a href="#" class="bn"><img src="<%=request.getContextPath() %>/imgs/banner01.png"
				class="mBanner_img"></a>
		</div>
		<div>
			<a href="#" class="bn"><img src="<%=request.getContextPath() %>/imgs/banner02.png"
				class="mBanner_img"></a>
		</div>
		<div>
			<a href="#" class="bn"><img src="<%=request.getContextPath() %>/imgs/banner03.png"
				class="mBanner_img"></a>
		</div>
		<div>
			<a href="#" class="bn"><img src="<%=request.getContextPath() %>/imgs/banner04.png"
				class="mBanner_img"></a>
		</div>
	</div>

	<div class="mCont">
		<div class="mTodayB">
			<div class="mTodayB_sub sub">오늘의 책</div>
			<div class="mTodayB_cont">

				<c:if test="${not empty todaylist }">
					<c:forEach items="${todaylist }" var="today">
						<dl>
							<dt>
								<a href="./bookDetail.do?bisbn=${today.BISBN}"><img
									src="${today.bcover }" class="mTodayB_img"></a>
							</dt>
							<dd>
								<a href="./bookDetail.do?bisbn=${today.BISBN }"
									class="mTodayB_title">${today.btitle } </a>
							</dd>
							<dd>${today.bauthor }</dd>
							<dd class="mTodayB_desc">${today.bdiscription }</dd>
						</dl>
					</c:forEach>
				</c:if>

				<c:if test="${not empty todaylist }">
					<c:forEach items="${todaylist }" var="today">
						<dl>
							<dt>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }"><img
									src="${today.bcover }" class="mTodayB_img"></a>
							</dt>
							<dd>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }"
									class="mTodayB_title">${today.btitle } </a>
							</dd>
							<dd class="mTodayB_author">${today.bauthor }</dd>
							<dd class="mTodayB_desc">${today.bdiscription }</dd>
						</dl>
					</c:forEach>
				</c:if>

				<ul>
					<c:if test="${not empty todaylist }">
						<c:forEach items="${todaylist }" var="today" varStatus="e">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }"><img
									src="${today.bcover }" class="mTodayB_others_img"
									id="hover_img${e.count }"></a></li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="vertical-line"></div>
		<div class="mBlogbest">
			<div class="mBlogbest_sub sub">블로그 베스트셀러</div>
			<div id="slick-items2" class="mBlogbest_cont">

				<c:if test="${not empty blogbest}">
					<c:forEach items="${blogbest}" var="blog">
						<div>
							<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${blog.BISBN }"><img
								src=${blog.bcover }></a> <a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${blog.BISBN }">
								<p>${blog.btitle }</p>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<div class="mCustomIntro">
		<a href="#"><img src="<%=request.getContextPath() %>/imgs/custom_banner.png"
			id="mCustomIntro_img"></a>
	</div>

	<div class="mBestsell">
		<div id="mBestsell_sub" class="sub">베스트셀러</div>
		<div class="mBestsell_cont">
			<div id="slick-items3">
				<c:if test="${not empty bestseller}">
					<ul>
						<c:forEach begin="1" end="5" var="best" items="${bestseller}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="#" class="mBestsell_cont_txt">${best.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="6" end="10" var="best" items="${bestseller}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="#" class="mBestsell_cont_txt">${best.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="11" end="15" var="best" items="${bestseller}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="#" class="mBestsell_cont_txt">${best.btitle }</a></li>
						</c:forEach>
					</ul>
				</c:if>

			</div>
			<!--Add Arrows-->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>

	<div class="mNewbook">
		<div id="mNewbook_sub" class="sub">새로나온 책</div>
		<div class="mNewbook_cont">
			<div id="slick-items4">
				<c:if test="${not empty newlist}">
					<ul>
						<c:forEach begin="1" end="5" var="newlist" items="${newlist}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="#" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="6" end="10" var="newlist" items="${newlist}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="#" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="11" end="15" var="newlist" items="${newlist}">
							<li><a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="#" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
						</c:forEach>
					</ul>
				</c:if>
			</div>
			<!--Add Arrows-->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
	<%@ include file="./footer.jsp"%>
</body>
</html>