package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DBConnect.DbConnect;
import com.Entity.BookDtls;
import com.dao.BookDao;

@WebServlet("/all_old_book")
@MultipartConfig
public class AddOldBook extends HttpServlet{
	 @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	try
	{
		String bookName=req.getParameter("bname");
		String author=req.getParameter("author");
		String price=req.getParameter("price");
		String catagories="Old";
		String status="Active";
		Part part=req.getPart("bimg");
		String fileName=part.getSubmittedFileName();
		
		String useremail=req.getParameter("user");
		
		BookDtls b=new BookDtls(bookName,author,price,catagories,status,fileName,useremail);
		
		BookDao dao=new BookDao(DbConnect.getConn());
		
		boolean f=dao.addBooks(b);
		
		HttpSession session=req.getSession();
		
		if(f) {
			String path = getServletContext().getRealPath("")+"images";
			
			File file=new File(path);
			
			part.write(path + File.separator + fileName);
			
			session.setAttribute("sucMsg", "Book add Sucessfully");
			resp.sendRedirect("UserBook/sell_book.jsp");
		}
		else {
			session.setAttribute("errorMsg", "Something wrong on server");
			resp.sendRedirect("UserBook/sell_book.jsp");
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}

}
}
