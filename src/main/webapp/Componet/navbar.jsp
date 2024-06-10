<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Library Management System</title>
    
</head>
<body>
<div class="container-fluid pt-2">
<div class="row">
<div class="col-md-3">

<h3><i class="fa-solid fa-book-open-reader"></i> Library</h3>
</div>
<div class="col-md-3 ml-auto">
<a href="books.jsp" class="btn btn-info"><i class="fa-solid fa-arrow-right-to-bracket"></i> Admin </a>
<a href="user_login.jsp" class="btn btn-info ml-2"><i class="fa-solid fa-user"></i> User </a>
</div>
</div>
</div>

    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-book"></i> Book</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mr-auto">
                
     
	         <li class="nav-item active">
                <a class="nav-link" href="UserBook/Recent_Book.jsp"><i class="fas fa-book-open"></i> Recent Book</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="UserBook/New_Book.jsp"><i class="fas fa-book-open"></i> New Book</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="UserBook/Old_Book.jsp"><i class="fas fa-book-open"></i> Old Book</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
            <a href="UserBook/setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i> Setting</a>
                   <a href="contact.jsp" class="btn btn-light my-2 my-sm-0 ml-2"><i class="fa-solid fa-address-book"></i> Contact Us</a>
            </form>
        </div>
    </nav>
</body>
</html>
