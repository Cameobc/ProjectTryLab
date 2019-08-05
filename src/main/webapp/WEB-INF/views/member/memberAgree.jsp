<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/noticeUpdate.css" />
</head>
<body>

	<div class="container">
	  <h2>수정하기</h2>
	  <form action="./noticeUpdate" method="post">
	    <div class="form-group">
	      <label for="title">제목</label>
	      <input type="text" class="form-control" id="title" name="title" value="${dto.title}">
	      <input type="hidden" name="num" value="${dto.num}">
	    </div>
	    <div class="form-group">
	      <label for="writer">작성자</label>
	      <input type="text" class="form-control" id="writer" name="writer" value="admin" readonly="readonly">
	    </div>
	    <div class="form-group">
	      <label for="contents">내용</label>
	      <textarea class="form-control" rows="10" id="contents" name="contents">${dto.contents}</textarea>
	    </div>	    
		<button type="submit" class="btn btn-default">수정</button>
	  </form>
	  
	  
	</div>	
	
	
</body>
</html>