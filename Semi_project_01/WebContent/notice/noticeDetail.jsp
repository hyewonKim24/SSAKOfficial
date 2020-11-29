<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/noticeDetail.css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<title>ssak, 나만의 책</title>
<script type="text/javascript">
	function startUpdate() {
		var frm = document.noticeDetail;
		frm.method = "get";
		frm.action = "<%=request.getContextPath()%>/notice/noticeUpdate.jsp";
		frm.submit();
	}
	function goDelete() {
		var frm = document.noticeDetail;
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			frm.method = "post";
			frm.action = "<%=request.getContextPath()%>/noticeDelete.do";
			frm.submit();
		}else{   //취소
		    return;
		}
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
			<a href="<%=request.getContextPath()%>/qnaList.do" class="link_inquire"> <span class="emph">도움이
					필요하신가요 ?</span> 1:1 문의하기
			</a>
		</div>

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					공지사항 <span class="tit_sub"> 최신 싹(SSAK)의 소식을 보실 수 있습니다.</span>
				</h2>
			</div>
			<form name="noticeDetail">
				<div class="CSq1_cont_board">
					<input type="hidden" name="nno" value="${ndetail.nno}">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="ntitle" name="ntitle"
								style="padding-left: 8px;"><input type="hidden"
								name="ntitle" value="${ndetail.ntitle}">
								${ndetail.ntitle}</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
								<input type="hidden" name="mid" value="${ndetail.mid}">
								${ndetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id="ndate"  name="ndate"><fmt:formatDate
									value="${ndetail.ndate}" pattern="yyyy-MM-dd" var="date" /> <input
								type="hidden" name="ndate" value="${date}"> ${date}</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="nview" name="nview"><input type="hidden"
								name="nview" value="${ndetail.nview}"> ${ndetail.nview}
							</td>

						</tr>
						<tr>
							<td colspan="4" id="ncontent" name="ncontent"
								style="height: 350px;"><input type="hidden" name="ncontent"
								value="${ndetail.ncontent}"> ${ndetail.ncontent}</td>
						</tr>
					</table>
					<div class="b_button2">
						<c:if test="${not empty member}">
							<c:if test="${member.authority eq 1}">
								<button type="button" class="b_button" onclick="startUpdate()">수정</button>
								<button type="button" class="b_button" onclick="goDelete()">삭제</button>
							</c:if>
						</c:if>
						<button type="button" class="b_button" onclick="location.href='<%=request.getContextPath()%>/noticeList.do'">글목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>

</html>