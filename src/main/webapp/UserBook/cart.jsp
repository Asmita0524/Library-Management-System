<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page import="com.Entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Cart"%>
<%@page import="com.Entity.User"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="com.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>
<%@include file="/Componet/allCss.jsp" %>
<style type="text/css">
  .paint-card {
    box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  }
</style>
</head>
<body style="background-color: #3f0f1f2">
<%@include file="Navbar.jsp" %>

<c:if test="${empty userObj}">
<c:redirect url="../user_login.jsp"></c:redirect>
</c:if>

<c:if test="${not empty sucMsg }">
<div class="alert alert-success" role="alert">${sucMsg}</div>
<c:remove var="sucMsg" scope="session"/>
</c:if>

<c:if test="${not empty errorMsg }">
<div class="alert alert-danger" role="alert">${errorMsg}</div>
<c:remove var="errorMsg" scope="session"/>
</c:if>


<div class="container">
<div class="row p-2">
<div class="col-md-6">
<div class="card bg-white">
<div class="card-body">
<h3 class="text-center text-success">Your Selected Item</h3>
<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
    User user = (User) session.getAttribute("userObj");
  
      CartDao dao = new CartDao(DbConnect.getConn());
      List<Cart> list = dao.getBookByUser(user.getId());
      Double totalPrice=0.00;
      for (Cart c : list) {
    	  totalPrice=c.getTotalPrice();
  %>
    <tr>
      <td><%=c.getBookName()%></td>
      <td><%=c.getAuthor()%></td>
      <td><%=c.getPrice()%></td>
      <td>
        <a href="../remove_book?bid=<%=c.getBid()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>
  <%
      }
  %>
  <tr>
  <td>Total Price </td>
  <td></td>
  <td></td>
  <td><%=totalPrice%></td>
  </tbody>
</table>
</div>
</div>
</div>

<div class="col-md-6">
  <div class="card">
    <div class="card-body">
      <h3 class="text-center text-success">Your Details for Order</h3>
      <form action="../bookorder" method="post">
        <input type="hidden" value="${userObj.id}" name="id">
        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputName">Name</label>
            <input type="text" class="form-control" id="inputName" name="username" value="${userObj.name}" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputEmail">Email</label>
            <input type="email" class="form-control" id="inputEmail" name="email" value="${userObj.email}" required>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputPhone">Phone Number</label>
            <input type="number" class="form-control" id="inputPhone" name="phno" value="${userObj.phno}" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputAddress">Address</label>
            <input type="text" class="form-control" id="inputAddress" name="address" required>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputLandmark">Landmark</label>
            <input type="text" class="form-control" id="inputLandmark" name="landmark" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputCity">City</label>
            <input type="text" class="form-control" id="inputCity" name="city" required>
          </div>
        </div>

        <div class="form-row">
          <div class="form-group col-md-6">
            <label for="inputState">State</label>
            <input type="text" class="form-control" id="inputState" name="state" required>
          </div>
          <div class="form-group col-md-6">
            <label for="inputPincode">Pin code</label>
            <input type="text" class="form-control" id="inputPincode" name="pincode" required>
          </div>
        </div>

        <div class="form-group">
          <label>Payment Mode</label>
          <select class="form-control" name="payment" required>
            <option value="noselect">--Select--</option>
            <option value="COD">Cash On Delivery</option>
          </select>
        </div>

        <div class="text-center">
          <button type="submit" class="btn btn-warning">Order Now</button>
          <a href="index.jsp" class="btn btn-success">Continue Shopping</a>
        </div>
      </form>
    </div>
  </div>
</div>


</div>
</div>
</body>
</html>
