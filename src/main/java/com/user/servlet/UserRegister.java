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
import com.mysql.cj.Session;

@WebServlet("/user_registers")
public class UserRegister extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String name=req.getParameter("fullname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			
			User us=new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			UserDao dao=new UserDao(DbConnect.getConn());
			boolean f=dao.UserRegister(us);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("sucMsg", "Register Successfull");
				resp.sendRedirect("user_login.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("user_registration.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
