<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="./reset.css" rel="stylesheet" type="text/css">
	<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
    <title>Order Page</title>

    <style>
        body {
            width: 100%;
            position: relative;
            font-size: 13px;
            font-weight: bold;
        }

        a {
            text-decoration: none;
            color: black;
        }

        section {
            width: 1080px;
            margin: 0 auto;
            position: relative;
        }

        h2 {
            text-align: center;
            margin: 30px 0 50px 0;
        }

        h3 {
            padding-bottom: 5px;
            border-bottom: 2px solid gray;
        }

        .non_line_title {
            border: none;
            padding: 0;
        }

        .img_book {
            width: 100px;
            border: 1px solid lightgray;
        }

        #column {
            width: 100%;
            display: flex;
            border-top: 2px solid gray;
            border-bottom: 2px solid gray;
            padding: 10px 0;
        }

        #column :nth-child(1) {
            flex-shrink: 1;
            text-align: center;
            margin: auto;
        }

        #column :nth-child(2) {
            text-align: center;
            flex-basis: 130px;
            flex-shrink: 0;
            margin: auto;
            margin-right: 10px;
        }
        
        #column :nth-child(3) {
            text-align: center;
            flex-basis: 130px;
            flex-shrink: 0;
            margin: auto;
            margin-right: 10px;
        }

        .item {
            width: 100%;
            display: flex;
            padding: 10px 0;
            border-bottom: 1px solid gray;
        }

        .product_img {
            flex-basis: 110px;
            flex-shrink: 0;
            margin: auto 20px;
        }

        .product_info {
            text-align: left;
            flex: 1 1 auto;
            margin: auto;
            margin-left: 60px;
            overflow: hidden;
            width:200px;
        }
		.amount{
		    text-align: center;
            flex-basis: 130;
            flex-shrink: 0;
            margin: auto;
            margin-right: 105px;
		}
        .price {
            text-align: right;
            flex-basis: 130;
            flex-shrink: 0;
            margin: auto;
            margin-right: 50px;
        }

        .indent {
            width: 70px;
            text-align: right;
            margin: auto;
            padding: 20px;
            font-size: 30px;
            color: rgb(200, 200, 200);
        }

        #order_member {
            margin-top: 80px;
            margin-bottom: 80px;
            width: 100%;
        }

        .row {
            padding: 20px;
            text-align: left;
        }

        .member_txt {
            width: 200px;
        }

        #payment {
            float: left;
            width: 320px;
            height: 200px;
            margin-bottom: 80px;
        }
	
		#payment>ul{
		list-style: none;
		}
        #payment>ul>li {
            padding: 12px;
        }

        #pay_result {
            float: right;
            width: 320px;
            margin-bottom: 80px;
        }

        #pay_result>table {
            width: 320px;
            height: 200px;
            background-color: rgb(223, 223, 223);
        }

        .result {
            font-size: 20px;
            text-align: right;
            padding: 10px;
        }

        #agreement {
            clear: both;
        }

        .underline {
            border-top: 1px solid gray;
        }

        #order {
            clear: both;
            padding: 10px 30px;
            font-size: 20px;
            display: table;
            margin: auto;
            margin-top: 80px;
            margin-bottom: 30px;
        }
    </style>
    <script>
	$(function(){				
		//주문완료
		$('#order').click(function(){
			if($('#checkBox_01').prop('checked') == false || $('#checkBox_02').prop('checked') == false){
				alert("약관에 동의해주세요.")
			} else{
				var frm=document.orderform;
				frm.method="post";
				frm.action="OrderInsert"
				frm.submit();			
			}				
		});
	});
    </script>
