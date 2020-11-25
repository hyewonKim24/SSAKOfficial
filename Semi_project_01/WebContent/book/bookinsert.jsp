<%@page import="dao.BookDAO"%>
<%@page import="service.book.bookService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
bookService bsv=new bookService();
bsv.getbookinfo();
%>
</body>
</html>