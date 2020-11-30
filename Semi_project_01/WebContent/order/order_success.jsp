    <link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-3.4.0.js"></script>
	<title>ssak, 나만의 책</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

        body {
            width: 100%;
            position: relative;
            font-size: 13px;
        }
        section {
            width: 1080px;
            margin: 0 auto;
            position: relative;
        }

        #alert {
            text-align: center;
            padding: 20px;
            margin: 50px auto;
            border: 1px solid #425c5a;
            border-radius: 10px;
            width: 200px;
        }
        .alert_message{
            padding: 20px;
        }

        button {
            color:white;
            background-color: #425c5a;
            width:200px;
            height: 30px;
            margin: 0 auto;
            border-radius: 5px;
			border: none;
        }
    </style>
	<script>
	$(function(){				
		//주문완료
		$('#ok').click(function(){
			location.href = "<%=request.getContextPath()%>/ssakMain.do"							
		});
	});
    </script>
</head>
<body>
    <section>
        <div id="alert">
            <div class="alert_message">결제가 완료되었습니다.</div>
            <button type="button" id="ok">OK</button>
        </div>
    </section>
</body>
</html>