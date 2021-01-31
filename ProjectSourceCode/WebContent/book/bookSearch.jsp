<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bookSearch.css" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../main/header.jsp"%>
<%@include file="../main/recentSide.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>ssak, 나만의 책</title>

<script>
<%
String member = String.valueOf(session.getAttribute("member"));
%>
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
	

	//체크박스
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
	var member="<%=member%>";
	if(member==null || member=="" ||member=="null"){
		console.log(member);
		alert('로그인 후 이용해주세요');
	}else{
	var $t = $(this).parents('div.new_list2');
	
	var stat = $('.num').val(); //oamount
	var bisbn = $('.bisbn').val();
	if(stat<1){
		alert("주문은 한 개 이상부터 가능합니다.")
		$t.find('input.num').val(1);
	} else{
		location.href = "CartInsert.do?bisbn=" + bisbn + "&oamount=" + stat;	
	}
	}
});

$('.orderIn').click(function () {
	var member="<%=member%>";
	if(member==null || member=="" ||member=="null"){
		console.log(member);
		alert('로그인 후 이용해주세요');
	}else{
	//mid ok, bisbn, oamount ok
	var $t = $(this).parents('div.new_list2');
	
	var stat = $('.num').val(); //oamount
	var bisbn = $('.bisbn').val();
	if(stat<1){
		alert("주문은 한 개 이상부터 가능합니다.")
		$t.find('input.num').val(1);
	} else{
		location.href = "OrderDirect.do?bisbn=" + bisbn + "&oamount=" + stat;	
	}
	}
});

$('#cartIns').click(function(){
	var member="<%=member%>";
	if(member==null || member=="" ||member=="null"){
		console.log(member);
		alert('로그인 후 이용해주세요');
	}else{
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
		location.href = "CartInserts.do?bisbn=" + bisbn + "&oamount=" + stat;				
	}
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
	var $t = $(this).parents('div.bes_list2');
	var stat = $t.find('input.num').val(); //oamount
	var bisbn = $t.find('input.bisbn').val();
	if(stat<1){
		alert("주문은 한 개 이상부터 가능합니다.")
		$t.find('input.num').val(1);
	} else{
		location.href = "./bookCustom.do?bisbn=" + bisbn + "&bookamount=" + stat;	
	}
	}
});	
});
</script>
</head>

<body>


	<div class="bestseller">
		<section id="bestseller__C">
			<h2 class="tit">
				' ${mSearchBar }' <span class="tit_sub">
					총&nbsp;&nbsp;${nCount }개의 상품이 검색되었습니다 </span>
			</h2>
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
				<c:if test="${not empty bookSearch }">
					<c:forEach items="${bookSearch}" var="bsb" varStatus="a">

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
										class="bisbn"> <input class="checkbox" type="checkbox"
										id="chk" name="check" value="${bsb.BISBN}"> <span
										class="bes_num">수량</span> <input type="number"
										id="cntVal_1234" value="1" class="num" size="3" min="1"
										name="oamount">
								</p>
								<button type="button" class="cartIn">장바구니</button>
								</br>
								<button type="button" class="orderIn">구매하기</button>
								</br>
								<button type="button" class="bookcoverIn">북커버
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
						href="<%=request.getContextPath()%>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${prev}"
						class="page_btn prev"><</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a
							href="<%=request.getContextPath()%>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${s.current}"
							class="page_btn">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a
						href="<%=request.getContextPath()%>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${next}"
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