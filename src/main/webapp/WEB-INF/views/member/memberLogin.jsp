<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<c:import url="../temp/header.jsp" />
<style type="text/css">
@import 
url(//fonts.googleapis.com/earlyaccess/notosanskr.css); .notosanskr * 

	*{
		margin: 0;
		padding: 0;
	}
	
	@font-face { 
		font-family: 'BMJUA'; 
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff') format('woff'); 
		font-weight: normal; 
		font-style: normal; 
	}
	
	.container{
		width: 100%;
		vertical-align:middle;
		margin-top: 50px;	
		font-family: BMJUA;
	}	
	
	.member-form{
		text-align: center;
		margin-bottom: 20px;
	}
	
	.member-label{
		width: 70px;
	    margin-right: 30px;
	    display: inline-block;
	    font-weight: 500;
	}
	
	input[type="text"], input[type="password"], input[type="email"], input[type="tel"], select, textarea {
	    appearance: none;
	    border-radius: 4px;
	    background-color: white;
	    border: none;
	    border: solid 1px rgba(144, 144, 144, 0.25);
	    color: inherit;
	    display: inline-block;
	    outline: 0;
	    padding: 0 1em;
	    text-decoration: none;
	    width: 15%;
	    border-radius: 4px;
	}
</style>	
</head>
<body>
	<div class="container">
	<h1>Login Form</h1>
	
		<form action="./memberLogin" method="post">
		  <div class="member-form">
		    <span class="member-label">ID</span>
		    <input type="text" class="member-input" id="id" name="id">
		  </div>
		  <div class="member-form">
		    <span class="member-label">PASSWORD</span>
		    <input type="password" class="member-input" id="pw" name="pw">
		  </div>
		  
		  <div class="member-form">
		  	<button type="submit" class="btn btn-default">Login</button>
		  </div>
		</form>
	
	
	
	
	</div>
	




<c:import url="../temp/footer.jsp" />
</body>
</html>