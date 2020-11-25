<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="../main/reset.css" rel="stylesheet" type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>Document</title>
<style>
.bestseller {
	width: 1080px;
	margin: 0 auto;
	/* display:flex; */
	margin-top: 80px;
}

#category {
	float: left;
	width: 200px;
	height: 600px;
	margin-right: 60px;
	border: 1px solid black;
}

.classify {
	font-weight: bold;
	margin-left: 15px;
}

#category ul {
	font-size: 15px;
}

#category ul li:nth-child(1) {
	font-weight: bold;
}

#category ul li {
	list-style-type: none;
	margin: 10px 0;
}

#bestseller__C {
	/* float: right;
            width: 820px; */
	
}

#list_table {
	background-color: rgb(206, 206, 206);
	width: 100%;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
	margin: 30px 0 20px 0;
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

#bes_list {
	float: none;
	display: block;
}

#bes_list ul {
	list-style-type: none;
}

#bes_list ul a {
	text-decoration: none;
}

.bes_list2 {
	display: flex;
	/* justify-content: space-around; */
	position: relative;
}

.bes_num {
	margin-right: 10px;
}

.bes_thumb img {
	width: 180px;
}

.bes_money {
	font-size: 17px;
}

.bes_btn {
	float: right;
	/* position: absolute; */
	right: 0;
}

.bes_btn button {
	width: 130px;
	height: 50px;
	margin: 5px;
	background-color: white;
	border: gray solid 1px;
	border-radius: 8px;
}

.bes_btn input {
	width: 30px;
	text-align: center;
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

.pagediv {
	text-align: center;
}

.pagediv a {
	margin: 0px 5px;
}

.scr_btn {
	float: right;
}
</style>
</head>

<body>
	<script>
		$(document).ready(function() {
			$("#checkall").click(function() {
				if ($("#checkall").prop("click")) {
					$("input[name=chk]").prop("checked", true);
				}
			});
			$("#uncheck_all").click(function() {
				if ($("#uncheck_all").prop("click")) {
					$("input[name=chk]").prop("checked", false);
				}
				});
			
			$('.cartIn').click(function () {
				//mid ok, bisbn, oamount ok
				var $t = $(this).parents('div.bes_list2');
				
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
				var $t = $(this).parents('div.bes_list2');
				
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
		/* $(document).ready(function(){
			$("#checkall").click(function() {
				$("input[name=chk]").prop("checked", false);
				
			})
		)} */
	</script>

	<div class="bestseller">



		<section id="bestseller__C">
			<h2 class="tit">
				' ${mSearchBar }' <span class="tit_sub"> 총${nCount }개의 상품이 검색되었습니다 </span>
			</h2>
			<table id="list_table">
				<tr>
					<td>
						<div class="list_btn">
							<button type="button" id="checkall">전체선택</button>
							<button type="button" id="uncheck_all">모두해제</button>
							<button type="button" id="cartIns">장바구니
								담기</button>
						</div>
					</td>
				</tr>
			</table>

			<div id="bes_list">
				<c:if test="${not empty bookSearch }">
					<c:forEach items="${bookSearch}" var="bsb" varStatus="a">

						<div class="bes_list2">
							<h3 class="bes_num">${bsb.bno }</h3>
							<a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }" class="bes_thumb"> <img src="${bsb.bcover }"
								alt="book">
							</a>
							<div class="bes_info">
								<ul>
									<li><a href="<%=request.getContextPath()%>/bookDetail.do?bisbn=${bsb.BISBN }">${bsb.btitle }</a></li>
									<li class="bes_block"><span>${bsb.bauthor }</span></li>
									<li class="bes_money"><span>정가${bsb.bpriceStandard }->판매가(10%할인)${bsb.bpricesales
											}</span></li>
									<li class="bes_text">${bsb.bdiscription }</li>
								</ul>
							</div>
							<div class="bes_btn">
								<p>
									<input type="hidden" value="${bsb.BISBN}" name="bisbn" class="bisbn">
									<input class="checkbox" type="checkbox" id="chk" name="check" value="${bsb.BISBN}">
									<span class="bes_num">수량</span> <input type="number"
										id="cntVal_1234" value="1" class="num" size="3" name="oamount">
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
					<a href="<%=ctxPath %>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${prev}">이전</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a href="<%=ctxPath %>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${s.current}">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				
				<c:if test="${next < pageCount}">
					<a href="<%=ctxPath %>/bookSearch.do?mSearchBar=${mSearchBar }&pageNum=${next}">다음</a>
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