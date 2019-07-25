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
</head>
<body>

	<h1>qna write</h1>
	
	<div class="container">
	  <div id="qna">1:1 문의</div>
	  <br>
	  
	<form>
	  <label for="title" style="color:#9c836a;">제목</label>
	  <div>
	  	<input type="text" id="title" name="title">
	  </div><br>
	  
	  <label for="contents" style="color:#9c836a;">내용</label>
	  <div>
	  	<textarea rows="5" cols="" id="contents" name="contents"></textarea>
	  </div><br>
	  
	  <div style="float: left">
		  <label for="name" style="color:#9c836a;">이름</label>
		  <div>
		  	<input type="text" id="name" name="name">
		  </div>	  	  
	  </div>
	
	  <div style="float: right; margin-right: 30%">
		  <label for="email" style="color:#9c836a;">이메일</label>
		  <div>
		  	<input type="text" id="email" name="email">
		  </div>
	  </div>

	  <div>
	  	<label for="phone" style="color:#9c836a;">휴대폰 번호</label>
	  	<div class="col-75">
	  	<select id="country" name="country">
	        <option value="australia">Australia</option>
	        <option value="canada">Canada</option>
	        <option value="usa">USA</option>
      	</select>
	  	</div>
	  </div>	
	  
	  
	</form>

	
	</div> <!-- container end -->
</body>
</html>