package Vanshika.blog.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import Vanshika.blog.Entities.*;

public class PostDao 
{
		Connection connection;
		
		public PostDao(Connection connection) {
			this.connection = connection;
		}



		//fetching the datas(categories) from data base in  arraylist.
		
		public ArrayList<Categories> getAllCategories()
		{
			ArrayList<Categories>list = new ArrayList<>();
			
			try
			{
				String query="select  * from categories";
				Statement stmt = connection.createStatement();
				ResultSet rSet = stmt.executeQuery(query);
				
				while(rSet.next())
				{
					int cid =rSet.getInt("cid");
					
					String name = rSet.getString("name");
					
					String description = rSet.getString("description");
					
					Categories categories = new Categories(cid,name,description);
					
					list.add(categories);
				}
				
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return list;
		}
		
		public boolean SavePost(Post p)
		{
			boolean flag=false;
			
			
			try  
			{
				String query ="insert into post (ptitle , pcontent , pcode , ppic  , catid , userId) values(?,?,?,?,?,?)";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				
				preparedStatement.setString(1, p.getPtitle());
				preparedStatement.setString(2, p.getPcontent());
				preparedStatement.setString(3, p.getPcode());
				preparedStatement.setString(4, p.getPpic());
				preparedStatement.setInt(5, p.getCatid());
				preparedStatement.setInt(6, p.getUserId());
				
				preparedStatement.executeUpdate();
				flag=true;
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			
			return flag;
		}
		//getting all the posts
		public List<Post> getAllPosts()
		{
			List<Post> list = new ArrayList<>();
			
			try 
			{
				String query = "select * from post order by pid desc";
				
				PreparedStatement pstmt = connection.prepareStatement(query);
				
				ResultSet rSet = pstmt.executeQuery();
				
				while(rSet.next())
				{
					int pid = rSet.getInt("pid");
					String ptitle = rSet.getString("ptitle");
					String pcontent = rSet.getString("pcontent"); 
					String pcode = rSet.getString("pcode"); 
					String ppic = rSet.getString("ppic");
					Timestamp pdate= rSet.getTimestamp("pdate");
					int catid = rSet.getInt("catid"); 
					int userId = rSet.getInt("userId");
					
					Post post = new Post(pid , ptitle , pcontent , pcode , ppic , pdate , catid , userId);
					list.add(post);
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return list;
			
		}
		
		//by ID
		public List<Post> getPostByCatId(int catid)
		{
			List<Post>list = new ArrayList<>();
			
			try 
			{
				String query = "select * from post where catid = ?";
				
				PreparedStatement pstmt = connection.prepareStatement(query);
				pstmt.setInt(1, catid);
				
				ResultSet rSet = pstmt.executeQuery();
				
				while(rSet.next())
				{
					int pid = rSet.getInt("pid");
					String ptitle = rSet.getString("ptitle");
					String pcontent = rSet.getString("pcontent"); 
					String pcode = rSet.getString("pcode"); 
					String ppic = rSet.getString("ppic");
					Timestamp pdate= rSet.getTimestamp("pdate");
					int userId = rSet.getInt("userId");
					
					Post post = new Post(pid , ptitle , pcontent , pcode , ppic , pdate , catid , userId);
					list.add(post);
				}
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return list;
			
		}
		//
		public Post getPostByPostId (int postId)
		{
			Post post =null;
			try
			{
				
				String query = "select *  from post where pid=?";
				PreparedStatement preparedStatement = connection.prepareStatement(query);
				preparedStatement.setInt(1, postId);
				ResultSet rSet = preparedStatement.executeQuery();
				
				if(rSet.next())
				{
					int pid = rSet.getInt("pid");
					String ptitle = rSet.getString("ptitle");
					String pcontent = rSet.getString("pcontent"); 
					String pcode = rSet.getString("pcode"); 
					String ppic = rSet.getString("ppic");
					Timestamp pdate= rSet.getTimestamp("pdate");
					int catid = rSet.getInt("catid");
					int userId = rSet.getInt("userId");
					
					post = new Post(pid , ptitle , pcontent , pcode , ppic , pdate , catid , userId);
					
				}
				
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			return post;
		}
		
		
		
		
}