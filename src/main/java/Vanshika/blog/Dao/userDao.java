package Vanshika.blog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import Vanshika.blog.Entities.*;

public class userDao {

		 //ye class vlaues ko leke data base m dallega
	
	private Connection connection;

	public userDao(Connection connection) {
		
		this.connection = connection;
	}
	
	//method to insert user to database
	
	public boolean SaveUser(user User)
	{
		boolean flag = false;
		try 
		{
			//User->>>Database
			String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			
			PreparedStatement pstmt = this.connection.prepareStatement(query);
			//Refer to--> we need values of user -->found from user.java
			pstmt.setString(1, User.getName());
			pstmt.setString(2, User.getEmail());
			pstmt.setString(3, User.getPassword());
			pstmt.setString(4, User.getGender());
			pstmt.setString(5, User.getAbout());
			
			pstmt.executeUpdate();
			flag=true;
			
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		return flag;
			
	}
	
	//method to retrive the the email and password
	
	public  user getEmailAndPassword(String email , String password)
	{
		user User=null;
		
		try 
		{
			
			String query ="select * from user where email=? and password=?";
			
			PreparedStatement pstmt  = this.connection.prepareStatement(query);
			
			pstmt.setString(1,email );
			pstmt.setString(2,password);
			
			ResultSet Rset = pstmt.executeQuery(); //set m saara data aajayga corrosponding user ka.
			//ab data ko niklna h
			if(Rset.next())
			{
				User =new user();
				String name = Rset.getString("name");
				User.setName(name);
				
				password = Rset.getString("password");
				User.setPassword(password);
				
				email = Rset.getString("email");
				User.setEmail(email);
				
				String gender = Rset.getString("gender");
				User.setGender(gender);
				
				String about = Rset.getString("about");
				User.setAbout(about);
				
				Timestamp regdate = Rset.getTimestamp("regdate");
				User.setDatetime(regdate);
				
				String profile = Rset.getString("profile");
				User.setProfile(profile);
				
				int id = Rset.getInt("id");
				User.setId(id);
				
			}
			
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return User;
	
		
		
	}
	
	
	public boolean UpdateUser(user User)
	{
		
		boolean flag=false;
		
		try 
		{
			String query ="update user set name=? , password=? , email=? , about=? , profile=?  where id=?";
			PreparedStatement pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, User.getName());
			pstmt.setString(3, User.getEmail());
			pstmt.setString(2, User.getPassword());
			pstmt.setString(4, User.getAbout());
			pstmt.setString(5, User.getProfile());
			pstmt.setInt(6, User.getId());
			
			pstmt.executeUpdate();
			flag=true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		
		return flag;
	}
	
	
	public user getUserByUserId(int user_id)
	{
		user User = null;
		
		try 
		{
			String query = "select * from user where id=?";
			PreparedStatement pstmt = connection.prepareStatement(query);
			pstmt.setInt(1, user_id);
			
			ResultSet Rset = pstmt.executeQuery();
			
			if(Rset.next())
			{
				User =new user();
				String name = Rset.getString("name");
				User.setName(name);
				
				String password = Rset.getString("password");
				User.setPassword(password);
				
				String email = Rset.getString("email");
				User.setEmail(email);
				
				String gender = Rset.getString("gender");
				User.setGender(gender);
				
				String about = Rset.getString("about");
				User.setAbout(about);
				
				Timestamp regdate = Rset.getTimestamp("regdate");
				User.setDatetime(regdate);
				
				String profile = Rset.getString("profile");
				User.setProfile(profile);
				
				
			}
		} 
		
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		
		
		
		return User;
	}
	
	

	
}