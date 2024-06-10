<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<%@page import="com.Entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="com.dao.BookOrderDao"%>
<%@page import="com.Entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/Componet/allCss.jsp" %>
</head>
<body>

<c:if test="${empty userObj}">
<c:redirect url="../user_login.jsp"/>
</c:if>

<%@include file="Navbar.jsp" %>
<div class="container">
<h3 class="text-center text-dark pt-3">Your Order</h3>
<table class="table table-bordered mt-3">
  <thead class="bg-primary text-white">
    <tr>
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u=(User)session.getAttribute("userObj");
  BookOrderDao dao=new BookOrderDao(DbConnect.getConn());
  List<Book_Order> blist=dao.getBook(u.getEmail());
  for(Book_Order b:blist){
  %>
     <tr>
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
    </tr>
  <%	  
  }
  %>
  

  </tbody>
</table>
</body>
</html>