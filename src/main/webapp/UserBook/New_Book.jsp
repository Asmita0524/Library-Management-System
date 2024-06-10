<%@page import="com.Entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

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
<title>Book List</title>
<%@include file="/Componet/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
    background-color: #fcf7f7;
}

#toast {
    min-width: 300px;
    position: fixed;
    bottom: 30px;
    left: 50%;
    margin-left: -125px;
    background: #333;
    padding: 10px;
    color: white;
    text-align: center;
    z-index: 1;
    font-size: 18px;
    visibility: hidden;
    box-shadow: 0px 0px 100px #000;
}

#toast.display {
    visibility: visible;
    animation: fadeIn 0.5s, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {
    from {
        bottom: 0;
        opacity: 0;
    }
    to {
        bottom: 30px;
        opacity: 1;
    }
}

@keyframes fadeOut {
    from {
        bottom: 30px;
        opacity: 1;
    }
    to {
        bottom: 0;
        opacity: 0;
    }
}
</style>
</head>
<body>

<%
User us = (User) session.getAttribute("userObj");
%>

<%@include file="Navbar.jsp" %>

<c:if test="${not empty addCart}">
    <div id="toast">${addCart}</div>
    <script type="text/javascript">
        function showToast(content) {
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(() => {
                $("#toast").removeClass("display");
            }, 2000);
        }
        showToast("${addCart}");
    </script>
    <c:remove var="addCart" scope="session"/>  
</c:if>

<div class="container">
<div class="row p-3">
<%
    BookDao dao = new BookDao(DbConnect.getConn());
    List<BookDtls> list = dao.getAllBook();
    for (BookDtls b : list) {
%>
<div class="col-md-3">
    <div class="card crd-ho">
        <div class="card-body text-center">
            <img src="../images/<%=b.getPhotoName() %>" style="width:170px; height:200px;" class="img-thumbnail">
            <p><%=b.getBookname() %></p>
            <p><%=b.getAuthor() %></p>
            <p>Categories: <%=b.getBookcategory() %></p>
            <div class="row">
          <%  
 if(us == null) {
%>
        <a href="../user_login.jsp" class="btn btn-warning btn-sm">Add Cart</a>
<%
    } else {
%>
<a href="../cart?bid=<%=b.getBookId()%>&uid=<%=us.getId()%>" class="btn btn-warning btn-sm ">Add Cart</a>
<%
    }
%>
            <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
            <a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
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
