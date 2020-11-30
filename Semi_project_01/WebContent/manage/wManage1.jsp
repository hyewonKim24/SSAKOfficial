<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/wManage1.css" />
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>ssak, 나만의 책</title>
<script type="text/javascript">
	function goSearch() {
		var frm = document.wSform;
		frm.action = "<%=request.getContextPath()%>/wreqSearch.do";
		frm.method = "post";
		frm.submit();
	}
</script>

</head>
<body>
	<%@ include file="../main/header.jsp"%>
	<div class="wdrManage">
		<div class="wdrManage_aside">
			<div class="wdrManage_asidetlt">회원관리</div>
			<div class="wdrManage_asidenav">
				<ul>
					<li><a href="<%=request.getContextPath()%>/memberList.do">회원정보조회
							및 수정<span class="aside_arrow">></span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/OrderList.do">주문내역조회<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/wreqList.do">탈퇴요청관리<span
							class="aside_arrow">></span></a></li>
				</ul>
			</div>
			<div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>

				</a>
			</div>

		</div>
		<div class="wdrManage_cont">
			<div class="wdrManage_cont_title">탈퇴요청관리</div>
			<div class="wdrManage_cont_board">
				<form>
					<table class="wdrManage_cont_board_tb1">
						<thead>
							<tr>
								<th class="txt_wdrno">번호</th>
								<th class="txt_wdrid">아이디</th>
								<th class="txt_wdrdate">탈퇴요청일</th>
								<th class="txt_wdracpDate">탈퇴승인일</th>
								<th class="txt_wdracp">탈퇴승인여부</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty wdlist}">
								<!--변경 : el태그 - servlet이랑 맞추기 -->
								<c:forEach items="${wdlist}" var="wd" varStatus="s">
									<!--변경 : el태그 - servlet이랑 맞추기 -->
									<tr class="notice1">
										<td class="not1_wdrno">${wd.wno}</td>
										<td class="not1_wdrid"><a href="wreqDetail.do?mid=${wd.mid }">${wd.mid }</a></td>
										<!-- 아이디를 클릭했을때 해당 아이디에 댛한 상세정보를 표시해줘야함 (id 값을 디비에 저장된것과 비교해서 같은것에 대한 정보를 가져옴) -->
										<td id="not1_wdrdate">${wd.wrer }</td>
										<td class="not1_wdracpDate">${wd.wred }</td>
										<td class="not1_wdracp">${wd.wacd }</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<div class="wdrManage_pagination">
						<div class="wdrManage_pagination_warp">
							<c:if test="${startPage != 1}">
								<a href="wreqList.do?pageNum=${prev}"><</a>
							</c:if>
							<c:if test="${startPage != endPage}">
								<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
									step="1">
									<a href="wreqList.do?pageNum=${s.current}">${s.current}</a>
									<!--변경 : href 경로 -->
								</c:forEach>
							</c:if>
							<c:if test="${next < pageCount}">
								<a href="wreqList.do?pageNum=${next}">></a>
							</c:if>
						</div>
					</div>
				</form>

				<div class="wdrManage_search_wrap">
					<form name="wSform">
						<table class="wdrManage_search">
							<tbody>
								<tr>
									<td><select name="wtype" class="search_option">
											<option value="1">전체</option>
											<option value="2">아이디</option>
											<option value="3">요청일자</option>
											<option value="4">승인여부</option>
									</select></td>
									<td><input type="text" name="wsearchbar"
										id="wdrManage_searchbar">
										<button type="button" name="wdrManage_searchbtn"
											id="wdrManage_searchbtn" value="검색" onclick="goSearch()">
											<img src="<%=request.getContextPath() %>/imgs/search.png"
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
<%@include file="../main/footer.jsp"%>
</body>
</html>