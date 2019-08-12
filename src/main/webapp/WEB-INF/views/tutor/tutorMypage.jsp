<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>TryLab</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../resources/assets/css/main.css" />
<c:import url="../temp/header.jsp" />
<c:import url="../temp/font.jsp"/>
<style type="text/css">
p{
 	margin: 0 0 7px 0;
}
a{
	color:#333;
}
.footer_text{
	color:white;
}
#main {
	margin: 0;
	border-top: 1px solid #9999;
	color:#333;
	height:1500px;
	font-family: 'Youth';
}

.cont {
	width: 65%;
	height: 100%;
	margin: 0 auto;
}
.info_top{
	height:13%;
}
.info_left{
	width:40%; 
	float:left;
}
.info_right{
	width:60%; 
	float:right;
}
.parts{
	width: 30%;
	height:80px;
	float:left;
	border-left: 1px solid #9999;
	padding:10px;;
	text-align: center;
	font-family: 'Youth';
	font-size: 16px;
	margin-top: 15px;
}
.info_center{
	clear: both;
	width:100%;
	margin-top: 20px;
}
.info_nav{
	width:100%;
	height: 70px;
	background-color: #f6755e;
}
.menu_bar > li{
 	float: left;
 	width:13%;
 	color: white;
 	padding:23px;
}
.info_contents{
	clear:both;
	width:95%;
	margin: 0 auto;
}
.table{
	font-size: 14px;
}
.font1{
	color:#777;
}
.font2{
	font-size: 20px;
}
</style>
</head>
<body id="top">

	<!-- Main -->
	<div id="main">
		<div class="cont">
			<div class="info_top">
				<div class="info_left">
					<img src="../resources/images/Person-Icon.png" style="width:120px; height:120px;">
					<div style="width:120px;text-align: center"><span style="font-size:20px; font-weight: bold">${sessionScope.member.id}</span> 님</div>
				</div>
				<div class="info_right">
					<div class="parts">
						<p class="font1">회원등급</p>
						<p class="font2">tutor</p>
					</div>
					<div class="parts">
						<p class="font1">내 클래스</p>
						<p class="font2" id="llength"></p>
					</div>
					<div class="parts">
						<p class="font1">이번달 수입</p>
						<p class="font2">0000원</p>
					</div>
				</div>
			</div>
			<!-- end of info_top -->
				
			
			<div class="info_center">
				<div class="info_nav">
					<ul class="menu_bar">
						<li data-target="#list" id="list">클래스 목록</li>
						<li data-target="#sales" id="sales">매출 정산</li>
						<li date-targer="#myInfo" id="myInfo">내 정보 관리</li>
					</ul>
				</div>
				<div class="info_contents">
					<!-- ajax로 화면 전환하기 -->
				</div>
			</div>

		</div>
		<!-- end of cont -->

	</div>
	
	<!-- script -->
	<script type="text/javascript">
	var id='${sessionScope.member.id}';
	var lessonLength = 0;
	
	function getList(tid) {
		
		$.ajax({
			url:"./tutorMyLesson",
			method:"get",
			data:{
				tid:tid
			},
			success:function(res){
				res=res.trim();
				$(".info_contents").html(res);
				$("#llength").html($("#lessonLength").val());
			}
			
		}); 
	}
	
	getList(id);
	
 	$("#list").click(function() {
		getList(id);
	}); 
		
 	
	</script>


	<!-- footer -->
	<c:import url="../temp/footer.jsp" />
</body>
</html>