<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/qnaSelect.css" />

</head>
<body>

	<div class="container">
	
		<h1>제목 : ${dto.title}</h1>
		<h1>내용 : ${dto.contents}</h1>
		
		<c:forEach items="${dto.files}" var="file">
			<a href="../resources/upload/${file.fname}">${file.oname}</a>
		</c:forEach>
	
	
	
	
	</div> <!-- container end -->


</body>
</html>