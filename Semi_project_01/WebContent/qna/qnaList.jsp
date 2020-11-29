<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/qnaList.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>ssak, 나만의 책</title>

<script type="text/javascript">
function goSearch(){
   var frm = document.qnaSearch;
   frm.action="<%=request.getContextPath()%>/qnaSearch.do";
		frm.method = "post";
		frm.submit();
	}
	
<%String member = String.valueOf(session.getAttribute("member"));%>

function goQnAWrite(){
	var member="<%=member%>";
	if(member==null || member=="" ||member=="null"){
		console.log(member);
		alert('로그인 후 이용해주세요');
	}else{
		location.href="<%=request.getContextPath()%>/qna/qnaWrite.jsp";
		}
	}
</script>
</head>
<body>
	<c:if test="${not empty search_error }">
		<script>
			alert('${search_error}');
		</script>
	</c:if>
	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">고객센터</h2>
			<div class="inner_nav">
				<ul class="list_menu">
					<li><a href="<%=request.getContextPath()%>/noticeList.do">공지사항<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/qna/faqList.jsp">자주하는질문<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/qnaList.do">1:1문의<span
							class="aside_arrow">></span></a></li>
				</ul>
			</div>

			<a href="<%=request.getContextPath()%>/qnaList.do" class="link_inquire"> <span class="emph">도움이
					필요하신가요 ?</span> 1:1 문의하기
			</a>
		</div>



		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit_a">
					1:1 문의하기 <span class="tit_sub"> 고객님의 문의사항에 최대한 만족할 수 있는 답변을
						드리도록 노력하겠습니다. </span>
				</h2>
			</div>
			<table width="100%" align="center" cellpadding="0" cellspacing="0">
				<tbody>
					<tr>
						<td>
							<div class="section_t">
								<table width="100%" class="board-listheader" cellpadding="0"
									cellspacing="0">
									<thead>
										<tr>
											<th>No.</th>
											<th width="50%;">제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>

										</tr>
									</thead>
									<tbody>
										<!--목록 뿌리기 -->
										<c:if test="${not empty qnaList}">
											<!--변경 : el태그 - servlet이랑 맞추기 -->
											<c:forEach items="${qnaList}" var="v" varStatus="s">
												<tr>
													<td>${v.qno}</td>
													<td class="qtitle"><c:if test="${v.qref_step=='1'}">
															<a href="<%=request.getContextPath()%>/qnaDetail.do?qno=${v.qno}&pageNum=${s.count}">${v.qtitle}</a>
														</c:if> <c:if test="${v.qref_step=='2'}">
                                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                             답글 : <a
																href="<%=request.getContextPath()%>/qnaDetail.do?qno=${v.qno}&pageNum=${s.count}">${v.qtitle}</a>
														</c:if></td>
													<td>${v.mid}</td>
													<td><fmt:formatDate value="${v.qdate}"
															pattern="yyyy-MM-dd" var="date" /> ${date}</td>
													<td>${v.qview}</td>
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
			<script>
				$(function() {
					$('.layout-pagination-button').each(function() {
						if ($(this).prop('href') == window.location.href) {
							$(this).addClass('current');
						}
					});
				});
			</script>
			<div class="layout-pagination">
				<div class="pagediv">
					<c:if test="${startPage != 1}">
						<a href="<%=request.getContextPath()%>/qnaList.do?pageNum=${prev}"
							class="layout-pagination-button layout-back"><</a>
					</c:if>
					<c:if test="${startPage != endPage}">
						<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
							step="1">
							<a href="<%=request.getContextPath()%>/qnaList.do?pageNum=${s.current}"
								class="layout-pagination-button">${s.current}</a>
							<!--변경 : href 경로 -->
						</c:forEach>
					</c:if>
					<c:if test="${next < pageCount}">
						<a href="<%=request.getContextPath()%>/qnaList.do?pageNum=${next}"
							class="layout-pagination-button layout-next">></a>
					</c:if>
				</div>
				<div id="qWritebtn" name="qWrite">
					<button type="button" id="qWrite" name="qWrite"
						onclick="goQnAWrite();">글쓰기</button>
				</div>
			</div>
		</div>
		<table class="board-search board-search2">
			<tbody>
				<tr>
					<td>
						<div class="search_bt">
							<form name="qnaSearch" action="<%=request.getContextPath()%>/qnaSearch.do">
								<select class="opt_bt" name="qtype">
									<option value="전체">전체</option>
									<option value="주문결제">주문/결제</option>
									<option value="커스텀문의">커스텀문의</option>
									<option value="배송문의">배송문의</option>
									<option value="회원문의">회원문의</option>
									<option value="기타">기타</option>
								</select> <input type="text" id="qSearch" name="qSearch"
									placeholder="검색어를 입력해주세요">
								<button type="button" id="qSearchbtn" name="qSearchbtn"
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