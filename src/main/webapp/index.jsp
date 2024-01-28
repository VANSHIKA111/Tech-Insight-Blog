<%@page import="Vanshika.blog.Helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog</title>
<!-- css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
 
<!-- Navbar -->

<%@include file="normal_navbar.jsp" %>

<!-- Banner -->

<div class="container-fluid p-0 m-0 clip-background text-white">

<div class="jumbotron banner-background">

<div class="container">
<h3 class="display-3">Welcome to TechBlog</h3>
<p>Welcome to technical blog world of technology. A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>
<p>Programming language theory is the subfield of computer science that studies the design, implementation, analysis, characterization, and classification of programming languages.</p>

<a href="register.jsp" type="button" class="btn btn-light btn-lg"><span class="fa fa-external-link"></span> Start ! its Free</a> &nbsp;
<a href="login.jsp" type="button" class="btn btn-light btn-lg"><span class="	fa fa-user-circle fa-spin"></span> Login</a>
</div>

</div>

</div>

<!-- Cards -->

<div class="container">

<div class="row mb-2">
<div class="col-md-4 ">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">C Programming</h5>
    <p class="card-text">C is a powerful general-purpose programming language. It can be used to develop software like operating systems, databases, compilers, and so on. C programming is an excellent language to learn to program for beginners.</p>
    <a href="https://en.wikipedia.org/wiki/C_(programming_language)" class="btn btn-primary" >Read more</a>
  </div>
</div>

</div>

<div class="col-md-4">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">C++ Programming</h5>
    <p class="card-text">C++  pronounced "C plus plus" and sometimes abbreviated as CPP is a high-level, general-purpose programming language created by Danish computer scientist. First released in 1985 as an extension of the C programming language.</p>
    <a href="https://en.wikipedia.org/wiki/C%2B%2B" class="btn btn-primary">Read more</a>
  </div>
</div>

</div>

<div class="col-md-4">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">Java Programming</h5>
    <p class="card-text">Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies. It is a general-purpose programming language intended to let programmers write once, run anywhere.</p>
    <a href="https://en.wikipedia.org/wiki/Java_(programming_language)" class="btn btn-primary">Read more</a>
  </div>
</div>

</div>
</div>

<div class="row">


<div class="col-md-4">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">Javascript Programming</h5>
    <p class="card-text">JavaScript often abbreviated as JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS. As of 2023, 98.7% of websites use JavaScript on the client side.</p>
    <a href="https://en.wikipedia.org/wiki/JavaScript" class="btn btn-primary">Read more</a>
  </div>
</div>

</div>

<div class="col-md-4">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">C# Programming</h5>
    <p class="card-text">The C# programming language was designed by Anders Hejlsberg from Microsoft in 2000 and was later approved as an international standard by Ecma (ECMA-334) in 2002 and ISO/IEC (ISO/IEC 23270) in 2003</p>
    <a href="https://en.wikipedia.org/wiki/C_Sharp_(programming_language)" class="btn btn-primary">Read more</a>
  </div>
</div>

</div>

<div class="col-md-4">

<div class="card ">
  <img class="card-img-top">
  <div class="card-body">
    <h5 class="card-title">Python Programming</h5>
    <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.Python ranks as one of the most popular programming languages.</p>
    <a href="https://en.wikipedia.org/wiki/Python_(programming_language)" class="btn btn-primary">Read more</a>
  </div>
</div>

</div>

</div>

</div>




<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="script.js"></script>
</body>
</html>