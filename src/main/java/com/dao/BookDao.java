package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.BookDtls;

public class BookDao {
	
	private Connection conn;
	
	public BookDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean addBooks(BookDtls b) {
		boolean f=false;
		try {
			String sql="insert into book_dtls(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookcategory());
			ps.setString(5, b.getStatus());
			ps.setString(6,b.getPhotoName());
			ps.setString(7, b.getEmail());
		
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<BookDtls> getAllBooks(){
		
		List<BookDtls> list= new ArrayList<BookDtls>();
		BookDtls b=null;
		
		try {
			String sql="select * from book_dtls";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch(Exception e) {
         e.printStackTrace();
		}
		return list;
	}
	
	public BookDtls getBookById(int id) {
		BookDtls b=null;
		
		try {
			String sql="select * from book_dtls where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) 
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	
	public boolean updateEditBooks(BookDtls b) {
		boolean f=false;
		
		try {
			String sql="update book_dtls set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	public boolean deleteBooks(int id) {
		
		boolean f=false;
		try {
			
			String sql="delete from book_dtls where bookId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public List<BookDtls> getNewBook(){
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getRecentBooks(){
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getOldBooks(){
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,"Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4)
			{
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
				i++;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getAllRecentBook(){
		
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
public List<BookDtls> getAllBook(){
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookDtls> getAllOldBook(){
		List<BookDtls> list=new ArrayList<BookDtls>();
		BookDtls b=null;
		try {
			String sql="select * from book_dtls where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				b=new BookDtls();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setEmail(rs.getString(8));
				list.add(b);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}	