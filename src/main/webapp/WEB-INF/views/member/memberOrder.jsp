<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<c:import url="../temp/header.jsp" />
<title>Insert title here</title>
<style type="text/css">
@import 
url(//fonts.googleapis.com/earlyaccess/hanna.css);
*{
	margin: 0;
	padding: 0;
}
	body{
		background-color: white;
	}
	.container{
		margin-top: 50px;
		width: 100%;
		height: 1000px;
		background-color: white;
	}
	
	.subject{
		text-align:center;
		width: 100%;
		font-size: 2.5em;
		font-weight: lighter;
		font-family: 'Hanna', fantasy;
		color:black;
	}
	
	.order{
		margin: 0 auto;
		margin-top:50px;
		width:70%;
	}
	
	.order_info{
		height: 200px;
		color:black;
		font-family: 'Hanna', fantasy;
	}
	
	.info_text{
		font-size: 1.8em;
	}
	
	.order_info li{
		list-style: none;
	}	
	
	.member_info{
		height: 200px;
	}
	
	.purchase_info{
		height: 300px;
		background-color: pink;
	}
	
	.btn_div{
		height : 200px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="subject"> 클래스 신청서 </div>
	<div class="order">
		<div class="order_info">
			<div class="info_text"> 클래스 정보</div>
			<ul>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="member_info"></div>
		<div class="purchase_info"></div>
		<div class="btn_div"></div>	
	</div>
</div>	
</body>
</html>