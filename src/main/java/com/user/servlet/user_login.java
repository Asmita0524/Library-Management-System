package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.DbConnect;
import com.Entity.User;
import com.dao.UserDao;

@WebServlet("/userLogin")
public class user_login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		UserDao dao=new UserDao(DbConnect.getConn());
		User us = dao.login(email, password);
		
		if(us!=null) {
			session.setAttribute("userObj", us);
			resp.sendRedirect("UserBook/home.jsp");
		}
		else {
			session.setAttribute("errorMsg","invalid email and password");
			resp.sendRedirect("user_login.jsp");
		}
	}

	
}
