<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/pwRechk.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../main/header.jsp"%>
<!DOCTYPE html>

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
<title>탈퇴하기</title>
<script>
    function goWrer(){
    	var frm=document.wrer_frm;
		frm.action="<%=request.getContextPath()%>/wrerInsert.do";
		frm.method = "post";
		frm.submit();
    }
    </script>
</head>
<body>
	<div class="mypage">
		<aside id="category">
			<div class="classify">마이페이지</div>
            <a href="<%=request.getContextPath()%>/MyOrderList.do">
                <div class="mycate">주문내역조회
                    <div class="arrow">></div>
                </div>

            </a>
            <a href="<%=request.getContextPath()%>/member/mypagePwrechk.jsp">
                <div class="mycate" id="alter">내 정보 수정
                    <div class="arrow">></div>
                </div>

            </a>
            <a href="<%=request.getContextPath()%>/member/WrerPwrechk.jsp">
                <div class="mycate" id="last">탈퇴하기
                    <div class="arrow">></div>
                </div>
            </a>
		</aside>
		<section id="mypage_delete">
					<div class="wrer_res">
						<c:if test="${not empty wrer_error}">
							<script>
								alert('${wrer_error}');
							</script>
						</c:if>
					</div>
			<div class="delete_title">탈퇴하기</div>
			<div class="delete_box">
				<form name="wrer_frm">
					<p id="delete_text">탈퇴 사유를 입력해주세요.</p>
					<input type="text" id="wrer" name="wrer" placeholder="내용을 입력해주세요"></input>
					<div class="button_wrap">
						<button type="button" class="delete_btn" onclick="goWrer();">탈퇴하기</button>
						<input type="reset" class="delete_btn" value="취소">
					</div>
				</form>
			</div>
		</section>
	</div>
	<%@include file="../main/footer.jsp"%>
</body>
</html>