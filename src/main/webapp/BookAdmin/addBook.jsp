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
            <h2 class="login-title">Add Book</h2>
            
        <c:if test="${not empty sucMsg }">
                    <p class="text-center text-success fs-3">${sucMsg}</p>
                    <c:remove var="sucMsg" scope="session"/>
                    </c:if>
                   
                    <c:if test="${not empty errorMsg }">
                    <p class="text-center text-danger fs-3">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session"/>
                    </c:if>        
            
<form action="../add_books" method="post" enctype="multipart/form-data">
<div class="form-group">
<label for="exampleInputName1" class="form-label">Book Name</label>
    <input name="bname" type="text" class="form-control" id="exampleInputName1" aria-describedby="nameHelp">
 </div>
   
 <div class="form-group">
<label for="exampleInputName1" class="form-label">Author Name</label>
    <input name="author" type="text" class="form-control" id="exampleInputName1" aria-describedby="nameHelp">
  </div> 
    
 <div class="form-group">   
<label for="exampleInputPassword1" class="form-label">price</label>
    <input name="price" type="number" class="form-control" id="exampleInputPassword1" aria-describedby="passwordHelp">
 </div>
 
 <div class="form-group">
 <label for="inputState">Book Categories</label>
 <select id="inputState" name="categories" class="form-control">
 <option selected>--select--</option>
 <option value="New">New Book</option>
 <option value="Old">Old Book</option>
 </select>
 </div>   
 
  <div class="form-group">
 <label for="inputState">Book Status</label>
 <select id="inputState" name="status" class="form-control">
 <option value="Active">Active</option>
 <option value="Inactive">Inavtive</option>
 </select>
 </div>  
 <br>
 <div class="form-group">
 <lable for="exampleFormControlFile1"></lable>
 <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">  
 </div>
 <br>
 <button type="submit" class="btn btn-primary">Add</button>

</form>
</div>
</div>
</div>
<%@include file="/Componet/footer.jsp" %>
</body>
</html>