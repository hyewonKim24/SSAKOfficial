<link rel="stylesheet" type="text/css" href="../css/wManage1.css"/>
<link href="../css/reset.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400&display=swap" rel="stylesheet">
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>탈퇴요청 조회 목록</title>
</head>
<body>
<%@ include file="../main/header.jsp"%>
	 <div class="wdrManage">
        <div class="wdrManage_aside">
            <div id="wdrManage_asidetlt">관리자페이지</div>
            <div class="wdrManage_asidenav">
                <ul>
                    <li><a href="memberList">회원정보조회 및 수정</a></li>
                    <li><a href="orderList">주문내역조회</a></li>
                    <li><a href="wreqList">탈퇴요청관리</a></li>
                </ul>
            </div>
        </div>

        <div class="wdrManage_cont">
            <div class="wdrManage_cont_title">
                탈퇴요청관리
            </div>
            <div class="wdrManage_cont_board">
                <form>
                    <table class="wdrManage_cont_board_tb1">
                        <thead>
                            <tr>
                                <th class="txt_wdrno">번호</th>
                                <th class="txt_wdrid">아이디</th>
                                <th class="txt_wdrdate">탈퇴요청일</th>
                                <th class="txt_wdracpDate">탈퇴승인일</th>
                                <th class="txt_wdracp">탈퇴승인여부</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:if test="${not empty wdlist}">	<!--변경 : el태그 - servlet이랑 맞추기 -->
							<c:forEach items="${wdlist}" var="wd" varStatus="s">	<!--변경 : el태그 - servlet이랑 맞추기 -->
								<tr class="notice1">
								<td class="not1_wdrno">${wd.wno}</td>
								<td class="not1_wdrid"><a href="wreqDetail?mid=${wd.mid }">${wd.mid }</a></td>
                                <!-- 아이디를 클릭했을때 해당 아이디에 댛한 상세정보를 표시해줘야함 (id 값을 디비에 저장된것과 비교해서 같은것에 대한 정보를 가져옴) -->
                                <td id="not1_wdrdate">${wd.wrer }</td>
                                <td class="not1_wdracpDate">${wd.wred }</td>
                                <td class="not1_wdracp">${wd.wacd }</td>
								</tr>
							</c:forEach>
						</c:if>
                        </tbody>
                    </table>
                    
                    <div class="wdrManage_pagination">
                    	<div class="wdrManage_pagination_warp">
						<c:if test="${startPage != endPage}">
							<c:forEach varStatus="s"  begin="${startPage}" end="${endPage}" step="1">
								<a href="wreqList?pageNum=${s.count}">${s.count}</a>	<!--변경 : href 경로 -->
							</c:forEach>
						</c:if>
						</div>
					</div>
				</form>
                    <div class="wdrManage_search">
                        <table>
                            <tbody>
                                <tr>
                                    <td>
                                        <select>
                                            <option>전체</option>
                                            <option>아이디</option>
                                            <option>요청일자</option>
                                            <option>승인여부</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="text" name="wdrManage_searchbar" id="wdrManage_searchbar">
                                        <input type="button" name="wdrManage_searchbtn" id ="wdrManage_searchbtn" value="검색">
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                
            </div>
        </div>
    </div>
    
</body>
</html>