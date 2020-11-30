<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ssak, 나만의 책</title>
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js"
   integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
   crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#quick1 {
   position: absolute;
   top: 200px;
   left: 54%;
   width: 100px;
   z-index: 999;
}

#quick1.fixed {
   position: fixed;
   top: 45px;
}

.recent_book_wrap {
   margin-left: 500px;
   margin-top: 20px;
   padding: 10px 10px 15px 10px;
   text-align: center;
   border: 1px solid #dcdcdc;
}

.recent {
   width: 70px;
   white-space: nowrap;
   text-overflow: ellipsis;
   overflow: hidden;
   line-height: 30px;
   font-size: 12px;
}

.recent_book_wrap legend {
   font-size: 14px;
   text-align: center;
   font-weight: bold;
   color: #425c5a;
   line-height: 20px;
}

.recent_img {
   width: 70px;
   height: 100px;
   padding: 10px 0 5px 0;
}

#recent_empty {
   width: 70px;
   font-size: 12px;
   line-height: 20px;
   padding: 20px;
   font-size: 12px;
}
</style>
<script>
   $(document).ready(function() {
      var Mnav = $("#quick1").offset().top;
      $(window).scroll(function() {
         var window = $(this).scrollTop();
         if (Mnav <= window) {
            $("#quick1").addClass("fixed");
         } else {
            $("#quick1").removeClass("fixed");
         }
      });
   });
</script>
</head>
<body>
   <div id="quick1">
      <fieldset class="recent_book_wrap">
         <legend>최근 본 상품</legend>
         <c:if test="${not empty RecentBook1}">
            <a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook1.BISBN}">
               <img src="${RecentBook1.bcover}" alt="book" class="recent_img">
            </a>
            <p class="recent">
               <a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook1.BISBN}"
                  class="recent_title">${RecentBook1.btitle}</a>
            </p>
         </c:if>
         <c:if test="${not empty RecentBook2}">
            <a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook2.BISBN}">
               <img src="${RecentBook2.bcover}" alt="book" class="recent_img">
            </a>
            <p class="recent">
               <a href="<%=request.getContextPath() %>/bookDetail.do?bisbn=${RecentBook2.BISBN}"
                  class="recent_title"> ${RecentBook2.btitle}</a>
            </p>
         </c:if>

         <c:if test="${empty RecentBook1}">
            <p id="recent_empty">최근 본 상품이 없습니다.</p>
         </c:if>
      </fieldset>
   </div>
</body>
</html>