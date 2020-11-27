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
.recent_book_wrap {
	position: absolute;
	left: 50%;
	width: 150px;
	text-align: center;
	border: 1px solid black;
	margin-left: 570px;
	padding: 5px;
}

#recent_title {
	width: 140px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
	line-height: 30px;
}

.recent_book_wrap legend {
	text-align: center;
	font-weight: bold;
	line-height: 20px;
}

.recent_img {
	width: 100px;
	height: 150px;
	padding: 3px;
}

#recent_empty {
	font-size: 12px;
	line-height: 30px;
}
#quick{
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
    }
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
				<p id="recent_title">
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