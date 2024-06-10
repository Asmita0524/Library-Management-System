package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user_logout")
public class user_logout extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			HttpSession session=req.getSession();
			session.removeAttribute("userObj");
			
			HttpSession session2=req.getSession();
			session.setAttribute("sucMsg", "Logout Sucessully");
			resp.sendRedirect("index.jsp");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	

}

