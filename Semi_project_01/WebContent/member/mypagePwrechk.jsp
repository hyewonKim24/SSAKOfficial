<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/pwRechk.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/22634e2e1a.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>ssak, 나만의 책</title>

    <script>
    function goPwchk(){
    	var frm=document.pwrechk_frm;
		frm.action="<%=request.getContextPath()%>/Pwrechk.do";
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
        <section id="mypage_alter">
         <div class="pw_re_res">
        		${pw_re_error}
        	</div>
            <div class="alter_box">
                <div id="alter_text">
                    		비밀번호 재확인
                </div>
                <div id="alter_text2">
                    	개인정보 보호를 위해 비밀번호를 다시 확인 합니다.
                </div>
                <hr style=" width:340px; color:#425c5a;">
                <div id="login">
                    <form name="pwrechk_frm">
                    <tr>
				<td colspan="5" class="input_login_wrap"><input type="text"
					name="mid" id="mid"  size="20" tabindex="1"
					placeholder="아이디를 입력해주세요"></td>

					</tr>
                    <tr>
				<td colspan="5" class="input_login_wrap"><input type="password"
					name="mpw" id="mid"  size="20" tabindex="1"
					placeholder="비밀번호를 입력해주세요"></td>

					</tr>
                    
                        <tr>
				<td colspan="5" class="form_login_btn"><button
						class="form_btn1" onclick="goPwchk();">확인</button></td>
				</tr>
                        
                    </form>
                </div>
            </div>
        </section>
    </div>
    <%@include file="../main/footer.jsp"%>
</body>

</html>