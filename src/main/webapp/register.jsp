<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	
	<%@include file="normal_navbar.jsp" %>
	
	<main class="login-background">
	
	
	<div class="container">
	
	<div class="row">
	
	<div class="col-md-6 offset-md-3">
	
	
	<div class="card">
	
	<div class="card-header text-center primary-background">
	<p><span class="fa fa-3x fa-user-circle"></span><br> Register Here</p>
	</div>
	
	
	<div class="card-body">
	
	<form action="RegisterServlet" method="post" id="reg-form">
	
	<div class="form-group">
    <label for="exampleInputPassword1">Enter Name</label>
    <input type="text" class="form-control"  id="user_name" name="user_name" placeholder="Enter name">
  </div>
	
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_email" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="user_password" placeholder="Password">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Select Gender</label> <br>
    <input type="radio"  id="user_gender" name="user_gender"  value="Male">Male &nbsp;&nbsp;
    <input type="radio"  id="user_gender" name="user_gender" value="Female">Female
  </div>
 
  
  <div class="form-group">
  <textarea class="form-control" rows="5" cols="10" name="user_about" placeholder="Enter something about yourself"></textarea>
  </div>
  
    <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="user_checkbox">
    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
  </div>
 
 <div class="container text-center" id="loader" style="display: none;">
 
 <span class="fa fa-refresh fa-spin fa-3x"></span>
 <h4>Please wait</h4>
 
 </div>
  
  <div class="text-center">
  <button type="submit" class="btn btn-primary" id="submitBtn">Submit</button>
  </div>
 
</form>
	
	</div>
	
	</div>
	
	
	</div>
	
	</div>
	
	
	</div>
	
	
	
	
	
	
	</main>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>


$(document).ready(function() {
		console.log("Loded..");
	$('#reg-form').on('submit' ,function(event){
		
		event.preventDefault();
		
		
		let form = new FormData(this);
		
		$("#submitBtn").hide();
		$("#loader").show();
		
		
		
		// send to register servlet 
		
		$.ajax({
			url:"RegisterServlet",
			type:'post',
			data:form,
			success : function (data ,textStatus,jqXHR) {
				console.log(data)
				
				$("#submitBtn").show();
				$("#loader").hide();
				if(data.trim()==='Done')
				{
				swal("Registered Successfully...")
				.then((value) => {
				 window.location="index.jsp";
				});
				}
				else swal(data);
				
			},
			error:function(jqXHR,textStatus,errorThrown){
				console.log(jqXHR)
				$("#submitBtn").show();
				$("#loader").hide();
				
				swal("Something went wrong !! Please try again")
				.then((value) => {
				 window.location="register.jsp";
				});
			},
			processData :false,
			contentType:false
		});
	});
	
});






</script>

</body>
</html>