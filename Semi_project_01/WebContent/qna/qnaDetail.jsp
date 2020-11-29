<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/qnaDetail.css" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>ssak, 나만의 책</title>
<script type="text/javascript">
	function startUpdate(){
		var frm = document.qnaDetail;
		frm.method = "post";
		frm.action = "<%=request.getContextPath()%>/qna/qnaUpdate.jsp";
		frm.submit();
	}
	function goBackList(){
		location.href="<%=request.getContextPath()%>/qnaList.do";	
	}
	function goDelete(){
		var frm = document.qnaDetail;
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			frm.method = "post";
			frm.action = "<%=request.getContextPath()%>/qnaDelete.do";
			frm.submit();
		}else{   //취소
		    return;
		}
	}
	function goReply(){
		var frm = document.qnaDetail;
		frm.method = "post";
		frm.action = "<%=request.getContextPath()%>/qna/qnaReply.jsp";
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
				<h2 class="tit">
					1:1 문의하기 <span class="tit_sub"> 고객님의 문의사항에 최대한 만족할 수 있는 답변을
						드리도록 노력하겠습니다.</span>
				</h2>
			</div>
			<form name="qnaDetail">
				<div class="CSq1_cont_board">
					<table>
						<tr>
							<td class="qna_ctg qna_box">제목</td>
							<td colspan="3" id="qtitle" name="qtitle"
								style="padding-left: 8px;"><input type="hidden"
								name="qtitle" value="${qdetail.qtitle}">
								${qdetail.qtitle}</td>
						</tr>
						<tr>
							<td class="qna_onum qna_box">작성자</td>
							<td colspan="3" id="mid" name="mid" style="padding-left: 8px;">
								<input type="hidden" name="mid" value="${qdetail.mid}">
								${qdetail.mid}
							</td>
						</tr>
						<tr>
							<td class="qna_title qna_box">작성일</td>
							<td style="padding-left: 8px;" id=qdate " name="qdate"><fmt:formatDate
									value="${qdetail.qdate}" pattern="yyyy-MM-dd" var="date" /> <input
								type="hidden" name="qdate" value="${date}"> ${date}</td>
							<td class="qna_title2 qna_box">조회수</td>
							<td id="qview" name="qview"><input type="hidden"
								name="qview" value="${qdetail.qview}"> ${qdetail.qview}</td>

						</tr>
						<tr>
							<td colspan="4" id="qcontent" name="qcontent"
								style="height: 350px;"><input type="hidden" name="qcontent"
								value="${qdetail.qcontent}"> ${qdetail.qcontent} <input
								type="hidden" name="qno" value="${qdetail.qno}"> <input
								type="hidden" name="qref" value="${qdetail.qref}"> <input
								type="hidden" name="qref_step" value="${qdetail.qref_step}">
								<input type="hidden" name="qref_level"
								value="${qdetail.qref_level}"> <input type="hidden"
								name="qtype" value="${qdetail.qtype}"></td>
						</tr>
					</table>
					<div class="b_button2">
						<c:if test="${not empty member}">
							<c:choose>
								<c:when test="${member.authority eq 1}">
									<button type="button" class="b_button" onclick="goReply()">답글달기</button>
									<button type="button" class="b_button" onclick="startUpdate()">수정</button>
									<button type="button" class="b_button" onclick="goDelete()">삭제</button>
								</c:when>
								<c:when test="${member.mid eq qdetail.mid}">
									<button type="button" class="b_button" onclick="startUpdate()">수정</button>
									<button type="button" class="b_button" onclick="goDelete()">삭제</button>
								</c:when>
							</c:choose>
						</c:if>
						<c:if test="${empty member}">
							<span></span>
						</c:if>
						<button type="button" class="b_button" onclick="goBackList()">글목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>

</html>