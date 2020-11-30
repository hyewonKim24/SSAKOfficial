<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mManage1.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String crtpath= request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="./css/mManage1.css" rel="stylesheet" type="text/css"> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>회원정보 조회 및 수정</title>
<script type="text/javascript">
	function goSearch() {
		var frm = document.mSform;
		frm.action = "<%=request.getContextPath()%>/memberSearch.do";
		frm.method = "post";
		frm.submit();
	}
</script>
</head>
<body>
<%@ include file="../main/header.jsp"%>
	<div class="mManage">
        <div class="mManage_aside">
            <div class ="mManage_asidetlt">회원관리</div>
            <div class="mManage_asidenav">
                <ul>
                   <li><a href="<%=request.getContextPath() %>/memberList.do">회원정보조회 및 수정<span class="aside_arrow">></span></a></li>
                 <li><a href="<%=request.getContextPath() %>/OrderList.do">주문내역조회<span class="aside_arrow">></span></a></li>
                 <li><a href="<%=request.getContextPath() %>/wreqList.do">탈퇴요청관리<span class="aside_arrow">></span></a></li>
                </ul>
            </div>
            <div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>
				</a>
			</div>
        </div>

      
		<div class="mManage_cont">
			<div class="mManage_cont_title">회원정보 조회 및 수정<span id="mManage_cont_subtitle">'${msearchbar}' (으)로 검색한
				결과입니다. </span></div>
			
			<div class="mManage_cont_board">

				<form method="GET" action="#">
					<table class="mManage_cont_board_tb1">
						<thead>
							<tr>
								<th class="txt_mno">회원번호</th>
								<th class="txt_id">아이디</th>
								<th class="txt_name">이름</th>
								<th class="txt_gd">성별</th>
								<th class="txt_bday">생년월일</th>
								<th class="txt_email">이메일주소</th>
								<th class="txt_addr">주소</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty mlist}">
								<!--변경 : el태그 - servlet이랑 맞추기 -->
								<c:forEach items="${mlist}" var="m" varStatus="s">
									<!--변경 : el태그 - servlet이랑 맞추기 -->
									<tr class="notice1">
										<td class="not1_mno">${m.mno}</td>
										<td id="not1_id"><a href="<%=request.getContextPath()%>/memberDetail.do?mid=${m.mid}">${m.mid}</a></td>
										<td class="not1_name">${m.mname}</td>
										<td class="not1_gd">${m.mgender}</td>
										<td class="not1_bday">${m.mbirthday}</td>
										<td class="not1_email">${m.memail}</td>
										<td class="not1_addr">${m.m_first_addr}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<div class="mManage_pagination">
						<div class="mManage_pagination_warp">
							<c:if test="${startPage != 1}">
								<a href="memberSearch.do?pageNum=${prev}&msearchbar=${msearchbar}&mtype=${mtype }"><</a>
							</c:if>
							<c:if test="${startPage != endPage}">
								<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
									step="1">
									<a
										href="memberSearch.do?pageNum=${s.current}&msearchbar=${msearchbar}&mtype=${mtype }">${s.current}</a>
									<!--변경 : href 경로 -->
								</c:forEach>
							</c:if>
							<c:if test="${next < pageCount}">
								<a href="memberSearch.do?pageNum=${next}&msearchbar=${msearchbar}&mtype=${mtype }">></a>
							</c:if>
						</div>
					</div>
				</form>

				<div class="mManage_search_wrap">
				<form name="mSform">
					<table class="mManage_search">
						<tbody>
							<tr>
								<td><select name="mtype" class="search_option">
										<option value="1">전체</option>
										<option value="2">아이디</option>
										<option value="3">이름</option>
								</select></td>
								<td>
										<input type="text" name="msearchbar"
											id="mManage_searchbar"> 
										<button type="button"
											name="mManage_searchbtn" id="mManage_searchbtn" value="검색" 
											onclick="goSearch()">
											<img src="<%=request.getContextPath() %>/imgs/search.png"
												style="width: 15px; height: 15px;" id="search_icon">
												</button>
								</td>
							</tr>
						</tbody>
					</table>
					</form>
				</div>
			</div>
		</div>
    </div>
</body>
</html>