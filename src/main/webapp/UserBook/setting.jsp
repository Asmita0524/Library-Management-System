<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/Componet/allCss.jsp" %>
<style>
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

<c:if test="${empty userObj}">
<c:redirect url="../user_login.jsp"/>
</c:if>

<%@include file="Navbar.jsp" %>
<div class="container">

<h3 class="text-center mt-3">Hello,${userObj.name}</h3>

<div class="row p-5">
<div class="col-md-6">
<a href="sell_book.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class='fas fa-book-open fa-3x'></i>
</div><br>
<h4>Sell Old Books</h4>
</div>
</div>
</a>
</div>

<div class="col-md-6">
<a href="edit_Profile.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-primary">
<i class="fa-solid fa-pen-to-square fa-3x"></i>
</div><br>
<h4>Login and Security (Edit Profile)</h4>
</div>
</div>
</a>
</div>


<div class="col-md-6 mt-3">
<a href="order.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-danger">
<i class="fas fa-box-open fa-3x"></i>
</div>
<h4>My Order</h4>
<p>Track Your Order</p>
</div>
</div>
</a>
</div>

<div class="col-md-6 mt-3">
<a href="helpline.jsp">
<div class="card">
<div class="card-body text-center">
<div class="text-warning">
<i class="fas fa-user-circle fa-3x"></i>
</div>
<h4>Help Center</h4>
<p>24*7 Service</p>
</div>
</div>
</a>
</div>

</div>
</div>

</body>
</div>

<%@include file="/Componet/footer.jsp" %>
</body>
</html>