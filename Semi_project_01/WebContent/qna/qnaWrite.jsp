<link href="<%=request.getContextPath()%>/css/reset.css"
	rel="stylesheet" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/qnaWrite.css" />

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ssak, 나만의 책</title>
<script type="text/javascript">
function goRegister(){
	var frm = document.qnaWrite;
		frm.action="<%=request.getContextPath()%>/qnaWrite.do";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>

<body>
	<div class="register_res">
		<c:if test="${not empty register_fail}">
			<span>${register_fail}</span>
		</c:if>
	</div>
	<div id="c_main">
		<div id="c_nav">
			<h2 class="tit_c_nav">1:1 문의</h2>
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

			<a href="<%=request.getContextPath()%>/qnaList.do"
				class="link_inquire"> <span class="emph">도움이 필요하신가요 ?</span> 1:1
				문의하기
			</a>
		</div>

		<div class="page_section">
			<div class="head_aticle">
				<h2 class="tit">
					1:1 문의하기 <span class="tit_sub"> 고객님의 문의사항에 최대한 만족할 수 있는 답변을
						드리도록 노력하겠습니다. </span>
				</h2>
			</div>
			<div class="CSq1_cont_board">
				<form name="qnaWrite">
					<table>
						<tr>
							<td class="qna_ctg qna_box">질문유형</td>
							<td colspan="2" style="padding-left: 8px;"><select
								class="qna_se" name="qtype"
								style="width: 320px; height: 30px; border: 1px solid #e8e8e8;">
									<option value="기타">선택하세요</option>
									<option value="주문결제">주문/결제</option>
									<option value="커스텀문의">커스텀문의</option>
									<option value="배송문의">배송문의</option>
									<option value="회원문의">회원문의</option>
									<option value="기타">기타</option>
							</select></td>
						</tr>
						<tr>
							<td class="qna_title qna_box">제목</td>
							<td colspan="2" style="padding-left: 8px;"><input
								type="text" name="qtitle" placeholder="제목을 입력해주세요."
								style="width: 640px; height: 30px; border: 1px solid #e8e8e8;"></td>

						</tr>
						<tr>
							<td class="qna_desc qna_box">내용</td>
							<td colspan="2" style="padding-left: 8px;"><textarea
									name="qcontent"
									style="resize: none; width: 640px; height: 350px; border: 1px solid #e8e8e8; border: 1px solid #e8e8e8;"></textarea>
						</tr>
						<tr>
							<td colspan="3">
								<button type="button" onclick="goRegister()" class="b_button">접수하기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>

</html>