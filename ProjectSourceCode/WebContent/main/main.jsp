<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css" />
<%@ include file="./header.jsp" %>
<%@ include file="./recentSide.jsp" %>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/slick-theme.css" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/slick.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/slick.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>ssak, 나만의 책</title>
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
			dots : false,
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
			<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=K922633306" class="bn">
			<img src="<%=request.getContextPath()%>/imgs/banner01.png" class="mBanner_img"></a>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/bookNew.do" class="bn">
			<img src="<%=request.getContextPath()%>/imgs/banner02.png" class="mBanner_img"></a>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/EventList" class="bn">
			<img src="<%=request.getContextPath()%>/imgs/banner03.png" class="mBanner_img"></a>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/bookCategory.do" class="bn">
			<img src="<%=request.getContextPath()%>/imgs/banner04.png" class="mBanner_img"></a>
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
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN}">
								<img src="${today.bcover }" class="mTodayB_img"></a>
							</dt>
							<dd>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }" class="mTodayB_title">${today.btitle } </a>
							</dd>
							<dd class="mTodayB_author">${today.bauthor }</dd>
							<dd class="mTodayB_desc">${today.bdiscription }</dd>
						</dl>
					</c:forEach>
				</c:if>

				<c:if test="${not empty todaylist }">
					<c:forEach items="${todaylist }" var="today">
						<dl>
							<dt>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }">
								<img src="${today.bcover }" class="mTodayB_img"></a>
							</dt>
							<dd>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }" class="mTodayB_title">${today.btitle } </a>
							</dd>
							<dd class="mTodayB_author">${today.bauthor }</dd>
							<dd class="mTodayB_desc">${today.bdiscription }</dd>
						</dl>
					</c:forEach>
				</c:if>

				<ul>
					<c:if test="${not empty todaylist }">
						<c:forEach items="${todaylist }" var="today" varStatus="e">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${today.BISBN }"><img
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
							<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${blog.BISBN }">
							<img src=${blog.bcover }></a> <a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${blog.BISBN }">
								<p>${blog.btitle }</p>
							</a>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<div class="mCustomIntro">
		<a href="<%=request.getContextPath()%>/book/bookCustomInfo.jsp"><img
			src="<%=request.getContextPath()%>/imgs/custom_banner.png"
			id="mCustomIntro_img"></a>
	</div>

	<div class="mBestsell">
		<div id="mBestsell_sub" class="sub">베스트셀러</div>
		<div class="mBestsell_cont">
			<div id="slick-items3">
				<c:if test="${not empty bestseller}">
					<ul>
						<c:forEach begin="1" end="5" var="best" items="${bestseller}">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}" class="mBestsell_cont_txt">${best.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="6" end="10" var="best" items="${bestseller}">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}" class="mBestsell_cont_txt">${best.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="11" end="15" var="best" items="${bestseller}">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}"><img
									src="${best.bcover}" class="mBestsell_cont_img"></a><br>
								<a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${best.BISBN}" class="mBestsell_cont_txt">${best.btitle }</a></li>
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
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${newlist.BISBN}" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="6" end="10" var="newlist" items="${newlist}">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${newlist.BISBN}" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
						</c:forEach>
					</ul>
					<ul>
						<c:forEach begin="11" end="15" var="newlist" items="${newlist}">
							<li><a
								href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${newlist.BISBN}"><img
									src="${newlist.bcover }" class="mNewbook_cont_img"></a><br>
								<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${newlist.BISBN}" class="mNewbook_cont_txt">${newlist.btitle }</a></li>
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