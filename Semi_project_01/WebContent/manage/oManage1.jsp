<link rel="stylesheet" type="text/css" href="../css/oManage1.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 조회 목록</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="../main/header.jsp"%>
<div class="oManage">
        <div class="oManage_aside">
            <div id="oManage_asidetlt">관리자페이지</div>
            <div class="oManage_asidenav">
                <ul>
                    <li><a href="memberList">회원정보조회 및 수정</a></li>
                    <li><a href="orderList">주문내역조회</a></li>
                    <li><a href="wreqList">탈퇴요청관리</a></li>
                </ul>
            </div>
        </div>

        <div class="oManage_cont">
            <div class="oManage_cont_title">
                주문내역 조회
            </div>
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
                                <td class="not1_oid"><a href="<%=request.getContextPath() %>/orderDetail?mid=${o.mid}">${o.mid}</a></td>
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
						<c:if test="${startPage != endPage}">
							<c:forEach varStatus="s"  begin="${startPage}" end="${endPage}" step="1">
								<a href="orderList?pageNum=${s.count}">${s.count}</a>	<!--변경 : href 경로 -->
							</c:forEach>
						</c:if>
						</div>
					</div>
                    <div class="oManage_search">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <select>
                                            <option>전체</option>
                                            <option>주문번호</option>
                                            <option>상품명</option>
                                            <option>수령인</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="oManage_searchbar" id="oManage_searchbar">
                                        <input type="button" name="oManage_searchbtn" id ="oManage_searchbtn" value="검색">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>