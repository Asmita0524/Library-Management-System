<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Management User Registration</title>
      <%@include file="Componet/allCss.jsp"%>
<style type="text/css">
	body {
    background-color: #f8f9fa;
}

.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
}

.login-wrapper {
    background: #fff;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
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
    padding: 10px 20px;
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
  <%@include file="Componet/navbar.jsp"%>
    <div class="login-container p-5">
        <div class="login-wrapper">
            <h2 class="login-title">User Registration</h2>
                    <div class="card-body">
                    
                    <c:if test="${not empty sucMsg }">
                    <p class="text-center text-success fs-3">${sucMsg}</p>
                    <c:remove var="sucMsg" scope="session"/>
                    </c:if>
                   
                    <c:if test="${not empty errorMsg }">
                    <p class="text-center text-danger fs-3">${errorMsg}</p>
                    <c:remove var="errorMsg" scope="session"/>
                    </c:if>
                   
                        <form action="user_registers" method="post">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" class="form-control" name="fullname" placeholder="Enter username">
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" name="email" placeholder="Enter email">
                            </div>
                             <div class="form-group">
                                <label for="email">Mobile No</label>
                                <input type="number" class="form-control" name="phno" placeholder="Enter phno">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" class="form-control" name="password" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary btn-block" style="border-radius:30px">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="Componet/footer.jsp" %>
</body>
</html>
