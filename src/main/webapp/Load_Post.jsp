<%@page import="Vanshika.blog.Entities.user"%>
<%@page import="java.sql.Connection"%>
<%@page import="Vanshika.blog.Dao.LikeDao"%>
<%@page import="Vanshika.blog.Entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="Vanshika.blog.Helper.ConnectionProvider"%>
<%@page import="Vanshika.blog.Dao.PostDao"%>


<div class="row">
<%  
user uu= (user) session.getAttribute("CurrentUser");
Thread.sleep(1000);

PostDao pDao = new PostDao(ConnectionProvider.getConnection());

List<Post>posts=null;

int cid = Integer.parseInt(request.getParameter("cid"));
if(cid==0)
{
	posts= pDao.getAllPosts();
}
else
{
	posts=pDao.getPostByCatId(cid);
}
if(posts.size()==0)
{
	
	  out.println("<h3 class='display-3 text-center'>No Post Yet...</h3>");
	return ;
}

for(Post p : posts)
{
	
	%>
	<div class="col-md-8">
	
	<div class="card mt-3">
	<img class="card-img-top" src="blogPics/<%=p.getPpic() %>"  alt="" style="max-height: 200px">
	
	<div class ="card-body">
	
	<b><%=p.getPtitle() %></b>
	<p><%=p.getPcontent() %></p>
	
	</div>
	
	<div class="card-footer banner-background	 text-white">
	<div class="container">
	<%
	
	LikeDao lDao = new LikeDao(ConnectionProvider.getConnection());
	
	%>
	<a type="button"  onclick="doLike(<%=p.getPid() %>,<%=uu.getId()%>)" class="btn btn-outline-success"> <span class="	fa fa-thumbs-o-up"></span><span class="like-counter"><%=lDao.countLikeOnPost(p.getPid())%></span> </a>
	<a type="button" class="btn btn-outline-success ml-3"> <span class="fa fa-commenting-o"></span></a>
	<a href="show_blog.jsp?post_id=<%=p.getPid()%>" type="button" class="btn btn-outline-success ml-3" style="color: white;">Read More</a>
	</div>
	</div>
	
	</div>
	
	</div>
		
	
	<%
}

%>
</div>