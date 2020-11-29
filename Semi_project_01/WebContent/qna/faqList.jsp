<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/faqList.css" />
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ssak, 나만의 책</title>
<script>
	$(document).ready(function() {
		$(".fq1_title").css("cursor", "pointer");
		$(".fq1_title").on("click", function() {
			var title = $(this);
			if (!title.parent().next().is(":visible")) {
				title.parent().next().slideDown("fast");
			} else {
				title.parent().next().slideUp("fast");
			}
		});

		$("#qna_select").change(function() {
			var select = $("#qna_select option:selected").val();
			if (select == "member") {
				$(".member").parent().show();
				$(".product").parent().hide();
				$(".delivery").parent().hide();
			} else if ($("#qna_select option:selected").val() == "product") {
				$(".member").parent().hide();
				$(".product").parent().show();
				$(".delivery").parent().hide();
			} else if ($("#qna_select option:selected").val() == "delivery") {
				$(".member").parent().hide();
				$(".product").parent().hide();
				$(".delivery").parent().show();
			} else {
				$(".member").parent().show();
				$(".product").parent().show();
				$(".delivery").parent().show();
			}
		});
	});
</script>
</head>

<body>
	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">고객센터</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li><a href="<%=request.getContextPath()%>/noticeList.do">공지사항<span class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/qna/faqList.jsp">자주하는질문<span class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/qnaList.do">1:1문의<span class="aside_arrow">></span></a></li>
				</ul>
			</div>

			<a href="<%=request.getContextPath()%>/qnaList.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span> 1:1
				문의하기
			</a>
		</div>
		
		
		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit_a">
					자주하는 질문 <span class="tit_sub"> 고객님들이 자주 찾으시는 질문을 모았습니다 </span>
				</h2>
				<select name="qna_select" id="qna_select">
					<option value="">선택</option>
					<option value="member">회원</option>
					<option value="product">상품</option>
					<option value="delivery">배송</option>
				</select>
			</div>
			<table width="100%" class="xans-board-listheader jh">
				<thead>
					<tr>
						<th class="txt_no">번호</th>
						<th class="txt_title">분류</th>
						<th class="txt_date">제목</th>
					</tr>
				</thead>
				<tbody>
					<tr class="fq1">
						<td class="fq1_no">1</td>
						<td class="fq1_type member">회원</td>
						<td class="fq1_title">회원ID(이메일)/비밀번호를 잊어버렸습니다.</td>
					</tr>
					<tr class="fq2" id="fq2_1">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">가입 아이디는 우측 상단 로그인 메뉴 누른 후
							페이지 안내에 따라 정보 입력 후 확인 가능합니다. <br />비밀번호는 기존 정보 확인은 불가능하며 본인 확인 후
							새로운 비밀번호로 설정하실 수 있습니다. <br />ssak 첫 화면 상단 우측 로그인>비밀번호 찾기>이메일
							주소/주민등록번호/성함 입력 후 다음단계를 누르시면 <br />가입 이메일 주소/휴대폰 번호로 인증번호를 보내
							드립니다. <br />수신하신 인증번호를 넣으시고 사용하실 새 비밀번호를 설정하실 수 있습니다. <br />그 외
							문의 사항은 1:1 게시판이나 ssak@ssak.com 으로 문의해주시기 바랍니다. <br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">2</td>
						<td class="fq1_type product">상품</td>
						<td class="fq1_title">상품페이지 "구매하기"는 어떤 기능입니까?</td>
					</tr>
					<tr class="fq2" id="fq2_2">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">. "바로구매하기"는 다른 상품과 함께 구매하지
							않고 조회 상품만 간편 주문하시는 기능입니다. <br />이 버튼을 누르면 해당 상품만 장바구니에 담긴 채 바로
							배송정보 입력페이지로 이동하실 수 있습니다. <br />동일 상품 1종을 여러 권(개) 구매 원하시면 상품조회
							페이지의 주문수량을 원하시는 수량으로 우선 변경 후 "바로구매하기" 하시면 됩니다. <br />다른 상품과 함께
							구매하시려면 "장바구니 담기" 기능을 이용하시기 바랍니다.<br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">3</td>
						<td class="fq1_type delivery">배송</td>
						<td class="fq1_title">주문하면 언제 받을 수 있나요?</td>
					</tr>
					<tr class="fq2" id="fq2_3">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">재고가 있는 도서라면 통상 주문 후 2~3일(도서,
							산간지역 3~4일) 안에는 받으실 수 있습니다. <br /> (영업일 기준)재고가 없어 출판사에 주문을 해야 하는
							도서의 경우에는 이보다 2~3일 정도 추가 소요될 수 있습니다. <br />이 경우 고객님께 배송지연 안내 문자를
							보내 드립니다.<br /> 아무 내용이나 적어주세요. <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">4</td>
						<td class="fq1_type product">상품</td>
						<td class="fq1_title">내가 찾는 상품이 없는데 구해주실 수 있나요?</td>
					</tr>
					<tr class="fq2" id="fq2_4">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">상품검색을 했는데 원하는 상품이 나오지 않는 경우
							[1:1문의] 게시판에 문의하시면 해당 상품에 대한 입수 가능성 여부를 알려드립니다.<br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">5</td>
						<td class="fq1_type member">회원</td>
						<td class="fq1_title">회원 이메일 주소와 비밀번호를 변경하고 싶습니다.</td>
					</tr>
					<tr class="fq2" id="fq2_5">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">이메일주소, 비밀번호 등 개인정보는 나의계정>기존
							정보 로그인 후 직접 웹상에서 수정하실 수 있습니다. <br /> 로그인 후 좌측 메뉴 중
							회원정보관리>개인정보수정을 누르셔서 변경해 주세요. <br />이메일주소를 잘못 등록하셨거나 현재는 사용하지 않는
							이메일 주소라고 하더라도, 등록하신 형태 그대로 입력 후 로그인하셔서 변경하시면 됩니다. <br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">6</td>
						<td class="fq1_type delivery">배송</td>
						<td class="fq1_title">배송비는 얼마인가요?</td>
					</tr>
					<tr class="fq2" id="fq2_6">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">국내 배송의 경우 구매 금액이 1만원 미만일 경우
							2,000원, 1만원이상 구매 시 배송비 무료 혜택을 드리고 있습니다.(단, 제주도 및 산간지역의 경우 배송비가
							추가될 수 있음) <br />해외배송의 경우에는 도서의 주문 권수와 배송지에 따라 달라집니다.<br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">7</td>
						<td class="fq1_type product">상품</td>
						<td class="fq1_title">반품비용은 어떻게 되나요?</td>
					</tr>
					<tr class="fq2" id="fq2_7">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">제품불량/오배송/파손 사유를 제외한 고객 변심으로
							인한 반품시 반품비용는 고객 부담입니다. <br />또한 취소에 따른 구매액 변동으로 무료배송 기준금액에 미달할
							경우 무료배송비용을 반환하 셔야 합니다. <br />* 주문상품 중 일부상품의 반품의 경우에도 동일한 기준이
							적용됩니다.<br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">8</td>
						<td class="fq1_type product">상품</td>
						<td class="fq1_title">배송받은 상품을 다른 제품으로 교환하고 싶습니다. 가능한가요?</td>
					</tr>
					<tr class="fq2" id="fq2_8">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">죄송하지만, 상품이 불량인 경우에만 동일상품으로
							교환가능하시며, 타상품으로는 교환이 불가합니다. <br />먼저 수령하신 상품을 반품하여 주시면 해당 주문 금액을
							환불해 드리며, <br />변경을 원하시는 상품을 다시 구매하셔야 합니다. <br /> <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">9</td>
						<td class="fq1_type delivery">배송</td>
						<td class="fq1_title">주문한 상품 중 일부가 오지 않았습니다.</td>
					</tr>
					<tr class="fq2" id="fq2_9">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">주문건의 도서가 예상 출고일 보다 경과되어 지연된
							경우에는 먼저 포장완료된 도서를 발송해드립니다. <br />나머지 상품은 별도로 배송 중이거나 상품을 준비하고 있는
							단계이며, 거래처로 주문된 상품은 입고되는 즉시 배송해 드립니다. <br />
						</td>
					</tr>
					<tr class="fq1">
						<td class="fq1_no">10</td>
						<td class="fq1_type member">회원</td>
						<td class="fq1_title">회원탈퇴는 어떻게 하면 되나요?</td>
					</tr>
					<tr class="fq2" id="fq2_10">
						<td class="fq2_none"></td>
						<td class="fq2_desc" colspan="2">ssak 우측 상단 메뉴 중에 [마이페이지] 를
							클릭하시면 뜨는 페이지 좌측 하단 [마이페이지 ] 를 통해 회원 탈퇴를 신청하실 수 있습니다. 회원탈퇴 시 고객님의
							회원정보는 전자상거래 상에서의 소비자보호 법률에 의거한 ssak 개인정보보호정책에따라 관리됩니다. <br />거래
							종료 후 회원 탈퇴가 가능합니다 또한, 회원탈퇴시 회원정보는 자동으로 삭제되며, 탈퇴 후 재가입은 가능하나 기존 사용
							ID로는 가입이 불가능합니다.<br /> <br />
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>

</html>