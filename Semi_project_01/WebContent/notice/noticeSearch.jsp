<link href="./reset.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/noticeSearch.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssak, 나만의 책</title>
<script type="text/javascript">
function goSearch(){
	var frm = document.noticeSearch;
	frm.action="<%=request.getContextPath()%>/noticeSearch.do";
		frm.method = "post";
		frm.submit();
	}
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
				<h2 class="tit">
					공지사항 <span class="tit_sub"> ' ${nSearch} ' (으)로 검색한 결과입니다. </span>
				</h2>
			</div>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="xans-element- xans-myshop xans-myshop-couponserial ">
								<table width="100%" class="xans-board-listheader jh"
									cellpadding="0" cellspacing="0">
									<thead>
										<tr>
											<th>No.</th>
											<th>제목</th>
											<th>등록일</th>
											<th>조회수</th>
										</tr>
									</thead>

									<!--목록 뿌리기 -->
									<c:if test="${not empty searchList}">
										<!--변경 : el태그 - servlet이랑 맞추기 -->
										<c:forEach items="${searchList}" var="v" varStatus="s">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<tr>
												<td>${v.ncount}</td>
												<td><a
													href="<%=request.getContextPath()%>/noticeDetail.do?nno=${v.nno}&pageNum=${s.count}">${v.ntitle}</a></td>
												<td>${v.ndate}</td>
												<td>${v.nview}</td>
											</tr>
										</c:forEach>
									</c:if>
									</tbody>

								</table>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<!--페이징 아래 숫자-->
			<div class="pagediv">
				<c:if test="${startPage != 1}">
					<a href="<%=request.getContextPath()%>/noticeSearch.do?pageNum=${prev}"
						class="layout-pagination-button layout-back"><</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">
						<a href="<%=request.getContextPath()%>/noticeSearch.do?pageNum=${s.current}&nSearch=${nSearch}"
							class="layout-pagination-button">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${next < pageCount}">
					<a href="<%=request.getContextPath()%>/noticeSearch?pageNum=${next}&msearchbar=${msearchbar}"
						class="layout-pagination-button layout-next">></a>
				</c:if>
			</div>
		</div>
		<table class="xans-board-search xans-board-search2">
			<tbody>
				<tr>
					<td>
						<div class="search_bt">
							<form name="noticeSearch" action="<%=request.getContextPath()%>/noticeSearch.do">

								<input type="text" id="nSearch" name="nSearch"
									placeholder="검색어를 입력해주세요">
								<button type="button" id="nSearchbtn" name="nSearchbtn"
									onclick="goSearch()">
									<img src="<%=request.getContextPath()%>/imgs/Search_white.png"
										style="width: 15px; height: 15px;">
								</button>
							</form>
						</div>

					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>
