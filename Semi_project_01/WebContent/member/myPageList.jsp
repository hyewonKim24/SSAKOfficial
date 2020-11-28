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
    <title>Document</title>

    <style>
        body {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12pt;
	margin: 0 auto;
}
        .mypage {
            width: 1080px;
            display: flex;
            padding-top:60px;
            margin:0 auto;
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
        #alter_text {
            font-size: 24px;
            font-weight: bolder;
            margin-bottom: 20px;
        }
        #updatetable table{
            padding:10px;
            width:100%;
            font-size:12pt;
            border-top:2px solid #425c5a;
        }
        #updatetable td{
            padding: 10px 0;
    border-top: 0;
    font-size: 14px;
    vertical-align: top;
        }
        #updatetable th{
           padding: 20px 0 0 20px;
    font-weight: 700;
    font-size: 14px;
    color: #333;
    line-height: 20px;b
    vertical-align: top;
    text-align: left;
        }
        input{
               width: 332px;
               height: 44px;
    padding: 0 14px;
    border: 1px solid #ccc;
    font-size: 14px;
    color: #333;
    line-height: 20px;
    border-radius: 3px;
    background: #fff;
    outline: none;
    vertical-align: top;
        }
        .btndesign{
        	width: 120px;
    height: 44px;
    padding: 4px;
    background-color: white;
    border: 1.5px solid #425c5a;
    border-radius: 3px;
    color: #425c5a;
    font-weight: bold;

}
        #updateSave{
            text-align: center;
            width:230px;
            height:40px;
            background-color: #425c5a;
            border-radius:5px;
            color:white;
            border:0;
        }
        #btnlast{
            text-align: center;
        }
        
        .myPage_res{
			text-align:left;
			font-size:14px;
			font-weight:bold;
			margin-bottom:20px;
			margin-top:20px;
			
		}

    </style>
    <script>
	function goMylistUpdate(){
		var frm=document.updateform;
			frm.action="<%=request.getContextPath()%>/myPageUpdate.do";
			frm.method = "post";
			frm.submit();
	}
</script>
</head>
<body>

	<c:if test="${not empty pw_error}">
		<script>
		alert('${pw_error}');
		</script>
	</c:if>
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
        <section id="mypage_alter">
        
            <div id="alter_text">
              		  내 정보 수정
            </div>
            	<div class="myPage_res">
        	
        		</div>
            
            <form name="updateform" id="updatetable">
                <table>
                    <tr>
                        <th>사용자 ID</th>
                        <td>${member.mid}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${member.mname}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${member.memail}</td>
                    </tr>
                    <tr>
                        <th>비밀번호 변경</th>
                        <td>
                            <input type="password" name="mpw" placeholder="현재 비밀번호">
                            </td>
                     </tr>
                    <tr>
                        <th>새 비밀번호</th>
                        <td>
                           <input type="password" name="newpw" id="newpw" placeholder="새 비밀번호">
                           <button type="button" id="pw_reqx" class="btndesign">확인</button>
                            </td>
                     </tr>
                    <tr>
                        <th>새 비밀번호 확인</th>
                        <td>
                            <input type="password" name="newpwre" id="newpwre" placeholder="새 비밀번호 확인">
                            </td>
                     </tr>
                     
                    
                    
                 <script type="text/javascript">
                 
						$("#pw_reqx").on("click", function() {
							var a = $("#newpw").val();
							var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
							if (!regex.exec(a)) {
								alert('비밀번호 형식이 맞지않습니다.');
								return;
							} else{
								alert('비밀번호 형식이 올바릅니다.')
							}
							});

						$("#newpwre").focusout(function() {
							var pw1 = $("#newpw").val();
							var pw2 = $("#newpwre").val();
							if (pw1 != "" && pw2 != "") {
								{
									if (pw1 != pw2) {
										alert('비밀번호 동일하게 입력해주세요');
										$("#newpw").focus();
										$("#newpw").val('');
										$("#newpwre").val('');
										return false;
									}
								}
							}
						});
					</script>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="text" name="mphone" value="${member.mphone}">
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" name="mzip_code" class="address" placeholder="우편번호" value="${member.mzip_code}">
                            <button type="button" class="btndesign" >주소검색</button><br>
                            <input type="text" style="border-top:0;" name="m_first_addr" class="address" placeholder="기본주소" value="${member.m_first_addr}"><br>
                            <input type="text" style="border-top:0;" name="m_second_addr" class="address" placeholder="상세주소" value="${member.m_second_addr}">
                        </td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td>
                            <input type="text" name="mbirthday" placeholder="YYYY/MM/DD" value="${member.mbirthday}">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" id="btnlast">
                            <button type="button" id="updateSave" onclick="goMylistUpdate();">저장</button>
                        </td>
                    </tr>
                </table>
            </form>
        </section>
    </div>
</body>

</html>