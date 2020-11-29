<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../main/header.jsp"%>
<%@ include file="../main/recentSide.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bookBestSeller.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssak, 나만의 책</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
<%String member = String.valueOf(session.getAttribute("member"));%>
		$(document).ready(function () {
				$("#checkall").click(function() {
					if ($("#checkall").prop("click")) {
						$("input[name=check]").prop("checked", true);
					}
				});
				$("#uncheck_all").click(function() {
					if ($("#uncheck_all").prop("click")) {
						$("input[name=check]").prop("checked", false);
					}
				});
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

			$('.cartIn').click(function () {
				var member="<%=member%>";
									if (member == null || member == ""
											|| member == "null") {
										console.log(member);
										alert('로그인 후 이용해주세요');
									} else {
										//mid ok, bisbn, oamount ok
										var $t = $(this).parents(
												'div.bes_list2');
										var stat = $t.find('input.num').val(); //oamount
										console.log(stat);
										var bisbn = $t.find('input.bisbn')
												.val();
										console.log(bisbn);
										if (stat < 1) {
											alert("주문은 한 개 이상부터 가능합니다.")
											$t.find('input.num').val(1);
										} else {
											location.href = "CartInsert?bisbn="
													+ bisbn + "&oamount="
													+ stat;
										}
									}
								});

						$('.orderIn').click(
								function() {
									//mid ok, bisbn, oamount ok
									var $t = $(this).parents('div.bes_list2');

									var stat = $t.find('input.num').val(); //oamount
									console.log(stat);
									var bisbn = $t.find('input.bisbn').val();
									console.log(bisbn);
									if (stat < 1) {
										alert("주문은 한 개 이상부터 가능합니다.")
										$t.find('input.num').val(1);
									} else {
										location.href = "OrderDirect?bisbn="
												+ bisbn + "&oamount=" + stat;
									}
								});
						$('#cartIns')
								.click(
										function() {
											var checkbox = $("input[name=check]:checked");
											var checkboxVal = $(
													"input[name=check]:checked")
													.val();
											//console.log(checkbox);
											var bisbn = new Array();
											var stat = new Array();

											checkbox
													.each(function() {
														bisbn.push($(this)
																.val());
														stat
																.push($(this)
																		.siblings(
																				'input[name=oamount]')
																		.val());
														if (stat < 1) {
															alert('상품을 한 개 이상 선택해주세요.');
															$(this)
																	.siblings(
																			'input[name=oamount]')
																	.val(1);
														}
													});
											if (checkboxVal == null) {
												alert("상품을 한 개 이상 선택해주세요.")
											} else {
												location.href = "CartInserts?bisbn="
														+ bisbn
														+ "&oamount="
														+ stat;
											}
										});
					});
</script>
</head>
<body>
	<div class="bestseller">
		<aside id="category">
			<div class="classify">베스트셀러</div>
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
		</aside>
		<section id="bestseller__C">
			<div id="bestsellertitle">#&nbsp;종합</div>
			<table id="list_table">
				<tr>
					<td>
						<div class="list_btn">
							<button type="button" id="checkall">전체선택</button>
							<span class="menu_line">|</span>
							<button type="button" id="uncheck_all">모두해제</button>
							<span class="menu_line">|</span>
							<button type="button" id="cartIns">장바구니 담기</button>
						</div>
					</td>
				</tr>
			</table>

			<div id="bes_list">
				<c:if test="${not empty bestSeller }">
					<c:forEach items="${bestSeller}" var="bsb" varStatus="a">
						<div class="bes_list2">
							<h3 class="bes_num">${bsb.bno }</h3>
							<a
								href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }"
								class="bes_thumb"> <img src="${bsb.bcover }" alt="book">
							</a>
							<div class="bes_info">
								<ul>
									<li><a
										href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }"
										class="bes_title">${bsb.btitle }</a></li>
									<li class="bes_block"><span>${bsb.bauthor }</span></li>
									<li class="bes_money"><span>정가&nbsp;&nbsp;${bsb.bpriceStandard }&nbsp;&nbsp;&nbsp;&nbsp;▸&nbsp;&nbsp;&nbsp;&nbsp;판매가&nbsp;(10%할인)&nbsp;&nbsp;${bsb.bpricesales
											}</span></li>
									<li class="bes_text">${bsb.bdiscription }</li>
								</ul>
							</div>
							<div class="bes_btn">
								<p>
									<input type="hidden" value="${bsb.BISBN}" name="bisbn"
										class="bisbn"> <input type="checkbox" id="check"
										class="check" name="check" value="${bsb.BISBN}"> <span
										class="bes_num">수량</span> <input type="number"
										id="cntVal_1234" value="1" class="num" size="3" min="1"
										name="oamount">
								</p>
								<button type="button" class="cartIn">장바구니</button>
								</br>
								<button type="button" class="orderIn">구매하기</button>
								</br>
								<button type="button" onclick="location.href='#'">북커버
									커스텀</button>
							</div>
						</div>
						<hr
							style="height: 1px; background-color: #dcdcdc; border-width: 0;">
					</c:forEach>
				</c:if>
			</div>
			<div class="pagediv">
				<c:if test="${startPage != 1}">
					<a
						href="<%=request.getContextPath()%>/bookBestSeller.do?pageNum=${prev}"
						class="page_btn prev"><</a>
				</c:if>

				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a href="<%=ctxPath %>/bookBestSeller.do?pageNum=${s.current}"
							class="page_btn">${s.current}</a>
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a
						href="<%=request.getContextPath()%>/bookBestSeller.do?pageNum=${next}"
						class="page_btn next">></a>
				</c:if>
			</div>
			<div class="scr_btn">
				<input type="image"
					src="<%=request.getContextPath()%>/imgs/top_button.png"
					onClick="javascript:window.scrollTo(0,0)" alt="맨위로" />
			</div>
		</section>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>