<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import 
url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	margin: 0;
	padding: 0;
}
	.container{
		margin-top: 50px;
		width: 100%;
		height: 1000px;
		background-color: yellow;
	}
	
	.subject{
		width: 100%;
		font-size: 2.5em;
		font-weight: lighter;
		background-color: red;
		text-align:center;
		margin:0 auto;
		font-family: 'Hanna', fantasy;
	}
	
</style>
<c:import url="../temp/header.jsp" />
</head>
<body>
<div class="container">
	<div class="subject"> 클래스 신청서 </div>
	<div class="order">
		<div class="order_info"></div>
		<div class="member_info"></div>
		<div class="purchase_info"></div>
		<div class="adrress_info"></div>
		<div class="btn_div"></div>	
	</div>
</div>

</body>
</html>