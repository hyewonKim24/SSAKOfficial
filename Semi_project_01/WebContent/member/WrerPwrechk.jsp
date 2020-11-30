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
    <link href="../css/reset.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <title>탈퇴하기</title>

    <style>
    
    body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	margin: 0 auto;
}
        .mypage {
        	margin: 0 auto;
            width: 1080px;
            display: flex;
            padding-top:60px;
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
            padding-bottom:20px;
            /* margin: 20px auto; */
            font-size:30px;
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
        #alter{
            font-weight: bold;
        }

        /*본문*/
        #mypage_alter {
            float: right;
            width: 820px;
        }

        .alter_box {
            padding: 30px;
            width: 500px;
            margin: 0 auto;
        }

        #alter_text {
            font-size: 15pt;
            font-weight: bolder;
        }

        #alter_text2 {
              font-size: 10pt;
            margin: 10px 0 25px 0 ;

        }
        #login{
            display:flex;
            justify-content: center;
        }

         #mid {
            width: 340px;
    height: 54px;
    padding: 0 19px;
    border: 1px solid #ccc;
    border-radius: 3px;
    background-color: #fff;
    font-size: 14px;
    line-height: 20px;
    outline: none;
    margin-top: 10px;
}
.form_btn1 {
	width: 340px;
	line-height: 54px;
	border-radius: 3px;
	margin-top: 10px;
	background-color: #425c5a;
	color: white;
	border: none;
}



        #mpw {
            border: none;
            height: 25px;
            width: 250px;
            margin: auto 0;
        }
        .button_wrap{
        	margin-left:100px;
        }

        .alter_btn {
            width: 100px;
            height: 47px;
            padding: 5px;
            background-color: #6946A7;
            color:white;
            border: gray solid 1px;
            border-radius: 8px;
            cursor: pointer;
        }
           .pw_re_res{
			text-align:center;
			font-size:14px;
			font-weight:bold;
			margin-bottom:20px;
			
		}
    </style>
    <script>
    function goPwchk(){
    	var frm=document.pwrechk_frm;
		frm.action="<%=request.getContextPath()%>/Pwrechk_wrer.do";
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
                <div class="mycate">내 정보 수정
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
</body>

</html>