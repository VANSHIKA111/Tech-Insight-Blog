package Vanshika.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import Vanshika.blog.Dao.userDao;
import Vanshika.blog.Entities.*;
import Vanshika.blog.Helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Loginservlet")

public class LoginServlet  extends HttpServlet
{
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String email = req.getParameter("user_email");
		String password = req.getParameter("user_password");
		
		userDao dao =new userDao(ConnectionProvider.getConnection());
		user u= dao.getEmailAndPassword(email, password);
		
		if(u==null)
		{
			//Login error
			
			message msg = new message("Invalid Details ! try with another another","error","alert-danger");
			
			HttpSession hs = req.getSession();
			hs.setAttribute("message", msg);
			resp.sendRedirect("login.jsp");
		}
		else
		{
			//Login Success
			HttpSession httpSession =req.getSession();
			httpSession.setAttribute("CurrentUser", u);
			resp.sendRedirect("profile.jsp");
			
		}
		
		
	}
		
}