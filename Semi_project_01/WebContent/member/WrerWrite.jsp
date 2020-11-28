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
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap"
	rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>탈퇴하기</title>

<style>
body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	margin: 0 auto;
}

.mypage {
	width: 1080px;
	margin: 0 auto; display : flex;
	margin-top: 60px;
	display: flex;
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
            border: 1px solid #dcdcdc;
            border-bottom: 0px;
            display: table-cell;
            vertical-align: middle;
            padding-left: 20px;
            font-size:14px;
        }

        #last {
            border-bottom: 1px solid #dcdcdc;
        }
        #category a{
        	color: #808080;
        }
        #category .mycate:hover{
		  	background: #fafafa; 
		    background-size: 10px 11px;
		    font-weight: 700;
		    color: #425c5a;
        }

.arrow {
	float: right;
	margin-right: 10px;
}

/*본문*/
#mypage_delete {
	float: right;
	width: 820px;
}

.delete_title {
	font-size: 24px;
	font-weight: bolder;
	padding-bottom: 20px;
}

.delete_box {
	border: 1px solid #dcdcdc;
	padding: 10px;
}

#delete_text {
	font-size: 12pt;
	line-height: 40px;
	    color: #4a4a4a;
}

#wrer {
	width: 780px;
	height: 170px;
	vertical-align: middle;
	border: 1px solid #dcdcdc;
}

.button_wrap {
	text-align: center;
	margin-top: 10px;
}

.delete_btn {
	width: 100px;
	height: 40px;
	padding: 5px;
	line-height: 33px;
    border-radius: 3px;
    margin-top: 10px;
    background-color: #425c5a;
    color: white;
    border: none;
    font-size: 12px;
}
.wrer_res {
	text-align: center;
	font-size: 14px;
	font-weight: bold;
	margin: 20px;
}
</style>
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
            <a href="<%=request.getContextPath()%>/member/myOrderList.jsp">
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
</body>
</html>