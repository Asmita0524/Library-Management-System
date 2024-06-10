package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.DbConnect;
import com.Entity.BookDtls;
import com.Entity.Cart;
import com.Entity.User;
import com.dao.BookDao;
import com.dao.CartDao;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        try {
       
   
            int bid = Integer.parseInt(req.getParameter("bid"));
            int uid = Integer.parseInt(req.getParameter("uid")); 

            BookDao dao = new BookDao(DbConnect.getConn());
            BookDtls b = dao.getBookById(bid);

            Cart c = new Cart();
            c.setBid(bid);
            c.setUserId(uid);
            c.setBookName(b.getBookname());
            c.setAuthor(b.getAuthor());
            c.setPrice(Double.parseDouble(b.getPrice()));
            c.setTotalPrice(Double.parseDouble(b.getPrice()));

            CartDao dao2 = new CartDao(DbConnect.getConn());
            boolean f = dao2.addCart(c);

            HttpSession session=req.getSession();

            if (f) {
              
            	session.setAttribute("addCart", "Book Added to cart");
            	resp.sendRedirect("UserBook/New_Book.jsp");
            	
            } else {
            	session.setAttribute("failed", "something wrong");
            	resp.sendRedirect("UserBook/New_Book.jsp");  
    
            }
        
            
        } catch (Exception e) {
            e.printStackTrace();
           
        }
        
    }
}
 
