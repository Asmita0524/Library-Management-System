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
<%@include file="allCss.jsp" %>
<style>
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width:100%;
    height: 100%;
}

.login-wrapper {
    background: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

.login-title {
    margin-bottom: 30px;
    text-align: center;
    color: #333;
    font-weight: bold;
    font-size: 24px;
}
.form-group .label {
    color: #555;
    font-weight: bold;
}

.form-group .form-control {
    border-radius: 30px;
    padding: 9px 20px;
}

.form-group .btn {
    border-radius: 30px;
    background: #007bff;
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    transition: background 0.3s;
}

.form-group .btn:hover {
    background: #0056b3;
}
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container p-2">
    <div class="login-container p-5">
        <div class="login-wrapper">
            <h2 class="login-title">Edit Book</h2>
                                
                    <%
                    int id=Integer.parseInt(request.getParameter("id"));
                    BookDao dao=new BookDao(DbConnect.getConn());
                    BookDtls b=dao.getBookById(id);
                    %>
            
<form action="../editbooks" method="post">
<input type="hidden" name="id" value="<%=b.getBookId()%>">
<div class="form-group">
<label for="exampleInputName1" class="form-label">Book Name</label>
    <input name="bname" type="text" class="form-control" id="exampleInputName1" aria-describedby="nameHelp"
    value="<%=b.getBookname()%>">
 </div>
   
 <div class="form-group">
<label for="exampleInputName1" class="form-label">Author Name</label>
    <input name="author" type="text" class="form-control" id="exampleInputName1" aria-describedby="nameHelp"
    value="<%=b.getAuthor()%>">
  </div> 
    
 <div class="form-group">   
<label for="exampleInputPassword1" class="form-label">price</label>
    <input name="price" type="number" class="form-control" id="exampleInputPassword1" aria-describedby="passwordHelp"
    value="<%=b.getPrice()%>">
 </div>
 
 <div class="form-group">
 <label for="inputState">Book Status</label>
 <select id="inputState" name="status" class="form-control">
 <% 
 if("Active".equals(b.getStatus())){
%>
<option value="Active">Active</option>
<option value="Inactive">Inactive</option>
<%
 }else{%>
 <option value="Active">Active</option>
 <option value="Inactive">Inactive</option>
 <%}
 %>
 </select>
 </div>  
 
 <button type="submit" class="btn btn-primary">Update</button>

</form>
</div>
</div>
</div>

<%@include file="/Componet/footer.jsp" %>
</body>
</html>