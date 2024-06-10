<%@page import="java.util.List"%>
<%@page import="com.Entity.BookDtls"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="com.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/Componet/allCss.jsp"%>
 
 <style type="text/css">
 .crd-ho:hover{
 background-color:#fcf7f7;
 }
</style>
</head>
<body>
<%@include file="Navbar.jsp" %>

<div class="container">
<div class="row p-3">

<%
BookDao dao3=new BookDao(DbConnect.getConn());
List<BookDtls> list3=dao3.getAllOldBook();
for(BookDtls b:list3){
%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img src="../images/<%=b.getPhotoName()%>" style="width:170px; height:200px;" class="img-thumblin">
<p><%=b.getBookname()%></p>
<p><%=b.getAuthor()%></p>
<p>Categories:<%=b.getBookcategory()%></p>
<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
</div>
</div>
</div>
<%
}
%>
</div>
</div>
</body>
</html>