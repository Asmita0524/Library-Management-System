package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.DbConnect;
import com.Entity.Book_Order;
import com.Entity.Cart;
import com.dao.BookOrderDao;
import com.dao.CartDao;

@WebServlet("/bookorder")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("username");
            String email = req.getParameter("email");
            String phno = req.getParameter("phno");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("pincode");
            String paymentType = req.getParameter("payment");

          
            String fullAdd = address + "," + landmark + "," + city + "," + state + "," + pincode;

            CartDao cartDao = new CartDao(DbConnect.getConn());
            List<Cart> cartItems = cartDao.getBookByUser(id);
            BookOrderDao dao2=new BookOrderDao(DbConnect.getConn());
            HttpSession session = req.getSession();

            // Checking if cart is empty
            if (cartItems.isEmpty()) {
                session.setAttribute("sucMsg", "Add Item");
                resp.sendRedirect("UserBook/cart.jsp");
                return;
            }

            List<Book_Order> orderList = new ArrayList<>();
            Random random = new Random();

            for (Cart cartItem : cartItems) {
                Book_Order order = new Book_Order();
                order.setOrderId("BOOK-ORD-" + random.nextInt(10000));
                order.setUserName(name);
                order.setEmail(email);
                order.setPhno(phno);
                order.setFulladd(fullAdd);
                order.setBookName(cartItem.getBookName());
                order.setAuthor(cartItem.getAuthor());
                order.setPrice(String.valueOf(cartItem.getPrice()));
                order.setPaymentType(paymentType);
                orderList.add(order);
            }

            
            if ("noselect".equals(paymentType)) {
              session.setAttribute("errorMsg", "Choose Payment Method");
              resp.sendRedirect("UserBook/cart.jsp");
            	
            } else {
                  boolean f=dao2.saveOrder(orderList);
                   
                  if(f) {
                	  resp.sendRedirect("UserBook/oredr_success.jsp");
 
                }
                  else {
                	  session.setAttribute("errorMsg", "Your Order Failed");
                      resp.sendRedirect("UserBook/cart.jsp");
                  }
            }

        } catch (Exception e) {
         
            e.printStackTrace();
        }
    }
}
