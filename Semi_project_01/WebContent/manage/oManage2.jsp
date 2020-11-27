<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/oManage2.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역조회 상세페이지</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="../main/header.jsp"%>

    <div class="mManage">
        <div class="mManage_aside">
            <div class="mManage_asidetlt">회원관리</div>
            <div class="mManage_asidenav">
                <ul>
                      <li><a href="<%=request.getContextPath()%>/memberList">회원정보조회
							및 수정<span class="aside_arrow">></span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/OrderList">주문내역조회<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/wreqList">탈퇴요청관리<span
							class="aside_arrow">></span></a></li>
                </ul>
            </div>
            <div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>
				</a>
			</div>
        </div>

        <div class="mManage_cont">
            <div class="mManage_cont_title">
                주문 상세정보
            </div>
            <div class="mManage_cont_board">
                <div class="mDetailPage">
                <table>
                	<c:if test="${not empty odetail }">
                        <c:forEach items="${odetail }" var="od" varStatus="s" begin="0" end="0">
					 <tr>
                        <th colspan ="4" class="member_info">"${od.mid }" 회원의 주문내역입니다.</th>
					</tr>
                    <tr>
                        <th class="txt_title">주문번호</th>
                        <td class="txt_cont">${od.ono }</td>
                        <th class="txt_title">주문일자</th>
                        <td class="txt_cont">${od.odate}</td>
                    </tr>
                    	</c:forEach>
                	</c:if>
                	<c:if test="${not empty odetail }">
                        <c:forEach items="${odetail }" var="od" varStatus="s">
                    <tr>
                        <th colspan="2" class="txt_title">상품정보</th>
                        <th colspan="2" class="txt_title">상품금액(수량)</th>
                    </tr>
                    
                    <tr>
                        <td class="txt_cont" id="product_img"><a href="#"><img src="${od.bcover }" class="Bimg"></a></td>
                        <td class="txt_cont">${od.btitle }</td>
                        <td class="txt_cont">${od.bpricesales }</td>
                        <td class="txt_cont">${od.oamount }</td>
                    </tr>
                		</c:forEach>
                	</c:if>
                	<c:if test="${not empty odetail }">
                        <c:forEach items="${odetail }" var="od" varStatus="s" begin="1" end="1">
                    <tr>
                        <th rowspan="2" class="txt_title">결제수단</th>
                        <td rowspan="2" class="txt_cont">${od.opay}</td>
                        <th class="txt_title" >배송비</th>
                        <td class="txt_cont">${od.odprice}</td>
                    </tr>
                    <tr>
                        <th class="txt_title">총결제금액</th>
                        <td class="txt_cont" >${od.ototalprice}</td>
                    </tr>
                    <tr>
                        <th colspan="2" class="txt_title">수령인</th>
                        <td colspan="2" class="txt_cont">${od.oname}</td>
                    </tr>
                    <tr>
                        <th colspan="2" class="txt_title">수령자 연락처</th>
                        <td colspan="2" class="txt_cont">${od.ophone}</td>
                    </tr>
                    <tr>
                        <th colspan="2" class="txt_title">수령자 주소</th>
                        <td colspan="2" class="txt_cont">${od.oaddr1}</td>
                    </tr>
                    	</c:forEach>
                	</c:if>
                    <tr>
                        <td colspan="4">
                            <input type="button" id="back" value="뒤로가기" onclick="location.href='<%=request.getContextPath() %>/OrderList'">
                        </td>
                    </tr>
                </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>