package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.DbConnect;
import com.dao.BookDao;

@WebServlet("/delete")
public class BooksDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

   try {
	   int id=Integer.parseInt(req.getParameter("id"));
	   
	   BookDao dao=new BookDao(DbConnect.getConn());
	   boolean f=dao.deleteBooks(id);
	   
	   HttpSession session=req.getSession();
	   
	   if(f) {
		   session.setAttribute("sucMsg", "Book Deleted Succcessfully");
		   resp.sendRedirect("BookAdmin/bookDetails.jsp");
	   }
	   else {
		   session.setAttribute("errorMsg", "Something wrong on server");
		   resp.sendRedirect("BookAdmin/bookDetails.jsp");
	   }
   }catch(Exception e) {
	   e.printStackTrace();
   }
	}
	
	

}