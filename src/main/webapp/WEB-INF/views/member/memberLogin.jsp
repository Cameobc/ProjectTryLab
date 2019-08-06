<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp" />
</head>
<body>
	<div class="container">
	<h1>Login Form</h1>
	
		<form action="./memberLogin" method="post">
		  <div class="form-group">
		    <label for="id">ID:</label>
		    <input type="text" class="form-control" id="id" name="id">
		  </div>
		  <div class="form-group">
		    <label for="password">PASSWORD:</label>
		    <input type="password" class="form-control" id="pw" name="pw">
		  </div>
		  
		  
		  <button type="submit" class="btn btn-default">Login</button>
	
		</form>
	
	
	
	
	</div>
	




<c:import url="../temp/footer.jsp" />
</body>
</html>