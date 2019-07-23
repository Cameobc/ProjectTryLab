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
<style type="text/css">
	#btn1 {
	border: 1px solid #9c836a;
	padding: 10px;
	}
</style>


</head>
<body>
	<div class="container">
	<h1>notice List</h1>
	
	<div class="header">
		<div id="notice">공지사항</div>
		<div id="notice_sub">
			탈잉의 다양한 소식을
			<br>
			확인 해보세요.
		</div>
		<div class="c1"></div>
		<div class="btn b1">
			<div id="btn1">작성하기</div>
		</div>
		
	</div>	<!-- header end -->
	
	
	  <table class="table table-hover">
	    <thead>
	      <tr class="title" style="border-top: 1px solid #9c836a;">
	        <th style="padding-top: 15px; padding-bottom: 15px;" >번호</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">제목</th>
	        <th style="padding-top: 15px; padding-bottom: 15px;">작성일</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td style="padding-top: 20px">1</td>
	        <td style="padding-top: 20px">파라다이스시티 취소/환불 규정 및 수수료 정책 안내</td>
	        <td style="padding-top: 20px">2018.09.21</td>
	      </tr>
	      <tr>
	        <td style="padding-top: 20px">1</td>
	        <td style="padding-top: 20px">파라다이스시티 취소/환불 규정 및 수수료 정책 안내</td>
	        <td style="padding-top: 20px">2018.09.21</td>
	      </tr>
	      <tr>
	        <td style="padding-top: 20px">1</td>
	        <td style="padding-top: 20px">파라다이스시티 취소/환불 규정 및 수수료 정책 안내</td>
	        <td style="padding-top: 20px">2018.09.21</td>
	      </tr>      	      
	    </tbody>
	  </table>
	</div>	
		
	
	
	
	
	
	
</body>
</html>