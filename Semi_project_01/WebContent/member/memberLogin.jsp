<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="../css/reset.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
    <title>로그인</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 12pt;
            margin: 0 auto;
        }

        #form_title {
            line-height: 60px;
            font-weight: bold;
        }

        .font_large {
            font-size: 30px;
            font-weight: bolder;
            text-align: center;
        }
        .form_wrap {
        	padding-top:60px;
            width: 1080px;
            display: block;
            margin: 0 auto;
        }

		.register_res{
			text-align: center;
			font-size:14px;
			font-weight:bold;
			margin:20px;
			
		}
		.input_login_wrap{
			
			height: 60px;
		}
        .input_login {
            float: right;
            width: 300px;
            height: 56px;
            vertical-align: middle;
            column-span: 2;
            border: none;
        }
        .login_font_size{
            font-size:11pt;
            line-height: 30px;
        }
        
        .form_login_btn{
            text-align: center;
        }
        .form_btn1 {
            width: 340px;
            line-height: 50px;
            margin-top:10px;
            background-color: #6946A7;
            color: white;
            border: none;
            border-radius: 5%;
        }
        .form_btn2 {
            width: 340px;
            line-height: 50px;
            margin-top:10px;
            background-color: white;
            color: #6946A7;
            border: 1px solid #6946A7;
            border-radius: 5%;
        }
        #login_tbl {
            margin: 0 auto;
            line-height: 30px;
            height: 40px;
            vertical-align: middle;
        }
        #login_tbl th{
            height: 60px;
        }
        #login_tbl td{
        	height:60px;
            vertical-align: middle;
        }

        #login_tbl a{
            color:black;
            text-decoration: none;
        }

        #login_search{
            float: right;
        }
        
        .login_input_border{
            width: 300px;
            border:1px solid black;
        }

        .login_icon{
            padding:10px;
        }
        .container{
            padding-top:40px;
        }
 </style>
 <script>
 function goLogin(){
		var frm=document.login_frm;
			frm.action="<%=request.getContextPath()%>/memberLogin.do";
			frm.method = "post";
			frm.submit();
		}
 </script>
</head>
<body>

    <form name="login_frm" class="form_wrap">
        <div class="register_res">
			<c:if test="${not empty login_error}">
				${login_error }
			</c:if>
        	<c:if test="${not empty register_ok}">
				${register_ok}
			</c:if>
			
        	</div>
        	
        <table id="login_tbl">
            <tr> 
                <td colspan="5"> 
                    <p class="font_large" id="form_title">로그인</p>
                </td>
            </tr>
            <tr class="login_input_border"> 
                <td colspan="5" class="input_login_wrap"> 
                <svg width="30px" height="30px" class="login_icon" viewBox="0 0 16 16 " class="bi bi-person-circle" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path d="M13.468 12.37C12.758 11.226 11.195 10 8 10s-4.757 1.225-5.468 2.37A6.987 6.987 0 0 0 8 15a6.987 6.987 0 0 0 5.468-2.63z"/>
                    <path fill-rule="evenodd" d="M8 9a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                    <path fill-rule="evenodd" d="M8 1a7 7 0 1 0 0 14A7 7 0 0 0 8 1zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z"/>
                  </svg></span>
                    <input type="text" id="mid" class="input_login" name="mid" placeholder="아이디를 입력해주세요">
                </td>

            </tr>
            <tr class="login_input_border">
                <td colspan="5">
               <svg width="30px" height="30px" viewBox="0 0 16 16" class="bi bi-key-fill login_icon" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
                  </svg>
                    <input type="password" id="mpw" class="input_login" name="mpw" placeholder="비밀번호를 입력해주세요">
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <input type="checkbox" id="login_keep" name="login_keep" width="20px">
                    <label for="login_keep" class="login_font_size">로그인 상태 유지</label></td>
                <td colspan="2"><p id="login_search"><a href="./memberIdSearch.jsp" class="login_font_size">아이디 찾기</a>&nbsp; | &nbsp;
                <a href="./memberPwSearch.jsp" class="login_font_size">비밀번호 찾기</a></p></td>
            </tr>
            <tr>
                <td colspan="5" class="form_login_btn"><button class="form_btn1" onclick="goLogin();">로그인</button></td>
            </tr>
            <tr>
                <td colspan="5" class="form_login_btn"><button type="button" class="form_btn2" onclick="location.href='./memberRegister.jsp'">회원가입</button></td>
            </tr>
            
        </table>     
    </form>

</body>
</html>