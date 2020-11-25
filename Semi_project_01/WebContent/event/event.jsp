 <link href="reset.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event</title>
<script src="http://code.jquery.com/jquery-3.4.0.js"></script>
    <style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

body {
	width: 100%;
	position: relative;
	font-size: 13px;
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

#event_title {
	text-align: center;
	border-bottom: 2px solid gray;
	margin: 30px 0;
}

#event_title>h2 {
	margin: 20px 0;
}

#comment_form>#text_area {
	width: 100%;
	height: 100px;
	margin-top: 20px;
	padding: 0;
	border: 1px solid gray;
	box-sizing: border-box;
}

#comment_form>#text_bottom {
	width: 100%;
	height: 35px;
	display: flex;
	flex-direction: row;
}

#comment_form>#text_bottom>.comment_desc {
	width: 80%;
	height: 100%;
	text-align: right;
	line-height: 35px;
	margin: 0 auto;
	padding-right: 20px;
	border: 1px solid gray;
	box-sizing: border-box;
	border-top: 0;
	border-right: 0;
	font-size: 11px;
}

#comment_form>#text_bottom>.comment_submit {
	width: 20%;
	height: 100%;
	line-height: 35px;
	border: 1px solid gray;
	border-top: 0;
	padding: 0;
	box-sizing: border-box;
}

#event_comment {
	width: 100%;
	position: relative;
	top: 30px;
	display: flex;
	flex-direction: column;
	list-style: none;
	padding: 0;
}

.comment_list {
	width: 100%;
	padding: 15px 0;
	border-bottom: 1px solid gray;
}

ul>li>.edit {
	position: absolute;
	right: 10px;
	font-size: 13px;
}

ul>li>.comment_id {
	font-weight: bold;
	margin: 0 10px;
}

ul>li>.comment_reg_date {
	font-size: 13px;
	color: gray;
}

ul>li>.comment_text {
	margin: 20px 10px;
}

.pagediv {
	margin: 60px 0 0;
	margin-bottom: 30px;
	text-align: center;
}
</style>
    

</head>

<body>
    <section>
        <div id="event_title">
            <h2>이벤트</h2>
        </div>
        <article>
            <img src="./img/event_ridi.jpg" id="event_img" width="100%">
        </article>
        <article>
            <form id="comment_form" method="post" action="EventWrite">
            	<c:choose>
	            	<c:when test="${not empty sessionScope.mid }">
	                <input type="text" id="text_area" name="econtent" value="${econtent}" placeholder="댓글을 입력해 주세요">
	                </c:when>
	                <c:otherwise>
	                <input type="text" id="text_area" name="econtent" value="${econtent}" placeholder="로그인 후 입력해주세요">
	                </c:otherwise>
	            </c:choose>
                <div id="text_bottom">
                    <span class="comment_desc"></span>
                    <button type="submit" class="comment_submit" value="등록" >등록</button>
                    
                    <!-- 
                    로그인 되어있지 않다면
                    if(mid==null){
                    PrinteWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('로그인을 하세요.')");
                    script.println("location.href='logion.jsp'");
                    script.println("</script>");
                     -->
                </div>
            </form>
		
			<form name="replylist">
            <ul id="event_comment">
         	<c:if test="${not empty list}">
     		<c:forEach var="n" items="${list}"> 		
                <li class="comment_list">
                	<input type="hidden" name="eno" value="${n.eno}">
                	<input type="hidden" name="mid" value="${n.mid}">
                	<input type="hidden" name="econtent" value="${n.econtent}">
                	<span class="comment_id">${n.mid}</span>
                    <span class="comment_reg_date">${n.edate}</span>
                    <c:if test="${n.mid==sessionScope.mid}">
                    <span class="edit">
                   		<a href="EventList_up?eno=${n.eno}&mid=${n.eno}&econtent=${n.econtent}">수정</a>&nbsp&nbsp| &nbsp&nbsp
                        <a href="EventDelete?eno=${n.eno}">삭제</a>
                    </span>
					</c:if>
                   <p class="comment_text">${n.econtent}</p> 
                </li>
           </c:forEach>
            </c:if>
            </ul>
            </form>
		
		
<!--  		<div>
	
		<c:set var="page" value="${(empty param.p)?1:param.p}"/>
		<c:set var="startNum" value="${page-(page-1)%5}"/>
		<c:set var="lastNum" value="23"/>
		
			<c:if test="${startNum>1}">
				<a href="?p=${startNum-1}" class="btn btn-next">이전</span>
			</c:if>
			<c:if test="${startNum<=1}">
				<span class="btn btn-prev" onclick="alert('이전 페이지가 없습니다.');">이전</span>
			</c:if>
		</div>
		
		<ul class="-list- center">
			<c:forEach var="i" begin="0" end="4">
			<li><a class="-text- ${(page==(startNum+i))?'orange':''} bold" href="?p=${startNum+i}">${startNum+i}</a></li>
			</c:forEach>
		</ul>
		
		<div>
			<c:if test="${startNum+5<lastNum}">
				<a href="?p=${startNum+5}" class="btn btn-next">다음</span>
			</c:if>
			<c:if test="${startNum+5>=lastNum}">
			<span class="btn btn-next" onclick="alert('다음 페이지가 없습니다.');">다음</span>
			</c:if>
		</div>
-->			
		
			<!--페이징 아래 숫자-->
			<div class="pagediv">
				<c:if test="${startPage != 1}">
					<a href="EventList?pageNum=${prev}">이전</a>
				</c:if>
				<c:if test="${startPage != endPage}">
					<c:forEach varStatus="s" begin="${startPage}" end="${endPage}"
						step="1">

						<a href="EventList?pageNum=${s.current}">${s.current}</a>
						<!--변경 : href 경로 -->
					</c:forEach>
				</c:if>
				<c:if test="${endPage < pageCount}">
					<a href="EventList?pageNum=${next}">다음</a>
				</c:if>
			</div>
        </article>
    </section>
</body>
</html>