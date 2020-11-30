<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/oManage1.css" />
<link href="./reset.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 조회 목록</title>
<script type="text/javascript">
	function goSearch() {
		var frm = document.oSform;
		frm.action = "<%=request.getContextPath()%>/orderSearch";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>
<body>
	<%@ include file="../main/header.jsp"%>
	<div class="oManage">
		<div class="oManage_aside">
			<div class="oManage_asidetlt">회원관리</div>
			
			<div class="oManage_asidenav">
				<ul>
				<li><a href="<%=request.getContextPath() %>/memberList">회원정보조회 및 수정<span class="aside_arrow">></span></a></li>
                 <li><a href="<%=request.getContextPath() %>/OrderList">주문내역조회<span class="aside_arrow">></span></a></li>
                 <li><a href="<%=request.getContextPath() %>/wreqList">탈퇴요청관리<span class="aside_arrow">></span></a></li>
				</ul>
			</div>
			<div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>
				</a>
			</div>
		</div>

		<div class="oManage_cont">
			<div class="oManage_cont_title">주문내역 조회<span id="oManage_cont_subtitle"> '${osearchbar}' (으)로 검색한
				결과입니다. </span></div>
			
			<div class="oManage_cont_board">
				<form method="GET" action="#">
					<table class="oManage_cont_board_tb1">
						<thead>
							<tr>
								<th class="txt_ono">주문번호</th>
								<th class="txt_oid">주문아이디</th>
								<!-- <th class="txt_oname">상품명</th> -->
								<th class="txt_ocnt">총수량</th>
								<th class="txt_ototalp">총가격</th>
								<th class="txt_operson">수령인</th>
								<th class="txt_ocontect">수령자연락처</th>
								<th class="txt_opay">결제수단</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty olist }">
								<c:forEach items="${olist }" var="o" varStatus="s">
									<tr class="notice1">
										<td class="not1_ono">${o.ono }</td>
										<td class="not1_oid"><a
											href="<%=request.getContextPath() %>/orderDetail?mid=${o.mid}&pageNum=${s.count}&ono=${o.ono}">${o.mid}</a></td>
										<!-- <td id="not1_oname">휴지</td> -->
										<td class="not1_ocnt">${o.oamount }</td>
										<td class="not1_ototalp">${o.ototalprice }</td>
										<td class="not1_operson">${o.oname}</td>
										<td class="not1_ocontect">${o.ophone}</td>
										<td class="not1_opay">${o.opay}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
					<div class="oManage_pagination">
						<div class="oManage_pagination_warp">
							<c:if test="${startPage != 1}">
								<a href="orderSearch?pageNum=${prev}&osearchbar=${osearchbar}&otype=${otype }"><</a>
							</c:if>
							<c:if test="${startPage != endPage}">
								<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
									step="1">
									<a
										href="orderSearch?pageNum=${s.current}&osearchbar=${osearchbar}&otype=${otype }">${s.current}</a>
									<!--변경 : href 경로 -->
								</c:forEach>
							</c:if>
							<c:if test="${next < pageCount}">
								<a href="orderSearch?pageNum=${next}&osearchbar=${osearchbar}&otype=${otype }">></a>
							</c:if>
						</div>
					</div>
				</form>
				<div class="oManage_search_wrap">
					<form name="oSform">
						<table class="oManage_search">
							<tbody>
								<tr>
									<td><select name="otype" class="search_option">
											<option value="1">전체</option>
											<option value="2">주문번호</option>
											<option value="3">주문아이디</option>
											<option value="4">수령인</option>
									</select></td>
									<td><input type="text" name="osearchbar"
										id="oManage_searchbar"> 
										<button type="button"
										name="oManage_searchbtn" id="oManage_searchbtn" value="검색"
										onclick="goSearch()">
										<img src="./imgs/search.png"
												style="width: 15px; height: 15px;" id="search_icon">
												</button></td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../main/footer.jsp"%>
</body>
</html>