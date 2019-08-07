<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/qnaWrite.css">
<c:import url="../temp/header.jsp" />
</head>
<body>
	<div class="header"></div>
	
	<div class="container">
	  <div id="qna">1:1 문의</div>
	  <br>
	  
	<form action="./qnaWrite" method="post" enctype="multipart/form-data">
	  <label for="title" style="color:#9c836a;">제목</label>
	  <div>
	  	<input type="text" id="title" name="title">
	  </div><br>
	  
	  <label for="contents" style="color:#9c836a;">내용</label>
	  <div>
	  	<textarea rows="5" cols="" id="contents" name="contents"></textarea>
	  </div><br>
	  
	  <div style="float: left">
		  <label for="writer" style="color:#9c836a;">이름</label>
		  <div>
		  	<input type="text" id="writer" name="writer">
		  </div>	  	  
	  </div>
	
	  <div style="float: right; margin-right: 30%">
		  <label for="email" style="color:#9c836a;">이메일</label>
		  <div>
		  	<input type="text" id="email" name="email">
		  </div>
	  </div><br><br><br>

		<div>
			<input type="file" id="add" value="파일 추가">
		</div>
		
		<div id="line"></div>
		
		<div>
			<button type="submit" id="btn">수정</button>
		</div>
	  
	  </form>
	  </div>
	  
	  
<c:import url="../temp/footer.jsp"/>	  
</body>
</html>