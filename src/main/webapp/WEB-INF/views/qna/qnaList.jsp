<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/qnaList.css" />
<c:import url="../temp/header.jsp" />
</head>
<body>

	<div class="container">
		<div id="FAQ">FAQ</div>
		<div id="FAQ_sub">
		자주 문의하는 질문에 대한 답변을 
		<br>
		확인하실 수 있습니다.</div>
		<br><br>
		<div id="btn" OnClick="location.href='./qnaWrite';">1:1문의 하기</div>
		
		<!-- <div id="line"></div> -->
	
	<div class="">
	  <table class="table table-hover">
	    <thead>
	      <tr class="title" style="border-top: 1px solid #9c836a;">
	        <th style="padding-top: 15px; padding-bottom: 15px;">번호</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">제목</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성자</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성일</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">조회수</th>
	      </tr>
	    </thead>
	    
	  	<c:forEach items="${list}" var="dto">
		    <tbody>
		      <tr>
		        <td style="padding-top: 20px">${dto.num}</td>
		        <td style="padding-top: 20px; padding-left:50px; cursor: pointer;" onclick="location.href='./qnaSelect?num=${dto.num}'">${dto.title}
		        	<c:forEach begin="1" end="${dto.depth}">RE:</c:forEach>
		        </td>
		        <td style="padding-top: 20px; text-align: center; color: #999;">${dto.writer}</td>
		        <td style="padding-top: 20px; text-align: center; color: #999;">${dto.reg_date}</td>
		        <td style="padding-top: 20px">${dto.hit}</td>
		      </tr>
		    </tbody>
	  	</c:forEach> 	    
	   </table>		
	</div>	
	
	
	
	</div> <!-- container end -->
<c:import url="../temp/footer.jsp"/>	
</body>
</html>