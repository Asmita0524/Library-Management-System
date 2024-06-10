<%@page import="com.Entity.User"%>
<%@page import="com.Entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BookDao"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
<%@include file="Componet/allCss.jsp"%>
 
 <style type="text/css">
 .crd-ho:hover{
 background-color:#fcf7f7;
 }
 
 </style>
</head>
<body style="background-color:#f7f7f7">

<%
User us = (User) session.getAttribute("userObj");
%>

<%@include file="Componet/navbar.jsp" %>

<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    
    <div class="carousel-inner">
        <div class="carousel-item active">
             <img src="images/ac2.jpg" class="d-block w-100" alt="..." height="450px" >
            
        </div>
        <div class="carousel-item">
             <img src="images/a4.jpg" class="d-block w-100" alt="..." height="450px">
        </div>
        <div class="carousel-item">
            <img src="images/ai.jpg" class="d-block w-100" alt="..." height="450px">
        </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<br>

<!-- Recent Book -->
<div class="container">
<h3 class="text-center">Recent Book</h3>
<div class="row">
<%
BookDao dao2=new BookDao(DbConnect.getConn());
List<BookDtls> list2=dao2.getRecentBooks();
for(BookDtls b:list2){
%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img src="images/<%=b.getPhotoName()%>" style="width:170px; height:200px;" class="img-thumblin">
<p><%=b.getBookname()%></p>
<p><%=b.getAuthor()%></p>
<p>
<%
if(b.getBookcategory().equals("Old")){
%>
Categories:<%=b.getBookcategory()%></p>
<div class="row">
<a href="UserBook/view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
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
        <a href="../user_login.jsp" class="btn btn-warning btn-sm ml-1">Add Cart</a>
<%
    } else {
%>
<a href="cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>" class="btn btn-warning btn-sm ml-2">Add Cart</a>
<%
    }
%>


<a href="UserBook/view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
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
<div class="text-center mt-1">
  <a href="UserBook/Recent_Book.jsp" class="btn btn-info btn-sm text-white">View All</a>
</div>
</div>



<hr>

<!--New Book-->
<br>
<div class="container">
<h3 class="text-center">New Book</h3>
<div class="row">


<%
BookDao dao =new BookDao(DbConnect.getConn());
List<BookDtls> list=dao.getNewBook();
for(BookDtls b:list)
{
%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img src="images/<%=b.getPhotoName() %>" style="width:170px; height:200px;" class="img-thumblin">
<p><%=b.getBookname() %></p>
<p><%=b.getAuthor() %></p>
<p>Categories:<%=b.getBookcategory() %></p>
<div class="row">
        <%  
 if(us == null) {
%>
        <a href="../user_login.jsp" class="btn btn-warning btn-sm ml-1">Add Cart</a>
<%
    } else {
%>
<a href="cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>" class="btn btn-warning btn-sm ml-1">Add Cart</a>
<%
    }
%>


<a href="UserBook/view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
</div>
</div>
</div>	
<%
}
%>

</div>
<div class="text-center mt-1">
  <a href="UserBook/New_Book.jsp" class="btn btn-info btn-sm text-white">View All</a>
</div>
</div>

<hr>
<!-- old book -->

<br>
<div class="container">
<h3 class="text-center">Old Book</h3>
<div class="row">

<%
BookDao dao3=new BookDao(DbConnect.getConn());
List<BookDtls> list3=dao3.getOldBooks();
for(BookDtls b:list3){
%>
<div class="col-md-3">
<div class="card crd-ho">
<div class="card-body text-center">
<img src="images/<%=b.getPhotoName()%>" style="width:170px; height:200px;" class="img-thumblin">
<p><%=b.getBookname()%></p>
<p><%=b.getAuthor()%></p>
<p>Categories:<%=b.getBookcategory()%></p>
<div class="row">
<a href="UserBook/view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
<a href=" " class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i class="fa-solid fa-indian-rupee-sign"></i></a>
</div>
</div>
</div>
</div>
<%
}
%>
</div><br>
<div class="text-center mt-1">
  <a href="UserBook/Old_Book.jsp" class="btn btn-info btn-sm text-white">View All</a>
</div>
</div>

<%@include file="Componet/footer.jsp" %>
   </body>
   </html>
  