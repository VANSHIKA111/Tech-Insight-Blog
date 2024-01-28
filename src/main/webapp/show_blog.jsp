<%@page import="Vanshika.blog.Dao.LikeDao"%>
<%@page import="Vanshika.blog.Dao.userDao"%>
<%@page import="Vanshika.blog.Helper.ConnectionProvider"%>
<%@page import="Vanshika.blog.Dao.PostDao"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page  import="Vanshika.blog.Entities.*" %>
	<%@ page errorPage="error.jsp" %>
	


	
<%
HttpSession httpSession = request.getSession();
user User= (user)httpSession.getAttribute("CurrentUser");

if(User ==null) 
{
	response.sendRedirect("login.jsp");
}

%>

<%

int post_id = Integer.parseInt(request.getParameter("post_id"));
PostDao p = new PostDao(ConnectionProvider.getConnection());
Post post = p.getPostByPostId(post_id);

%>
	    

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getPtitle() %></title>

<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>

.post-title
{
	font-size: 30px;
}
.post-content
{
	font-size: 25px;
}
.post-date
{
	font-style: italic;
	font-weight: bold;
}
.post-user-info
{
	font-size: 20px;
}
.row-user
{
	border: 2px solid #e2e2e2;
	padding-top: 12px;
}
body
{
	background : url("images/bg.jpg");
	background-size: cover;
	background-attachment: fixed;
}

</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v17.0" nonce="UQsK6wRA"></script>
</head>
<body>


<!-- navbar -->


<nav 
	class="navbar navbar-expand-lg navbar-dark banner-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs"></span> Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-graduation-cap"></span> Learn code with Adarsh <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="	fa fa-address-book-o"></span> Contact</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="	fa fa-check-square"></span>
          Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Competitive Programming </a>
          <a class="dropdown-item" href="#">Web Developement</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure and Algorithms</a>
          <a class="dropdown-item" href="#">Question Solving</a>
        </div>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#post-modal" ><span class="	fa fa-pencil-square-o "></span> Do-Post<span class="sr-only">(current)</span></a>
      </li>
      
      
    </ul>
    
    <ul class="navbar-nav mr-right">
      <li class="nav-item active">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal" ><span class="fa fa-user-circle"></span> <%= User.getName() %> <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a>
     </li>
      </ul>
    
  </div>
</nav>


<!-- end of navbar -->


<!-- Main content of the body -->


<div class="container ">

<div class="row ">

<div class="col-md-6 offset-md-3">

<div class="card mt-4">

<div class="card-header banner-background text-white">

<h4 class="post-title"><%=post.getPtitle()%></h4>

</div>

<div class="card-body">
<div class="container">
<div class="row">
<div class="col-md-6">
<img class="card-img-top " src="blogPics/<%=post.getPpic() %>"  alt="" style="max-height: 200px ">
</div>
</div>
</div>

<div class="row mt-2 row-user">

<div class="col-md-7">
<%
userDao ud = new userDao(ConnectionProvider.getConnection());

%>
<p class="post-user-info"><a href="#"><%=ud.getUserByUserId(post.getUserId()).getName() %></a> has posted</p>

</div>

<div class="col-md-5">
<p class="post-date"> <%=post.getPdate().toLocaleString() %></p>

</div>


</div>
	
<p class="post-content"> <%=post.getPcontent() %></p>

<div class="post-code">

<pre>
<%=post.getPcode() %>
</pre>

</div>

</div>

<div class="card-footer banner-background text-white">
<%LikeDao lDao = new LikeDao(ConnectionProvider.getConnection()); %>

<a type="button" class="btn btn-outline-success" onclick="doLike(<%=post.getPid() %>,<%=User.getId()%>)" > <span class="fa fa-thumbs-o-up"> &nbsp;</span> <span class="like-counter"><%=lDao.countLikeOnPost(post.getPid())%></span> </a>
<a type="button" class="btn btn-outline-success ml-3"> <span class="fa fa-commenting-o"></span></a>
	

</div>

<div class="card-footer">
<div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_blog.jsp?post_id=<%=post.getPid() %>" data-width="" data-numposts="5"></div>

</div>

</div>



</div>

</div>

</div>

<!--  end of Main content of the body -->


<!-- Profile modal -->


<!-- Button trigger modal -->
<!-- mein ne hata diya button ko -->

<!-- Modal -->


<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header banner-background text-white container text-center">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <img  src="images/<%= User.getProfile() %>  " class="img-fluid" style="max-width: 150px;max-height: 120px; ">
        <h5 class="modal-title" id="exampleModalLabel"> <%=User.getName() %></h5>
        
        <!-- Details -->
        
        <div id="profile-details">
        <table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">About</th>
      
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%= User.getId() %></td>
      
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%=User.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=User.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">Status :</th>
      <td><%= User.getAbout() %></td>
      
    </tr>
    <tr>
      <th scope="row">Registered on :</th>
      <td><%= User.getDatetime()%></td>
      
    </tr>
  </tbody>
