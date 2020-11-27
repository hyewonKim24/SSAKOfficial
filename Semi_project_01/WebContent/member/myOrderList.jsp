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
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<script src="https://kit.fontawesome.com/22634e2e1a.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>주문내역 리스트</title>
<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	margin: 0 auto;
}

.mypage {
	width: 1080px;
	display: flex;
	padding-top: 60px;
	margin: 0 auto;
}

a {
	text-decoration: none;
	color: black;
}

/*카테고리*/
#category {
	float: left;
	width: 200px;
	height: 600px;
	margin-right: 60px;
}

.classify {
	font-weight: bold;
	width: 1080px;
	padding-bottom: 20px;
	font-size: 30px;
}

.mycate {
	width: 200px;
	height: 50px;
	font-size: 14px;
	border: 1px solid black;
	border-bottom: 0px;
	display: table-cell;
	vertical-align: middle;
	padding-left: 10px;
}

#last {
	border-bottom: 1px solid black;
}

.arrow {
	float: right;
	margin-right: 10px;
}

#mypage_order {
	float: right;
	width: 820px;
}

/*개인정보창*/
.personal {
	border: 1px solid black;
	margin-bottom: 35px;
}

#personal_intro {
	margin: 15px;
}

#person_btn {
	display: flex;
	justify-content: space-around;
	margin: 35px;
}

.person_wrapper2 {
	display: flex;
}

.btn_dcp {
	font-size: 10pt;
	margin: auto 15px;
}

.btn_num {
	font-size: 13pt;
}

/*주문내역*/
.ordertitle {
	font-size: 24px;
	padding-bottom: 20px;
}

.order {
	border: 1px solid gray;
}

.date {
	padding: 10px;
	background-color: lightgray;
	font-size: 12pt;
}

.book {
	width: 130px;
	padding: 10px 15px;
}

.order_contents {
	display: flex;
	position: relative;
}

.order_detail {
	margin: auto 0;
	width: 500px;
	font-size: 12pt;
}

.order_apli {
	float: right;
	position: absolute;
	right: 0;
	top: 50%;
	transform: translateY(-50%);
	margin-right: 15px;
}

.order_btn {
	width: 130px;
	height: 50px;
	margin: 5px;
	background-color: white;
	border: gray solid 1px;
	border-radius: 8px;
	cursor: pointer;
}

#mylist {
	font-weight: bold;
}
</style>

</head>

<body>
	<div class="mypage">
		<aside id="category">
			<div class="classify">마이페이지</div>
			<a href="<%=request.getContextPath()%>/member/myOrderList.jsp">
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
							<a href="#"><i class="fas fa-shopping-bag fa-3x fa-border"></i></a>
							<div class="btn_dcp">
								장바구니<br> <a href="#">
									<div class="btn_num">0개</div>
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
					<c:set var="str" value="${myolist[status.index + 1].ono}"/>
					<c:if test="str==${o.ono }">
						
						
					</c:if>
					<div class="order">
						<div class="date">주문일자 : ${olist.odate}</div>
						<div class="order_contents">
							<a href="#"><img
								src="${olist.bcover }"
								alt="book" class="book"></a>
							<div class="order_detail">
								<a href="#">
								</a> <a href="#""><p>주문번호 : ${olist.ono }</p></a>
									<p>상품명 : ${olist.btitle }</p>
								<p>총 가격 : ${olist.ototalprice}</p>
								<p>총 책수량 : ${olist.oamount }</p>
								<p>주문 상태 : ${olist.ostatus }</p>
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
</body>

</html>