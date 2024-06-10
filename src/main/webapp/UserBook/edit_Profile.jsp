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
<body style="background-color:#f0f1f2;">
<%@include file="Navbar.jsp" %>

<div class="container p-2">
    <div class="login-container p-5">
        <div class="login-wrapper">
            <h2 class="login-title">Edit Profile</h2>
            
             <c:if test="${not empty sucMsg }">
                    <p class="text-center text-success fs-3">${sucMsg}</p>
                    <c:remove var="sucMsg" scope="session"/>
                    </c:if>
                   
                    <c:if test="${not empty errorMsg }">
                    <p class="text-center text-danger fs-3">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session"/>
                    </c:if>  
            
            
             <form action="../update_profile" method="post">
             <input type="hidden" value="${userObj.id}" name="id">
                            <div class="form-group">
                                <label for="username">FullName</label>
                                <input type="text" class="form-control" required="required" name="fullname" value="${userObj.name}">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" required="required" name="email" value="${userObj.email}">
                            </div>
                             <div class="form-group">
                                <label for="number">Mobile No</label>
                                <input type="number" class="form-control" required="required" name="phno" value="${userObj.phno}">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block" style="border-radius:30px">Update</button>
                        </form>   
                           </div>
    </div>
    </div>     
<%@include file="/Componet/footer.jsp" %>
</body>
</html>