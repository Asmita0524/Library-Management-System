<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Componet/allCss.jsp"%>
<style>
	body {
    background-color: #f8f9fa;
    font-family: 'Arial', sans-serif;
}

.container {
    max-width: 900px;
    margin: auto;
}

.card.contact-card {
    background-color: #ffffff;
    border: none;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.card-header {
    background-color: #ffffff;
    text-align: center;
    border-bottom: none;
    padding: 1.25rem 1.5rem;
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
}

.card-header h3 {
    margin: 0;
    color: #333333;
    font-weight: bold;
}

.card-body {
    padding: 2rem;
}

.form-control {
    background-color: #f7f7f7;
    border: 1px solid #cccccc;
    border-radius: 5px;
    padding: 1rem;
    color: #333333;
}

.form-control::placeholder {
    color: #999999;
}

.form-control:focus {
    background-color: #ffffff;
    border-color: #007bff;
    box-shadow: none;
    color: #333333;
}

label {
    font-weight: bold;
    margin-bottom: 0.5rem;
    color: #333333;
}

.btn-custom {
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    padding: 1rem;
    color: #ffffff;
    transition: background-color 0.3s;
}

.btn-custom:hover {
    background-color: #0056b3;
}
    </style>
</head>
<body>
<%@include file="Componet/navbar.jsp"%>
<div class="container">
    <div class="contact-container">
        <h2 class="text-center pt-5">Contact Us</h2>
          <div class="card-body">
        <div class="contact-info">
            <h3>Contact Information</h3>
            <p><strong>Address:</strong> 123 Library Lane, Booktown, BK 12345</p>
            <p><strong>Phone:</strong> (123) 456-7890</p>
            <p><strong>Email:</strong> contact@librarysystem.com</p>
        </div>
        
                        <form>
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Your Name" required>
                            </div>
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" id="email" placeholder="Your Email" required>
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" rows="5" placeholder="Your Message" required></textarea>
                            </div>
                            <button type="submit" class="btn btn-custom btn-info">Send Message</button>
                        </form>
                    </div>
    </div>
</div>
<%@include file="Componet/footer.jsp" %>
</body>
</html>
