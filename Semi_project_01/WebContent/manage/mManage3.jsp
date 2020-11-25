<link rel="stylesheet" type="text/css" href="../css/mManage3.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>회원정보 수정</title>
 <script type="text/javascript">
function endUpdate(){
	var frm = document.mDetailUpdate;
	frm.method="get";
	frm.action="memberUpdate";
	frm.submit();
}
</script>
<c:if test="${not empty memberUpdate }">
	<c:forEach items="${memberUpdate }">
		alert(${memberUpdate });
	</c:forEach>	
</c:if>
</head>
<body>
<%@ include file="../main/header.jsp"%>
	 <div class="mManage">
        <div class="mManage_aside">
            <div id="mManage_asidetlt">관리자페이지</div>
            <div class="mManage_asidenav">
                <ul>
                    <li><a href="memberList">회원정보조회 및 수정</a></li>
                    <li><a href="orderList">주문내역조회</a></li>
                    <li><a href="wreqList">탈퇴요청관리</a></li>
                </ul>
            </div>
        </div>

        <div class="mManage_cont">
            <div class="mManage_cont_title">
                회원정보 조회 및 수정
            </div>
            <div class="mManage_cont_board">
                
                <form name="mDetailUpdate">
                    <table class="mManage_cont_board_tb1">
                        <tbody>
                            <tr>
                                <td class="txt_img" rowspan="11">이미지</th>
                                <th class="txt_title">회원번호</th>
                                <td class="txt_cont"> <input type="text" id="mno" name="mno" value="${param.mno}" readonly></th>
                            </tr>
                            <tr>
                                <th class="txt_title">아이디</th>
                                <td class="txt_cont"><input type="text" id="mid" name="mid" value="${param.mid }" readonly></th>
                            </tr>   
                            <tr>
                                <th class="txt_title">이름</th>
                                <td class="txt_cont"><input type="text" id="mname" name="mname" value="${param.mname }" readonly></th>
                            </tr>
                            <tr>
                                <th class="txt_title">이메일</th>
                                <td class="txt_cont"><input type="email" id="memail" name="memail" value="${param.memail }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">전화번호</th>
                                <td class="txt_cont"><input type="text" id="mphone" name="mphone" value="${param.mphone }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">기본주소</th>
                                <td class="txt_cont"><input type="text" id="m_first_addr" name="m_first_addr" value="${param.m_first_addr }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">상세주소</th>
                                <td class="txt_cont"><input type="text" id="m_second_addr" name="m_second_addr" value="${param.m_second_addr }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">생년월일</th>
                                <td class="txt_cont"><input type="text" id="mbirthday" name="mbirthday" value="${param.mbirthday }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">가입날짜</th>
                                <td class="txt_cont"> <input type="text" id="mdate" name="mdate" value="${param.mdate}" readonly></th>
                            </tr>
                            <tr>
                                <th class="txt_title">권한종류</th>
                                <td class="txt_cont"><input type="text" id="authority" name="authority" value="${param.authority }"></th>
                            </tr>
                            <tr>
                                <th class="txt_title">성별</th>
                                <td class="txt_cont"><input type="text" id="mgender" name="mgender" value="${param.mgender }" readonly></th>
                            </tr>
                            <tr>
                                <td colspan="3">
                                <input type="button" value="등록하기" id="update" onclick="endUpdate()">
                                <input type="button" value="취소" id="reset" onclick="location.href='memberList'">
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