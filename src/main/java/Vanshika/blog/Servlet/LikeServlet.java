package Vanshika.blog.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import Vanshika.blog.Dao.LikeDao;
import Vanshika.blog.Helper.ConnectionProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/LikeServlet")
public class LikeServlet  extends HttpServlet

{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 response.setContentType("text/html");
		PrintWriter out = response.getWriter();
				
		 String operation = request.getParameter("operation");
         int uid = Integer.parseInt(request.getParameter("uid"));
         int pid = Integer.parseInt(request.getParameter("pid"));
         
//         out.println("data from server");
//         out.println(operation);
//         out.println(uid);
//         out.println(pid);
         
         LikeDao lDao = new LikeDao(ConnectionProvider.getConnection());
         
         if(operation.equals("like"))
         {
        	 boolean f= lDao.insertLike(pid, uid);
        	 out.println(f);
         }
	}
	
}
