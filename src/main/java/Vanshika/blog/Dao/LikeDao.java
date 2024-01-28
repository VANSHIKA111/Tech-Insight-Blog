package Vanshika.blog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao 

{
	Connection connection;
	

	public LikeDao(Connection connection) {
		this.connection = connection;
	}
	//Inserting Like in database.

		public boolean insertLike(int pid ,int uid)
		{
			boolean flag=false;
			try 
			{
				 if (!isLikedByUser(pid, uid)) {
				String query = "insert into liked (pid,uid) values(?,?)";
				
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, uid);
				
				pstmt.executeUpdate();
				flag=true;
			}
			}
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return flag;
		}
	
		//counting likes on post
		public int countLikeOnPost(int pid)
		{
			int count=0;
			
			try 
			{
				String query  = "select count(*) from liked where pid=?";
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, pid);
				
				ResultSet rSet= pstmt.executeQuery();
				
				if(rSet.next())
				{
					count = rSet.getInt("count(*)");
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return count;
		 }
		
		public boolean isLikedByUser(int pid,int uid)
		{
			boolean f=false;
			
			try 
			{
				String query = "select * from liked where pid=? and uid=?";
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, uid);
				
				ResultSet rSet= pstmt.executeQuery();
				
				if(rSet.next())
				{
					f=true;
				}
				
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return f;
		}
		
		public boolean deleteLike(int pid,int uid)
		{
			boolean f=false;
			
			try 
			{
				String query = "delete  from liked where pid=? and uid=?";
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, pid);
				pstmt.setInt(2, uid);
				pstmt.executeUpdate();
			} 
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
			return f; 
		}

}
