<%@page import="com.Entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DBConnect.DbConnect"%>
<%@page import="com.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h4 class="text-center pt-3">View Book Details</h4>

        <c:if test="${not empty sucMsg }">
                    <p class="text-center text-success fs-3">${sucMsg}</p>
                    <c:remove var="sucMsg" scope="session"/>
                    </c:if>
                   
                    <c:if test="${not empty errorMsg }">
                    <p class="text-center text-danger fs-3">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session"/>
                    </c:if>
<br>
<div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Book Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Categories</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
            
            
            <%
            BookDao dao=new BookDao(DbConnect.getConn());
            List<BookDtls> list=dao.getAllBooks();
            for(BookDtls b:list){
            %>
            	<tr>
                    <td><%=b.getBookId()%></td>
                    <td><img src="../images/<%=b.getPhotoName()%>" style="width:90px; height:70px;"></td>
                    <td><%=b.getBookname()%></td>
                    <td><%=b.getAuthor()%></td>
                    <td><%=b.getPrice()%></td>
                    <td><%=b.getBookcategory()%></td>
                    <td><%=b.getStatus()%></td>
                    <td><a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary">Edit</a>
                        <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary">Delete</a></td>
                </tr>
            	
            <%
            }
            %>
            
         </tbody>
        </table>
        </div>
        <%@include file="/Componet/footer.jsp" %>
</body>
</html>