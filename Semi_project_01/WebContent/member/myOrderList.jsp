<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/myOrderList.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/22634e2e1a.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>ssak, 나만의 책</title>

</head>	

<body>
	<div class="mypage">
		<aside id="category">
			<div class="classify">마이페이지</div>
			<a href="<%=request.getContextPath()%>/MyOrderList.do">
				<div class="mycate">
					주문내역조회
					<div class="arrow">></div>
				</div>

			</a> <a href="<%=request.getContextPath()%>/member/mypagePwrechk.jsp">
				<div class="mycate" id="alter">
					내 정보 수정
					<div class="arrow">></div>
				</div>

			</a> <a href="<%=request.getContextPath()%>/member/WrerPwrechk.jsp">
				<div class="mycate" id="last">
					탈퇴하기
					<div class="arrow">></div>
				</div>
			</a>
		</aside>
		<section id="mypage_order">
			<div class="personal">
				<div id="personal_intro">
					<i class="fas fa-user"></i> <span> ${member.mname }님, 안녕하세요!
						회원님의 등급은 GOLD입니다.</span>
				</div>
				<div id="person_btn">
					<div class="person_wrapper">
						<div class="person_wrapper2">
							<a href="#"><i class="fas fa-coins fa-3x fa-border"></i></a>
							<div class="btn_dcp">
								포인트<br> <a href="#">
									<div class="btn_num">0원</div>
								</a>
							</div>
						</div>
					</div>
					<div class="person_wrapper">
						<div class="person_wrapper2">
							<a href="#"><i class="fas fa-ticket-alt fa-3x fa-border"></i></a>
							<div class="btn_dcp">
								쿠폰<br> <a href="#">
									<div class="btn_num">0개</div>
								</a>
							</div>
						</div>
					</div>
					<div class="person_wrapper">
						<div class="person_wrapper2">
							<a href="<%=request.getContextPath() %>/CartList.do"><i class="fas fa-shopping-bag fa-3x fa-border"></i></a>
							<div class="btn_dcp">
								장바구니<br> <a href="<%=request.getContextPath() %>/CartList.do">
									<div class="btn_num">${cartCount }개</div>
								</a>
							</div>
						</div>
					</div>
					<div class="person_wrapper">
						<div class="person_wrapper2">
							<a href="#"><i class="fas fa-truck fa-3x fa-border"></i></a>
							<div class="btn_dcp">
								주문배송<br> <a href="#">
									<div class="btn_num">0개</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="orderwrap">
				<div class="ordertitle">주문내역 / 배송조회</div>
				<c:if test="${not empty myolist }">
				<c:forEach items="${myolist }" var="olist" varStatus="status" > 
					<div class="order">
						<div class="date">
							<span id="orderOno">주문번호 : s${wdate}_${olist.ono }</span>
							<span id="orderDate">주문일자 : ${olist.odate}</span>
						</div>
						<div class="order_contents">
							<a href="#"><img
								src="${olist.bcover }"alt="book" class="book" width="150px;" height="210px;"></a>
							<div class="order_detail">
								<p id="myListTitle">${olist.btitle }</p>
								<div id="myListContent"> ${olist.ototalprice} 원 &nbsp;&nbsp;|&nbsp;&nbsp; 상품 ${olist.oamount }개 <br/>
								<br>
								<p id="myListStatus">${olist.ostatus }</p>
								<p id="myList_sub">구매가 완료되었습니다. 이용해주셔서 감사합니다.</p>
								
								</div>
							</div>
							<div class="order_apli">
								<button type="button" onclick="location.href='#'"
									class="order_btn">배송조회</button>
								<br>
								<button type="button" onclick="location.href='#'"
									class="order_btn">교환신청</button>
								<br>
								<button type="button" onclick="location.href='#'"
									class="order_btn">반품신청</button>
							</div>
						</div>
                    </div>
                    

                    
				</c:forEach>
				</c:if>
			</div>
		</section>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>

</html>