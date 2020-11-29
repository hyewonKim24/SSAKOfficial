<link href="<%=request.getContextPath() %>/reset.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/noticeUpdate.css" />
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>ssak, 나만의 책</title>

<script type="text/javascript">
	function endUpdate() {
		var frm = document.nDetialUpdate;
		frm.action = "<%=request.getContextPath()%>/noticeUpdate.do";
		frm.method = "post";
		frm.submit();
	}
	function goBack() {
		location.href="<%=request.getContextPath()%>/noticeList.do";
	}
</script>
<c:if test="${not empty noticeUpdate}">
	<c:forEach items="${noticeUpdate}">
		alert(${noticeUpdate});
	</c:forEach>
</c:if>
</head>
<body>
	<div id="wrap">
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

				<a href="<%=request.getContextPath()%>/qnaList.do" class="link_inquire"> <span class="emph">도움이
						필요하신가요 ?</span> 1:1 문의하기
				</a>
			</div>

			<div class="page_section">
				<div class="head_aticle">
					<h2 class="tit">
						공지사항 <span class="tit_sub"> 최신 싹(SAKK)의 소식을 보실 수 있습니다. </span>
					</h2>
				</div>
	

				<div class="CSq1_cont_board">
					<form name="nDetialUpdate">
						<input type="hidden" name="nno" value="${param.nno}">
						<table class="qnq_board" style="margin-top: 34px;">
							<tr>
								<td class="qna_title qna_box">제목</td>
								<td colspan="2" style="padding-left: 8px;"><input
									type="text" id="ntitle" name="ntitle"
									style="width: 640px; height: 30px; border: 1px solid #e8e8e8;" value="${param.ntitle}"></td>
							</tr>
							<tr>
								<td class="qna_desc qna_box">내용</td>
								<td colspan="2" style="padding-left: 8px;">
								<textarea cols="50" rows="10" id="ncontent" name="ncontent" style="width: 640px; height: 350px; border: 1px solid #e8e8e8; "  value="${param.ncontent}"></textarea>
								
								</td>
							</tr>
						</table>
						<div class="subM">
							<input type="button" onclick="endUpdate()" value="수정하기"
								class="b_button"> <input type="button" class="b_button"
								value="취소" onclick="goBack()">
						</div>
					</form>
				</div>
			</div>
			<p></p>
		</div>
	</div>
		<%@include file="../main/footer.jsp"%>
</body>
</html>