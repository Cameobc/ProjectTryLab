<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<c:import url="../temp/header.jsp" />
<style type="text/css">

</style>
</head>
<body>

	<div class="container">
		<h1>Member Join Form</h1>
		
		
	<form:form commandName="memberVO" id="frm" enctype="multipart/form-data">
		<div class="form-group">
	    	<label for="id">ID:</label>
			<form:input path="id" cssClass="form-control"/>
			<form:errors path="id"></form:errors>
		</div>
		<div class="form-group">
	    	<label for="password">PASSWORD:</label>
	    	<form:password path="pw" cssClass="form-control"/>
	  	</div> 
		<div class="form-group">
	    	<label for="password">PASSWORD CONFIRM:</label>
	    	<form:password path="pw2" cssClass="form-control"/>
	    	<form:errors path="pw2"></form:errors>
	  	</div> 
		<div class="form-group">
		    <label for="name">NAME:</label>
		    <form:input path="name" cssClass="form-control"/>
		    <form:errors path="name"></form:errors>
		</div>		
		<div class="form-group">
	    	<label for="phone">PHONE:</label>
	    	<form:input path="phone" cssClass="form-control"/>
	  	</div> 
		<div class="form-group">
		    <label for="email">EMAIL:</label>
		    <form:input path="email" cssClass="form-control"/>
		    <form:errors path="email"></form:errors>
		</div>
		<div class="form-group">
	    	<label for="gender">GENDER:</label>
	    	<form:input path="gender" cssClass="form-control"/>
	  	</div> 
		
		<div class="form-group">
			<input type="file" name="photo">
		</div>		  		
		
		<form:button cssClass="btn btn-default"> JOIN </form:button>
		    
		</form:form>

	</div>












<c:import url="../temp/footer.jsp" />
</body>
</html>