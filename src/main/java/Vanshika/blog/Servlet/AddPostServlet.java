package Vanshika.blog.Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import Vanshika.blog.Dao.PostDao;
import Vanshika.blog.Entities.Post;
import Vanshika.blog.Entities.user;
import Vanshika.blog.Helper.ConnectionProvider;
import Vanshika.blog.Helper.ProfiePhoto;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/AddPostservlet")
@MultipartConfig

public class AddPostServlet extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		//int cid = Integer.parseInt(req.getParameter("CategoriesSelect"));
		int cid = Integer.parseInt(req.getParameter("CategoriesSelect"));
		String title_name = req.getParameter("title_name");
		String content_name = req.getParameter("content_name");
		String code_name = req.getParameter("code_name");
		Part part = req.getPart("photo_name");
		String path = part.getSubmittedFileName();
		
		
		HttpSession hs = req.getSession();
		user User = (user) hs.getAttribute("CurrentUser");
		
		Post post = new Post(title_name , content_name , code_name , path , null , cid , User.getId());
		PostDao dPostDao = new PostDao(ConnectionProvider.getConnection());
		boolean ans= dPostDao.SavePost(post);
		if(ans) 
		{
			out.println("Done");
			
			 ServletContext context =getServletContext();
			 String path_blog = context.getRealPath("/") + "blogPics" + File.separator + path;
			 
			 ProfiePhoto.SaveFile(part.getInputStream() , path_blog);

		}
		else 
			{
				out.println("Not done");
			}
		}
	
}