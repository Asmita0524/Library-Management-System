package com.admin.servlet;

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

@WebServlet("/add_books")
@MultipartConfig
public class AddBook extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String catagories=req.getParameter("categories");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
			
			BookDtls b=new BookDtls(bookName,author,price,catagories,status,fileName,"admin");
			
			BookDao dao=new BookDao(DbConnect.getConn());
			
			boolean f=dao.addBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				String path = getServletContext().getRealPath("")+"images";
				
				File file=new File(path);
				
				part.write(path + File.separator + fileName);
				
				session.setAttribute("sucMsg", "Book add Sucessfully");
				resp.sendRedirect("BookAdmin/addBook.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something wrong on server");
				resp.sendRedirect("BookAdmin/addBook.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}

	}

	
}