</table>
 </div>
        <!-- End of details -->
        
        <!-- Profile edit -->
        
        <div id="profile-edit" style="display: none;">
        
        
        <h4 class="mt-2">Please Edit Carefully..</h4>
        
        
        <form action="EditServlet" method="post" enctype="multipart/form-data">
      <table class="table">
  <thead>
     <tr>
      <th scope="col">#</th>
      <th scope="col">About</th>  
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%= User.getId() %></td>
      
    </tr>
     <tr>
      <th scope="row">Name :</th>
      <td ><input type="text" name="user_name" value="<%=User.getName() %>" class="form-control"></td>
      
    </tr>
     
    <tr>
      <th scope="row">Email :</th>
      <td ><input type="email" name="user_email" value="<%=User.getEmail() %>" class="form-control"></td>
      
    </tr>
    
    <tr>
      <th scope="row">Password :</th>
      <td ><input type="password" name="user_password" value="<%=User.getPassword() %>" class="form-control"></td>
      
    </tr>
    
    <tr>
      <th scope="row">Gender :</th>
      <td><%=User.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">Status :</th>
      <td> <textarea rows="5" cols=""  class="form-control" name="user_about"><%=User.getAbout() %>
      
      </textarea></td>
      
    </tr>
    
    <tr>
      <th scope="row">Update Photo :</th>
      <td ><input type="file" name="user_photo"  class="form-control"></td>
      
    </tr>
    
  </tbody>
</table>
        
        <div class="container">
        
        <button type="submit" class="btn btn-outline-primary">Save</button>
        
        
        </div>
        
        
        
        
        </form>
        
        
        </div>
  
        <!-- End of editing -->
        
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="profile-edit-btn">Edit</button>
      </div>
    </div>
  </div>
</div>



<!-- end of profile modal -->


<!-- Posting modal -->


<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="AddPostservlet" method="post" id="add-post-form" enctype="multipart/form-data">
        
        <div class="form-group" >
        <select class="form-control" name="CategoriesSelect">
        
        <option selected disabled >---Select Categories---</option>
        
        <%
        	PostDao dao = new PostDao(ConnectionProvider.getConnection());
        	ArrayList<Categories>list =  dao.getAllCategories();
        	
        	for(Categories c : list)
        	{
        		
        	%>	
        		<option value="<%=c.getCid()%>"> <%= c.getName() %></option>
        	<%
        	 }
        	%> 
        
        </select>
        
        </div>

        <div class="form-group">
        <input type="text" placeholder="Enter Post Title" name="title_name" class="form-control">
        </div>
        <div class="form-group">
        <textarea rows="8" cols="" placeholder="Enter Your Content ..." class="form-control" name="content_name" ></textarea>
        </div>
        <div class="form-group">
        <textarea rows="8" cols="" placeholder="Enter Your Code (if any)" class="form-control" name="code_name"></textarea>
        </div>
        <div class="form-group">
        	<label>Select any photo :</label> <br> <input type="file" name="photo_name">
        </div>
          
          <div class="container text-center ">
        <button type="submit" class="btn btn-outline-primary"  id="">Post</button>
      </div>
      
        </form>
      </div>
    </div>
  </div>
</div>


<!-- end of posting modal -->



<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script src="script.js"></script>

<script>



$(document).ready(function () {
	
	let editStatus =false;
	
	$('#profile-edit-btn').click(function() {
		if(editStatus == false)
			{
			$('#profile-details').hide()
			$('#profile-edit').show();
			editStatus=true;
			$(this).text("Back")
			}
		else
			{
			$('#profile-details').show()
			$('#profile-edit').hide();
			editStatus=false;
			$(this).text("Edit")
			}
	})
})


</script>


<script >
// Adding Post 



$(document).ready(function () {
	
	$("#add-post-form").on("submit" ,function(event){
		event.preventDefault();
		console.log("clicked...")
		let form =new  FormData(this);
		
		$.ajax({
            url: "AddPostservlet",
            type: 'post',
            data: form,
            success: function (data, textStatus, jqXHR) {
                //success ..
                console.log(data);
                if(data.trim()=='Done')
                	{
                		swal("Good job!", "Posted Successfully...", "success");
                	}
                else 
                	{
                	swal("Error!!", "Something went wrong try again...", "error");
                	}
            },
            error: function (jqXHR, textStatus, errorThrown) {
                //error..
                swal("Error!!", "Something went wrong try again...", "error");
            },
            processData: false,
            contentType: false
        })
	})
})
</script>


</body>
</html>