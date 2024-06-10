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
<%@include file="/Componet/allCss.jsp" %>
</head>
<body style="background-color:#f0f1f2">
<%@include file="Navbar.jsp" %>

<%
int bid=Integer.parseInt(request.getParameter("bid"));
BookDao dao=new BookDao(DbConnect.getConn());
BookDtls b=dao.getBookById(bid);
%>

<div class="container p-5">
<div class="row">
<div class="col-md-6 text-center p-5 border bg-white">
<img src="../images/<%=b.getPhotoName()%>" style="height:200px; width:200px"><br>
<h4 class="mt-3">
Book Name:<span class="text-success"><%=b.getBookname() %></span></h4>
<h4>Author Name:<span class="text-success"><%=b.getAuthor() %></span></h4>
<h4>Category:<span class="text-success"><%=b.getBookcategory() %></span></h4>
</div>


<div class="col-md-6 text-center p-5 border bg-white">
<h2><%=b.getBookname()%></h2>

<%
if("Old".equals(b.getBookcategory()))
{%>
<h5 class="text-primary">Contact To Seller</h5>
<h5 class="text-primary"><i class="far fa-envelope"></i>Email:<%=b.getEmail()%></h5>
<%
}%>

<br>
<div class="row">
<div class="col-md-4 text-danger text-center">
<i class="fa-solid fa-money-bill-wave fa-2x"></i>
<p>Cash on Delivery </p>
</div>

<div class="col-md-4 text-danger text-center">
<i class="fa-solid fa-rotate-left fa-2x"></i>
<p> Return Available </p>
</div>

<div class="col-md-4 text-danger text-center">
<i class="fa-solid fa-truck-moving fa-2x"></i>
<p>Free Shipping</p>
</div>
</div>

<% 
if("Old".equals(b.getBookcategory())){
%>	

<div class="text-center p-3">
<a href="../index.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Continue Shopping</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
</div>
<%
} else{%>

<div class="text-center p-3">
<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i>Add Cart</a>
<a href="" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>
</div>
<%} %>


</div>
</div>
</div>

<div class="footer" style="padding-top:210px">
<%@include file="/Componet/footer.jsp"%>
</div>
</body>
</html>