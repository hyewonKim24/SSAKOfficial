<link rel="stylesheet" type="text/css" href="../css/mManage2.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ include file="../main/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="./css/mManage2.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<title>회원정보조회_상세페이지</title>
 <style>
 /* 기본셋팅 */
     	*{
         margin : 0;
        }
        body{
            width : 100%;
            position: relative;
        }
        table, td {
            border-collapse: collapse;
        }
 /* 회원관리 */
        .mManage {
            position: relative;
            width: 1080px;
            height: 500px;
            margin: 0 auto;
            padding-top: 60px;
        }
        /* 회원관리 aside*/
        .mManage_aside{   
            position: absolute;
            width: 200px;
            height: auto;
            float: left;
            margin-right: 60px;
        }
        #mManage_asidetlt{
        	font-size : 30px;
            padding-bottom: 20px;
        }      
          /* reset 안먹어서 임의로 적음 */
        .mManage_asidenav ul{
        	padding : 0;
        }
        .mManage_asidenav ul li {
            height: 50px;
            padding-left: 20px;
            border: solid 1px;
            box-sizing: border-box;
            /* reset 안먹어서 임의로 적음 */
            list-style : none;
        }
        .mManage_asidenav ul li a {
            line-height: 50px;
            text-decoration: none;
        }
        /* 회원관리 content*/
        .mManage_cont {
            position: absolute;
            left: 260px;
            width: 820px;
        }
        /* 회원관리 content title*/
        .mManage_cont_title {
            width: 100%;
            font-size: 24px;
            padding-bottom: 20px;
        }
        /* 회원관리 content board*/
        .mManage_cont_board{
            width: 100%;
            height: 400px;
            background-color: white;
            border: solid 1px;
            box-sizing: border-box;
        }
        .mManage_cont_board form {
            padding-top: 25px;
        }
        .mManage_cont_board table {
            width: 720px;
            height: 330px;
            margin: 0 auto;
            background-color: white;
            font-size: 12px;
        }
        .txt_img{
            border: solid 1px;
            box-sizing: border-box;
            width: 200px;
            text-align: center;
        }
        .txt_title{
            border: solid 1px;
            box-sizing: border-box;
            width: 100px;
            text-align: center;
        }
        .txt_cont{
            border: solid 1px;
            box-sizing: border-box;
            width: 400px;
            text-align: left;
            padding-left: 20px;
        }
        table th{
            height: 27px;
            line-height: 27px;
            background-color: rgb(212, 212, 212);
            font-weight: bold;
        }
        table tr:last-child td{
            padding-top: 10px;
            text-align: center;
        }
    </style>
<script type="text/javascript">
function startUpdate(){
	var frm = document.mDetailPage;
	frm.method="post";
	frm.action="mManage3.jsp"
	frm.submit();
}
</script>
</head>
<body>

    <div class="mManage">
        <div class="mManage_aside">
            <div id="mManage_asidetlt">관리자페이지</div>
            <div class="mManage_asidenav">
                <ul>
                    <li><a href="./memberList">회원정보조회 및 수정</a></li>
                    <li><a href="./orderList">주문내역조회</a></li>
                    <li><a href="./wreqList">탈퇴요청관리</a></li>
                </ul>
            </div>
        </div>

 <div class="mManage_cont">
            <div class="mManage_cont_title">
                회원정보 조회 및 수정
            </div>
            <div class="mManage_cont_board">
                <form name="mDetailPage">
                <%-- <input type="hidden" value="${mdetail.mid }"> --%>
                    <table class="mManage_cont_board_tb1">
                        <tbody>
                            <tr>
                                <td class="txt_img" rowspan="11">이미지</td>
                                <th class="txt_title">회원번호</th>
                                <td class="txt_cont"><input type="text" id="mno" name="mno" value="${mdetail.mno }" readonly></td>
                            </tr>
                            <tr>
                               <th class="txt_title">아이디</th>
                                <td class="txt_cont"><input type="text" id="mid" name="mid" value="${mdetail.mid }" readonly></td>
                            </tr>   
                            <tr>
                                <th class="txt_title">이름</th>
                                <td class="txt_cont"><input type="text" id="mname" name="mname" value="${mdetail.mname }" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">이메일</th>
                                <td class="txt_cont"><input type="text" id="memail" name="memail" value="${mdetail.memail }" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">전화번호</th>
                                <td class="txt_cont"><input type="text" id="mphone" name="mphone" value="${mdetail.mphone }" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">기본주소</th>
                                <td class="txt_cont"><input type="text" id="m_first_addr" name="m_first_addr" value="${mdetail.m_first_addr }" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">상세주소</th>
                                <td class="txt_cont"><input type="text" id="m_second_addr" name="m_second_addr" value="${mdetail.m_second_addr }" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">생년월일</th>
                                <td class="txt_cont"><input type="text" id="mbirthday" name="mbirthday" value="${mdetail.mbirthday}" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">가입날짜</th>
                                <td class="txt_cont"><input type="text" id="mdate" name="mdate" value="${mdetail.mdate}" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">권한종류</th>
                                <td class="txt_cont"><input type="text" id="authority" name="authority" value="${mdetail.authority}" readonly></td>
                            </tr>
                            <tr>
                                <th class="txt_title">성별</th>
                                <td class="txt_cont"><input type="text" id="mgender" name="mgender" value="${mdetail.mgender}" readonly></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                <input type="button" value="수정하기" id="edit" onclick="startUpdate()">
                                <!-- onclick="location.href='mManage3.jsp'" -->
                                <input type="button" value="뒤로가기" id="goback" onclick="location.href='memberList'">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</body>
</html>