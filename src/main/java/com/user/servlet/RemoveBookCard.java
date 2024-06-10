package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.DbConnect;
import com.dao.CartDao;

@WebServlet("/remove_book")
public class RemoveBookCard extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int bid=Integer.parseInt(req.getParameter("bid"));
		
		CartDao dao=new CartDao(DbConnect.getConn());
		boolean f=dao.deleteBook(bid);
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("sucMsg", "Book Removed from Cart");
			resp.sendRedirect("UserBook/cart.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something wrong");
			resp.sendRedirect("UserBook/cart.jsp");
		}
	}
	
	

	
}
