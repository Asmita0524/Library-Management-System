<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp"%>
<style type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
}
</style>
</head>
<body style="background-color:#f7f7f7;">

<%@include file="navbar.jsp" %>
<div class="container">


<h3 class="text-center mt-5">Hello,Admin</h3>

<div class="row p-5">
<div class="col-md-4"><br>
<a href="addBook.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-square-plus fa-3x text-info"></i>
<h4>Add Books</h4>
--------
</div>
</div>
</a>
</div>

<div class="col-md-4"><br>
<a href="bookDetails.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fa-solid fa-book-open fa-3x text-danger"></i>
<h4>All Books</h4>
--------
</div>
</div>
</a>
</div>

<div class="col-md-4"><br>
<a href="order.jsp">
<div class="card">
<div class="card-body text-center">
<i class="fas fa-box-open fa-3x text-warning"></i>
<h4>Orders</h4>
--------
</div>
</div>
</a>
</div>

			
			</div>
			</div>
<div class="footer" style="padding-top:239px;">
<%@include file="/Componet/footer.jsp" %>
</div>			
</body>
</html>