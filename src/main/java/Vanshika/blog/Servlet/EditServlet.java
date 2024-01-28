package Vanshika.blog.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import Vanshika.blog.Dao.userDao;
import Vanshika.blog.Helper.*;

import Vanshika.blog.Entities.*;
import Vanshika.blog.Helper.ConnectionProvider;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet
{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out =resp.getWriter();

		String userName = req.getParameter("user_name");
		String userEmail = req.getParameter("user_email");
		String userPassword = req.getParameter("user_password");
		String userAbout = req.getParameter("user_about");
		Part part = req.getPart("user_photo");
		String userPhoto =part.getSubmittedFileName();
		
		
		//get the user from the session
		
		HttpSession s = req.getSession();
		user User =(user)s.getAttribute("CurrentUser");
		
		User.setName(userName);
		User.setEmail(userEmail);
		User.setPassword(userPassword);
		User.setAbout(userAbout);
		String odlfile = User.getProfile();
		User.setProfile(userPhoto);
		
		
		
		//updating to database
		
		userDao dao = new userDao(ConnectionProvider.getConnection());
		boolean ans= dao.UpdateUser(User);
		
		if(ans) 
		{
			
			 ServletContext context =getServletContext();
			 String path = context.getRealPath("/") + "images" + File.separator + User.getProfile();
			 
			 //deleting oldprofile photo
			 
			 
			 String oldpath = context.getRealPath("/") + "images" + File.separator + odlfile;

			 if( ! odlfile.equals("default.png"))
			 {
			 ProfiePhoto.deleteFile(oldpath);
			 }
			 
			 if( ProfiePhoto.SaveFile(part.getInputStream(), path))
			 {
				 message msg = new message("Updated Successfully...","success","alert-success");
					
					
					s.setAttribute("message", msg);
			 }
//			 else 
//				 {
//					 message msg = new message("Something went wrong...","error","alert-danger");
//					 s.setAttribute("message", msg);
//				 }
			}
		
		else 
		{
			message msg = new message("Something went wrongs...","error","alert-danger");
			s.setAttribute("message", msg);
		}
		resp.sendRedirect("profile.jsp");
	}
	
}