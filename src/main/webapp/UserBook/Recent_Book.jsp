<%@page import="com.Entity.User"%>
<%@page import="com.Entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="com.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Recent Book</title>
<%@include file="/Componet/allCss.jsp"%>
 
 <style type="text/css">
 .crd-ho:hover{
 background-color:#fcf7f7;
 }
</style>
</head>
<body>

<%
User us = (User) session.getAttribute("userObj");
%>

<%@include file="Navbar.jsp" %>

<div class="container">
<div class="row p-3">
<%
BookDao dao=new BookDao(DbConnect.getConn());
List<BookDtls> list=dao.getAllRecentBook();
for(BookDtls b:list){
%>
<div class="col-md-3">
<div class="card crd-ho mt-2">
<div class="card-body text-center">
<img src="../images/<%=b.getPhotoName()%>" style="width:170px; height:200px;" class="img-thumblin">
<p><%=b.getBookname()%></p>
<p><%=b.getAuthor()%></p>
<p>
<%
if(b.getBookcategory().equals("Old")){
%>
Categories:<%=b.getBookcategory()%></p>
<div class="row">
<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<% 
} else{
%>
Categories:<%=b.getBookcategory()%></p>
<div class="row">
         <%  
 if(us == null) {
%>
        <a href="../user_login.jsp" class="btn btn-warning btn-sm">Add Cart</a>
<%
    } else {
%>
<a href="../cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>" class="btn btn-warning btn-sm">Add Cart</a>
<%
    }
%>

<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
<%	
}
%>
</div>
</div>
</div>
<%
}
%>
</div>

</body>
</html>