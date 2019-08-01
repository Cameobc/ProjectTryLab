<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<c:import url="../temp/header.jsp" />

<style type="text/css">
	body { 
		background-color: white;
	}
	h1 {
		color : black;
	}

</style>

</head>
<body>
	<div class="container">
		
	<h1>memberList Page</h1>	 
	
	<form action="./memberList" id="frm" method="post">	
	  <table class="table table-hover">
		<tr>
			<td>ID</td>
			<td>PW</td>
			<td>NAME</td>
			<td>PHONE</td>
			<td>EMAIL</td>
			<td>GENDER</td>
			<td>GRADE</td>
		</tr>
			<c:forEach items="${list }" var="dto">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.pw }</td>
					<td>${dto.name }</td>
					<td>${dto.phone }</td>
					<td>${dto.email}</td>
					<td>${dto.gender }</td>
					<td>${dto.grade }</td>
				</tr>
			</c:forEach>	
	
	
	   </table>
	
	</form>
	

	
	</div>
	
	
	
	
	
	
	
	
<c:import url="../temp/footer.jsp" />
</body>
</html>