<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
	crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#quick {
	position: absolute;
	top: 300px;
	left: 50%;
	width: 150px;
	z-index: -1;
}

#quick.fixed {
	position: fixed;
	top: 100px;
}

.recent_book_wrap {
	position: absolute;
	left: 50%;
	width: 150px;
	text-align: center;
	border: 1px solid black;
	margin-left: 570px;
	padding: 5px;
	margin-left: 570px;
	padding: 10px;
	padding-bottom: 20px;
	text-align: center;
	border: 1px solid #dcdcdc;
}

#recent_title {
	font-size: 12px;
	line-height: 16px;
	width: 120px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	line-height: 30px;
}

.recent_book_wrap legend {
	text-align: center;
	font-weight: bold;
	color: #425c5a;
	line-height: 20px;
}

.recent_img {
	width: 70px;
	padding: 10px 0 5px 0;
}

#recent_empty {
	width: 70px;
	font-size: 12px;
	line-height: 20px;
	padding: 20px;
	font-size: 12px;
}

#quick {
	position: absolute;
	top: 210px;
	left: 50%;
	width: 70px;
}
</style>
<script>
$(window).scroll(function(){
    var position = $(document).scrollTop();
    if($(this).scrollTop() > 210 ){
      $("#quick").css('position','fixed');
    }else{
      $("#quick").css('position','relative');
    });
$(document).ready(function() {
    var Mnav = $("#quick").offset().top ;
	$(window).scroll(function() {
		var window = $(this).scrollTop();
		if (Mnav < window ) {
			$("#quick").addClass("fixed");
		} else {
			$("#quick").removeClass("fixed");
		}
	});
});
</script>
</head>
<body>
	<div id="quick">
		<fieldset class="recent_book_wrap">
			<legend>최근 본 상품</legend>
			<c:if test="${not empty RecentBook1}">
				<a
					href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook1.BISBN}">
					<img src="${RecentBook1.bcover}" alt="book" class="recent_img">
				</a>
				<p id="recent_title" class="recent">
					<a
						href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook1.BISBN}">${RecentBook1.btitle}</a>
				</p>
			</c:if>
			<c:if test="${not empty RecentBook2}">
				<a
					href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook2.BISBN}">
					<img src="${RecentBook2.bcover}" alt="book" class="recent_img">
				</a>
				<p id="recent_title">
					<a
						href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook2.BISBN}">
						${RecentBook2.btitle}</a>
				</p>
			</c:if>

			<c:if test="${empty RecentBook1}">
				<p id="recent_empty">최근 본 상품이 없습니다.</p>
			</c:if>
		</fieldset>
	</div>
</body>
</html>