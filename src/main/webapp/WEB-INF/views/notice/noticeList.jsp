<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/boot.jsp"/>
<link rel="stylesheet" href="../resources/css/noticeList.css" />
<c:import url="../temp/header.jsp" />

</head>
<body>
	<div class="container">
		<div class="header">
			<div id="notice">공지사항</div>
			<div id="notice_sub">
				다양한 소식을
				<br>
				확인 해보세요.
			</div>
			<div class="c1"></div>
				<div class="btn b1">
					<div id="btn1" OnClick="location.href='./noticeWrite';">작성하기</div>
				</div>
		</div>	
	
	
	  <table class="table table-hover">
	    <thead>
	      <tr class="title" style="border-top: 1px solid #9c836a; font-size: 17px;">
	        <th style="padding-top: 15px; padding-bottom: 15px;">번호</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">제목</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성일</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">조회수</th>
	      </tr>
	    </thead>
	  
	  	<c:forEach items="${list}" var="dto">
		    <tbody>
		      <tr>
		        <td style="padding-top: 20px">${dto.num}</td>
		        <%-- <td style="padding-top: 20px"><a href="./noticeSelect?num=${dto.num}">${dto.title}</a></td> --%>
		        <td style="padding-top: 20px; padding-left:50px; cursor: pointer;" onclick="location.href='./noticeSelect?num=${dto.num}'">${dto.title}</td>
		        <td style="padding-top: 20px; text-align: center; color: #999;">${dto.reg_date}</td>
		        <td style="padding-top: 20px">${dto.hit}</td>
		      </tr>
		    </tbody>
	  	</c:forEach>  
	  </table>
	</div>	<!-- container end -->
		
		
	<!-- 페이징처리 -->
	<div>
		<ul class="pager">
			<c:if test="${pager.curBlock>1}">
		    	<li><a href="./noticeList?curPage=${pager.startNum-1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">뒤로</a></li>
			</c:if>
			
			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li><a href="./noticeList?curPage=${i}&kind=${pager.kind}&search=${pager.search}" style="color: black;">${i}</a></li>
			</c:forEach>
			
			<c:if test="${pager.curBlock < pager.totalBlock}">
				<li><a href="./noticeList?curPage=${pager.startNum+1}&kind=${pager.kind}&search=${pager.search}" style="color: black;">다음</a></li>
			</c:if>
  		</ul>
	</div>	
	
	
	
<c:import url="../temp/footer.jsp"/>	
</body>
</html>