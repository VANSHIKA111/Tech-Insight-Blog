package Vanshika.blog.Servlet;

import java.io.IOException;

import Vanshika.blog.Entities.message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
@MultipartConfig
public class LogoutServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		HttpSession hSession = req.getSession();
		
		hSession.getAttribute("CurrentUser");
		
		message msg  = new message("Logout Successfully...", "Success", "alert-success");
		hSession.setAttribute("message", msg);
		
		resp.sendRedirect("login.jsp");
	}

	
	
}