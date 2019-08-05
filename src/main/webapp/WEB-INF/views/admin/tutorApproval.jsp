<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/header.jsp" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style type="text/css">


</style>

</head>
<body>

<h1>tutorApproval Page</h1>
	<div class="container">
		 <div class="row">
		 <c:forEach items="${request }" var="dto">
		 	<div class="col-md-4">
      			<div class="thumbnail">
       	 			<a href="../tutorDetail?id=${member.id }" target="_blank">
          			<img src="../resources/member/${dto.memberFileVO.fname}" alt="Lights" style="width:100%; height:250px">
          			<div class="caption">
            			<p>${dto.id } 의 승인 요청입니다.</p>
        			</div>
					</a>
				</div>
			</div>
		</c:forEach>
		</div>
	</div>
		
	
	
	
	






<c:import url="../temp/footer.jsp" />
</body>
</html>