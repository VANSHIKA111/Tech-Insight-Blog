package Vanshika.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import Vanshika.blog.Dao.userDao;
import Vanshika.blog.Entities.user;
import Vanshika.blog.Helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
@MultipartConfig

public class RegisterServlet extends HttpServlet
{
    @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String checkbox =req.getParameter("user_checkbox");
		
		if(checkbox==null)
		{
			out.println("Please Agree Terms and conditions");
		}
		else {
			{
				String name = req.getParameter("user_name");
				String email = req.getParameter("user_email");
				String password = req.getParameter("user_password");
				String gender = req.getParameter("user_gender");
				String about = req.getParameter("user_about");
				
				// these all values now we are going to put into user.java class
				user User = new user(name,email,password,gender,about);
				
				// Refer to userDoa.java class
				
				userDao dao = new userDao(ConnectionProvider.getConnection());
				 boolean value = dao.SaveUser(User);
				 
				 if(value)
				 {
					 //SAVE
					 out.println("Done");
				 }
				 else 
				 {
					 out.println("Error");
				 }
				
			
				
			}
		}
		
		
		
	}
	
	
}