<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mManage2.css"/>
<link href="<%=request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/mManage2.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mManage2.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.0.js"></script>
<title>회원정보조회 상세페이지</title>

<script type="text/javascript">
function startUpdate(){
	var frm = document.mDetailPage;
	frm.method="post";
	frm.action="<%=request.getContextPath()%>/manage/mManage3.jsp"
	frm.submit();
}
</script>
</head>
<body>
<%@ include file="../main/header.jsp"%>
    <div class="mManage">
        <div class="mManage_aside">
            <div class="mManage_asidetlt">회원관리</div>
            <div class="mManage_asidenav">
                <ul>
                    <li><a href="<%=request.getContextPath()%>/memberList">회원정보조회
							및 수정<span class="aside_arrow">></span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/OrderList">주문내역조회<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/wreqList">탈퇴요청관리<span
							class="aside_arrow">></span></a></li>
                </ul>
            </div>
            <div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>
				</a>
			</div>
        </div>

 <div class="mManage_cont">
            <div class="mManage_cont_title">
                회원정보 조회 및 수정
            </div>
            <div class="mManage_cont_board">
                <form name="mDetailPage">
                    <table class="mManage_cont_board_tb1">
                        <tbody>
                        	<tr>
                                <th colspan ="2" class="member_info">"${mdetail.mid }" 회원의 정보입니다.</th>
                            </tr>
                            <tr>
                                
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
                                <input type="button" value="뒤로가기" id="goback" onclick="location.href='<%=request.getContextPath()%>/memberList'">
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