<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/wManage2.css"/>
<link href="<%=request.getContextPath()%>/css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>ssak, 나만의 책</title>
 <script type="text/javascript">
$(function(){
	$("#edit").on("click",function(){
		var a = "${wdetail.mid }";
		$.ajax({
			url : "wreqAccept.do", 
			type : "GET",
			data :{mid : a},
			datatype : "json",
			success : function(res1){
					alert(res1);
					location.href="wreqList.do";
				
			},
			error : function(res2){
				alert("실패");
			} 
		});
		
	});
});
</script>
</head>
<body>
<%@ include file="../main/header.jsp"%>
     <div class="wManage">
        <div class="wManage_aside">
            <div id="wManage_asidetlt">회원관리</div>
            <div class="wManage_asidenav">
                <ul>
                      <li><a href="<%=request.getContextPath()%>/memberList.do">회원정보조회
							및 수정<span class="aside_arrow">></span>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/OrderList.do">주문내역조회<span
							class="aside_arrow">></span></a></li>
					<li><a href="<%=request.getContextPath()%>/wreqList.do">탈퇴요청관리<span
							class="aside_arrow">></span></a></li>
                </ul>
            </div>
             <div class="CS_info">
				<a href="<%=request.getContextPath()%>/noticeList.do"> <span id="one">고객센터 바로가기</span> <span id="two">></span>
					<br>
				</a>
			</div>
        </div>

       <div class="wManage_cont">
            <div id="wManage_cont_title">
                탈퇴요청 상세정보
            </div>
            <div class="wManage_cont_board">
                <div class="wreq_info">
                <form name="wreqDetail">
                <table>
                <tr>
                        <th colspan ="4" class="member_info">"${wdetail.mid }" 회원의 탈퇴요청입니다.</th>
					</tr>
                      <tr>
                            <th class="txt_title" >탈퇴요청 아이디</th>
                            <td class="txt_cont">${wdetail.mid }</td>
                            <th class="txt_title">탈퇴 요청일</th>
                            <td class="txt_cont">${wdetail.wred }</td>
                        </tr>
                        <tr>
                            <th colspan="4" class="txt_title">탈퇴사유</th> 
                        </tr>
                        <tr>
                            <td colspan="4" class="txt_cont">${wdetail.wrer }</td>
                        </tr>
                 
                        <tr class="notice1">
                            <td colspan="4">
                            <input type="button" value="승인하기" id="edit">
                            <input type="button" value="뒤로가기" id="reset" onclick="location.href='<%=request.getContextPath() %>/wreqList.do'">
                            </td>
                        </tr>
                </table>
               </form>
            </div>
            </div>
        </div>
    </div>
<%@ include file="../main/footer.jsp"%>

</body>
</html>