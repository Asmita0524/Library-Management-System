package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.Entity.User;

public class UserDao {
	
	private Connection conn;
	
	public UserDao(Connection conn) {
		super();
		this.conn=conn;
	}
	
	public boolean UserRegister(User us) {
		boolean f=false;
		try {
			String sql="insert into user(name,email,phono,password) values(?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2,us.getEmail());
			ps.setString(3,us.getPhno());
			ps.setString(4, us.getPassword());
			
		   int i=ps.executeUpdate();
		   
		   if(i==1) {
			   f=true;
		   }
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User login(String em, String psw) {
		User u =null;
		
		try {
			String sql="select * from user where email=? and password=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, em);
			ps.setString(2, psw);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				u=new User();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setEmail(rs.getString(3));
				u.setPhno(rs.getString(4));
				u.setPassword(rs.getString(5));
				u.setAddress(rs.getString(6));
				u.setLandmark(rs.getString(7));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	public boolean checkPassword(int id, String ps) {
        boolean f = false;
        String sql = "select * from user where id = ? and password = ?";

        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setInt(1, id);
            pst.setString(2, ps);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    f = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateProfile(User us) {
        boolean f = false;
        String sql = "update user set name = ?, email = ?, phono = ? where id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, us.getName());
            ps.setString(2, us.getEmail());
            ps.setString(3, us.getPhno());
            ps.setInt(4, us.getId());

            int i = ps.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}