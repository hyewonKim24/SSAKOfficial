<link rel="stylesheet" type="text/css" href="../css/oManage2.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<%@ include file="../main/header.jsp"%>

    <div class="mManage">
        <div class="mManage_aside">
            <h2>회원관리</h2>
            <div class="mManage_asidenav">
                <ul>
                    <li><a href="./ssak_mManage_1.html">회원정보조회 및 수정</a></li>
                    <li><a href="./ssak_oManage_1.html">주문내역조회</a></li>
                    <li><a href="./ssak_wManage_1.html">탈퇴요청관리</a></li>
                </ul>
            </div>
        </div>

        <div class="mManage_cont">
            <div class="mManage_cont_title">
                <h2>주문 상세정보
                </h2>
            </div>
            <div class="mManage_cont_board">
                <div class="order_info">
                <table>
            <!--     ovo.setMid(rs.getString("mid"));
				ovo.setOno(rs.getInt("ono"));
				ovo.setOdate(rs.getDate("odate"));
				ovo.setOamount(rs.getInt("oamount"));
				ovo.setDno(rs.getInt("dno"));
				ovo.setBISBN(rs.getString("BISBN"));
				ovo.setBcover(rs.getString("bcover"));
				ovo.setBtitle(rs.getString("btitle"));
				ovo.setBpriceStandard(rs.getInt("bpriceStandard"));
				ovo.setBpricesales(rs.getInt("bpricesales"));
				ovo.setOpay(rs.getString("opay"));
				ovo.setOdprice(rs.getInt("odprice"));
				ovo.setOtotalprice(rs.getInt("ototalprice"));
				ovo.setOname(rs.getString("oname"));
				ovo.setOphone(rs.getString("ophone"));
				ovo.setOaddr1("oaddr1");
			} -->
                    <tr>
                        <th>주문번호</th>
                        <td>${odetail.ono }</td>
                        <th>주문일자</th>
                        <td>${odetail.odate}</td>
                        <th>주문자 아이디</th>
                        <td>${odetail.mid }</td>
                    </tr>
                    <tr>
                        <th colspan="4">상품정보</th>
                        <th colspan="2">상품금액(수량)</th>
                    </tr>
                    <c:if test="${not empty odetail }">
                        <c:forEach items="${odetail }" var="od" varStatus="s">
                    <tr>
                        <td colspan="2">${od.bcover }</td>
                        <td colspan="2">${od.btitle }</td>
                        <td>${od.bpricesales }</td>
                        <td>${od.oamount }</td>
                    </tr>
                		</c:forEach>
                	</c:if>
                    <tr>
                        <th rowspan="2">결제수단</th>
                        <td rowspan="2">${odetail.opay}</td>
                    </tr>
                    <tr>
                        <th colspan="2">배송비</th>
                        <td colspan="2">${odetail.odprice}</td>
                    </tr>
                    <tr>
                        <th colspan="2">총결제금액</th>
                        <td colspan="2">${odetail.ototalprice}</td>
                    </tr>
                    <tr>
                        <th colspan="3">수령인</th>
                        <td colspan="3">${odetail.oname}</td>
                    </tr>
                    <tr>
                        <th colspan="3">수령자 연락처</th>
                        <td colspan="3">${odetail.ophone}</td>
                    </tr>
                    <tr>
                        <th colspan="3">수령자 주소</th>
                        <td colspan="3">${odetail.oaddr1}</td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <input type="button" value="뒤로가기" onclick="location.href='orderList'">
                        </td>
                    </tr>
                </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>