</head>
<body>
   <section>
        <h2>주문/결제</h2>
        <h3 class="non_line_title">상품정보</h3>
        <div id="column">
            <div class="product_info">상품정보</div>
            <div class="amount">수량</div>
            <div class="price">상품금액</div>
        </div>
        <form name="orderform">

         <c:if test="${not empty list2}">
         <c:forEach var="n" items="${list2}" varStatus="e"> 
            <ul>
                <li class="item">
                	<input type="hidden" name="oamount" value="${dioamount}">
                    <a href="#" class="product_img"><img src="${n.bcover}" class="img_book"></a>
                    <a href="#" class="product_info">${n.btitle}</a>
                    <div class="amount">${dioamount}</div>
                    <div class="price">
                        <span class="selling">${dioamount*n.bpricesales}</span>
                        <span class="won">원</span>
                        <input type="hidden" name="bisbn" value="${n.bisbn}">
                        <input type="hidden" name="dno" value="${n.dno}">
                    </div>
                </li>
                <c:if test="${n.dno!=0}">
                <li class="custom item">
                    <div class="indent">&#9495;</div>
                    <a href="#" class="product_img"><img src="${n.dimg}" class="img_book"></a>
                    <a href="#" class="product_info">${n.ddesc}</a>
                    <div class="price">
                        <span class="selling">${n.oamount*n.dprice}</span>
                        <span class="won">원</span>
                    </div>
                    
                </li>
                </c:if>
            </ul>

        
        
        
            <div id="order_member">
                <h3>주문자 정보</h3>
                <table>
                    <tr>
                        <td class="member row">수령인</td>
                        <td><input type="text" class="member_txt" name="mname" value="${member.mname }"></td>
                    </tr>
                    <tr>
                        <td class="member row">전화번호</td>
                        <td><input type="text" class="member_txt" name="mphone" value="${member.mphone }" ></td>
                    </tr>
                    <tr>
                        <td rowspan="3" class="member row">배송지 주소</td>
                        <td><input type="text" class="member_txt"  name="maddress" value="${member.mzip_code}" ></td>
                    </tr>
                    <tr>
                    	<td><input type="text" class="member_txt"  name="maddress2" value="${member.m_first_addr }" ></td>
                    </tr>
                    <tr>
                    	<td><input type="text" class="member_txt"  name="maddress3" value="${member.m_second_addr }" ></td>
                    </tr>
                    <tr>
                        <td class="member row">배송메모</td>
                        <td><input type="text" class="member_txt" name="mtext" placeholder="내용을 입력해주세요"></td>
                    </tr>
                </table>
            </div>
            <div id="payment">
                <h3>결제 수단</h3>
                <ul>
                    <li>
                        <input type="radio" id="credit_card" name="payment" value="신용카드"><label for="credit_card">신용카드</label>
                    </li>
                    <li>
                        <input type="radio" id="virtual_account" name="payment" value="가상 계좌"><label for="virtual_account">가상 계좌</label>
                    </li>
                    <li>
                        <input type="radio" id="toss" name="payment" value="토스"><label for="toss">토스</label>
                    </li>

                    <li><input type="radio" id="kakaopay" name="payment" value="카카오페이"><label for="kakaopay">카카오페이</label>
                    </li>
                    <li>
                    <input type="radio" id="etcpayment" name="payment"  value="기타결제수단"><label for="etcpayment">기타결제수단</label>
                    <input type="hidden" name="osalesprice" value="${(dioamount*n.bpricesales)+n.dprice}">
                    <input type="hidden" name="ototalprice" value="${(dioamount*n.bpricestandard)+n.dprice}">
                    <input type="hidden" name="ototalamount" value="${dioamount}">
                    </li>
                </ul>
            </div>


            <div id="pay_result">
                <h3 class="non_line_title">결제 금액</h3>
                <table>
                    <tr>
                        <td class="row ">주문금액</td>
                        <td class="result">${(dioamount*n.bpricesales)+n.dprice}</td>
                        <td>원</td>
                    </tr>
                    <tr>
                        <td class="row ">배송비</td>
                        <td class="result">2500</td>
                        <td>원</td>
                    </tr>
                    <tr class="underline">
                        <td class="row ">결제금액</td>
                        <td class="result">${(dioamount*n.bpricesales)+n.dprice+2500}</td>
                        <td>원</td>
                    </tr>
                </table>
            </div>
        </c:forEach>
        </c:if>
            <div id="agreement">
                <h3>개인정보 수집/제공</h3>
                <div>
                    <input type="checkbox" id="checkBox_01" name="checkBox_01">
                    <a href="#">개인정보 수집·이용 및 위탁 동의(필수)</a>
                </div>
                <div>
                    <input type="checkbox" id="checkBox_02" name="checkBox_02">
                    <a href="#">결제대행 서비스 약관 동의(필수)</a>
                </div>
            </div>
            <button type="button" id="order">결제하기</button>
        </form>
    </section>
</body>
</html>