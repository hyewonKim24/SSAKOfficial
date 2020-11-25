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
   
    <title>아이디 찾기</title>
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 12pt;
            margin: 0 auto;
        }

        .form_title {
            line-height: 70px;
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

      
        
        .form_login_btn{
            text-align: center;
        }
        .id_search_title{
            padding-top:10px;
            padding-bottom: 10px;
            font-size: 18px;
            color: #6946A7;
            text-align: center;
            font-weight: bold;
        }
        #id_search_view{
            font-size:14px;
            color:gray;
            text-align: center;
        }
        .form_btn1 {
            width: 360px;
            margin-top:10px;
            line-height: 40px;
            background-color: #6946A7;
            color: white;
            border: none;
            border-radius: 5%;
        }
        #id_search_end_tbl {
            margin: 0 auto;
            line-height: 30px;
            height: 40px;
            vertical-align: middle;
        }
        #id_search_end_tbl td{

            vertical-align: middle;
        }
        
 </style>
</head>
<body>

    <form class="form_wrap">
        <table id="id_search_end_tbl">
               
            <tr> 
                <td > 
                    <p class="font_large form_title">아이디 찾기</p>
                </td>
            </tr>
            <tr>
                <td  class="id_search_title">
                    <svg width="50px" height="50px" viewBox="0 0 16 16" class="bi bi-file-person-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M12 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm-1 7a3 3 0 1 1-6 0 3 3 0 0 1 6 0zm-3 4c2.623 0 4.146.826 5 1.755V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1v-1.245C3.854 11.825 5.377 11 8 11z"/>
                      </svg>
                </td>
            </tr>
            <tr>
                <td class="id_search_title">
                    고객님께서 입력하신 정보가<br>
                    정확한지 확인 후 다시 시도해주세요
                </td>
            </tr>
        
            
            <tr>
                <td class="form_login_btn"><input type="button" class="form_btn1" onclick="location.href='./memberIdSearch.jsp'" value="아이디 다시 찾기"></td>
            </tr>
           
            
        </table>     
    </form>

</body>
</html>