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
	        <th style="padding-top: 15px; padding-bottom: 15px;">No</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">제목</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">글쓴이</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성시간</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">조회수</th>
	      </tr>
	    </thead>
	    
	  	<c:forEach items="${list}" var="dto">
		    <tbody>
		      <tr>
		        <td style="padding-top: 20px">${dto.num}</td>
		        <td style="padding-top: 20px; padding-left:50px; cursor: pointer;" onclick="location.href='./qnaSelect?num=${dto.num}'">
		        	<c:forEach begin="1" end="${dto.depth}">[RE] </c:forEach>${dto.title}
		        </td>
		        <%-- <td style="padding-top: 20px; padding-left: 50px; cursor: pointer;">
		        	<c:forEach begin="1" end="${dto.depth}">[RE] </c:forEach>
		        	<a href="./qnaSelect?num=${dto.num}">${dto.title}</a>
		        </td> --%>
		        <td style="padding-top: 20px; text-align: center; color: #999;">${dto.writer}</td>
		        <td style="padding-top: 20px; text-align: center; color: #999;">${dto.reg_date}</td>
		        <td style="padding-top: 20px">${dto.hit}</td>
		      </tr>
		    </tbody>
	  	</c:forEach> 	    
	   </table>		
	</div>
	
	<div>
		<ul class="pager">
			<c:if test="${pager.curBlock>1}">
		    	<li><a href="./qnaList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">뒤로</a></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./qnaList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" style="color: black;">${i}</a></li>
			</c:forEach>
			
			<c:if test="${pager.curBlock < pager.totalBlock}">
				<li><a href="./qnaList?curPage=${pager.startNum+1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">다음</a></li>
			</c:if>
  		</ul>
	</div>
	
		
	
	
	
	</div> <!-- container end -->
<c:import url="../temp/footer.jsp"/>	
</body>
</html>