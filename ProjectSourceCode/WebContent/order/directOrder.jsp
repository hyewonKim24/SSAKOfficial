<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/directOrder.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../main/header.jsp"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssak, 나만의 책</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <script>
	$(function(){				
		//주문완료
		$('#order').click(function(){
			if($('#checkBox_01').prop('checked') == false || $('#checkBox_02').prop('checked') == false){
				alert("약관에 동의해주세요.")
			} else{
				var frm=document.orderform;
				frm.method="post";
				frm.action="OrderInsert.do"
				frm.submit();			
			}				
		});
	});
    </script>
</head>
<body>
<div id="directOrder_wrap">
   <section>
        <h2>주문/결제</h2>

        <div id="column">
            <div class="product_info">상품정보</div>
            <div class="amount">수량</div>
            <div class="price">상품금액</div>
        </div>
        <form name="orderform" id="orderform">

         <c:if test="${not empty list2}">
         <c:forEach var="n" items="${list2}" varStatus="e"> 
            <ul id="item">
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
                <h3>배송지 정보</h3>
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
                        <td><input type="text" class="member_txt" id="mzip_code" name="maddress" value="${member.mzip_code}" >
                        	<button type="button" class="form_btn"
								onclick="sample4_execDaumPostcode();">우편번호 찾기</button>
                        </td>
                    </tr>
                    
                    <script>
						function sample4_execDaumPostcode() {
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

											// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var roadAddr = data.roadAddress; // 도로명 주소 변수
											var extraRoadAddr = ''; // 참고 항목 변수

											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraRoadAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraRoadAddr += (extraRoadAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraRoadAddr !== '') {
												extraRoadAddr = ' ('
														+ extraRoadAddr + ')';
											}

											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document
													.getElementById('mzip_code').value = data.zonecode;
											document
													.getElementById("m_first_addr").value = roadAddr;
											document
													.getElementById("sample4_jibunAddress").value = data.jibunAddress;

											// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
											if (roadAddr !== '') {
												document
														.getElementById("sample4_extraAddress").value = extraRoadAddr;
											} else {
												document
														.getElementById("sample4_extraAddress").value = '';
											}

											var guideTextBox = document
													.getElementById("guide");
											// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
											if (data.autoRoadAddress) {
												var expRoadAddr = data.autoRoadAddress
														+ extraRoadAddr;
												guideTextBox.innerHTML = '(예상 도로명 주소 : '
														+ expRoadAddr + ')';
												guideTextBox.style.display = 'block';

											} else if (data.autoJibunAddress) {
												var expJibunAddr = data.autoJibunAddress;
												guideTextBox.innerHTML = '(예상 지번 주소 : '
														+ expJibunAddr + ')';
												// guideTextBox.style.display = 'block';
											} else {
												guideTextBox.innerHTML = '';
												guideTextBox.style.display = 'none';
											}
										}
									}).open();
						}
					</script>
                    
                    <tr>
                    	<td><input type="text" class="member_txt" id="m_first_addr" name="maddress2" value="${member.m_first_addr }" ></td>
                    </tr>
                    <tr>
                    	<td><input type="text" class="member_txt" id="m_second_addr" name="maddress3" value="${member.m_second_addr }" placeholder="상세주소"></td>
                    	<td><input type="text" id="sample4_jibunAddress" class="form_input"></td>
						<td><input type="text" id="sample4_extraAddress" class="form_input"></td>
						<td><input type="hidden" id="guide" class="form_input"></td>
                    </tr>
                    <tr>
                        <td class="member row">배송메모</td>
                        <td><input type="text" class="member_txt" name="mtext" placeholder="요청사항을 입력해주세요"></td>
                    </tr>
                </table>
            </div>
            
            <div id="pay_result">
                <h3 class="non_line_title">결제 금액</h3>
                <table>
                    <tr>
                        <td class="row ">주문금액</td>
                        <td class="result">${(dioamount*n.bpricestandard)}</td>
                        <td>원</td>
                    </tr>
		    		<tr>
                        <td class="row ">커스텀</td>
                        <td class="result">${n.dprice*diamount}</td>
                        <td>원</td>
                    </tr>
                    <tr>
                        <td class="row ">배송비</td>
                        <td class="result">2500</td>
                        <td>원</td>
                    </tr>
                    <tr>
                        <td class="row ">상품할인</td>
                        <td class="result">${((dioamount*n.bpricesales)+n.dprice)-((dioamount*n.bpricestandard)+n.dprice)}</td>
                        <td>원</td>
                    </tr>
                    <tr class="underline">
                        <td class="row ">결제금액</td>
                        <td class="result">${(dioamount*n.bpricesales)+n.dprice+2500}</td>
                        <td>원</td>
                    </tr>
                </table>
            </div> 
            
            <div id="payment">
                <h3>결제 수단</h3>
                <ul>
                    <li>
                        <input type="radio" class="radio" id="credit_card" name="payment" value="신용카드"><label for="credit_card">&nbsp;&nbsp;신용카드</label>
                    </li>
                    <li>
                        <input type="radio" class="radio" id="virtual_account" name="payment" value="가상 계좌"><label for="virtual_account">&nbsp;&nbsp;가상 계좌</label>
                    </li>
                    <li>
                        <input type="radio" class="radio" id="toss" name="payment" value="토스"><label for="toss">&nbsp;&nbsp;토스</label>
                    </li>

                    <li><input type="radio" class="radio" id="kakaopay" name="payment" value="카카오페이"><label for="kakaopay">&nbsp;&nbsp;카카오페이</label>
                    </li>
                    <li>
                    <input type="radio" id="etcpayment" name="payment"  value="기타결제수단"><label for="etcpayment">&nbsp;&nbsp;기타결제수단</label>
                    <input type="hidden" name="osalesprice" value="${(dioamount*n.bpricesales)+n.dprice}">
                    <input type="hidden" name="ototalprice" value="${(dioamount*n.bpricestandard)+n.dprice}">
                    <input type="hidden" name="ototalamount" value="${dioamount}">
                    </li>
                </ul>
            </div>



        </c:forEach>
        </c:if>
	 <hr id="line2">
            <div id="agreement">
                <h3>개인정보 수집/제공</h3>
                <div>
                    <input type="checkbox" id="checkBox_01" name="checkBox_01">
              		<label for="checkBox_01">
                    	&nbsp;개인정보 수집·이용 및 위탁 동의(필수)</label>
                </div>
                <div>
                    <input type="checkbox" id="checkBox_02" name="checkBox_02">
                    <label for="checkBox_02">
                    &nbsp;결제대행 서비스 약관 동의(필수)</label>
                </div>
            </div>
            <button type="button" id="order">결제하기</button>
        </form>
    </section>
    </div>
    <%@include file="../main/footer.jsp"%>
</body>
</html>