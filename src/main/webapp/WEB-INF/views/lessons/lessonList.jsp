<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<c:import url="../temp/header.jsp" />
<c:import url="../temp/font.jsp"/>
<style type="text/css">
ul {
	margin: 0;
}

.category_wrap {
	width: 85%;
	height: 100px;
	margin: 0 auto;
}

.category {
	width: 80%;
	list-style: none;
	text-align: center;
	height: 50px;
	margin: 0 auto;
}

.cate {
	width: 140px;
	height: 50px;
	border: 1px black;
	background: #e6e6e6;
	float: left;
	vertical-align: middle;
}

.cate>a {
	color: black;
	vertical-align: middle;
	text-align: center;
	line-height: 3em;
	font-weight: normal;
	font-size: 16px;
}
.image .fit{
	height:300px;
}
img{
	height:300px;
}
.box{
	background-color: white;
	margin-bottom: 30px;
}
.inner{
	clear:both;
}
.inner2{
	padding:5px;
	font-family: 'Youth'; 
	color:black;
}
.btn_style{
	display: inline-block;
	float:right;
	margin-right:260px;
	margin-bottom:20px;
    width: 7%;
    height: 50px;
    font-size: 16px;
    background-color: #f6755e;
    line-height: 50px;
    color:white;
    font-family: 'Youth';
    text-align: center;
}
.footer_text{
	color:white;
}

.list_wrap {
	width:100%; height: 500px; margin-left: 0px;
}
.loc_wrap {
	height: 400px; margin : 0 30% 0 40%;
	float: right;
}

.loc {
	width : 80px; height : 40px !important;
	background-color: white; border: 1px solid #f6755e;
	color : black; padding: 0px;
	
}


</style>
</head>
<body id="top">

	<!-- Main -->
	<div id="main">
		<div class="list_wrap">
			<div class="loc_wrap">
				<input type="button" class="loc col-sm-4" value="종로구">
				<input type="button" class="loc col-sm-4" value="중구">
				<input type="button" class="loc col-sm-4" value="용산구">
				<input type="button" class="loc col-sm-4" value="성동구">
				<input type="button" class="loc col-sm-4" value="광진구">
				<input type="button" class="loc col-sm-4" value="동대문구">
				<input type="button" class="loc col-sm-4" value="중랑구">
				<input type="button" class="loc col-sm-4" value="성북구">
				<input type="button" class="loc col-sm-4" value="강북구">
				<input type="button" class="loc col-sm-4" value="도봉구">
				<input type="button" class="loc col-sm-4" value="노원구">
				<input type="button" class="loc col-sm-4" value="은평구">
				<input type="button" class="loc col-sm-4" value="서대문구">
				<input type="button" class="loc col-sm-4" value="마포구">
				<input type="button" class="loc col-sm-4" value="양천구">
				<input type="button" class="loc col-sm-4" value="강서구">
				<input type="button" class="loc col-sm-4" value="구로구">
				<input type="button" class="loc col-sm-4" value="금천구">
				<input type="button" class="loc col-sm-4" value="영등포구">
				<input type="button" class="loc col-sm-4" value="동작구">
				<input type="button" class="loc col-sm-4" value="관악구">
				<input type="button" class="loc col-sm-4" value="서초구">
				<input type="button" class="loc col-sm-4" value="강남구">
				<input type="button" class="loc col-sm-4" value="송파구">
				<input type="button" class="loc col-sm-4" value="강동구">
			
			</div>
		
		
		
		
		
		</div>
	
	
	
	
	
		<div class="category_wrap">
			<ul class="category">
				<li class="cate"><a>디자인</a></li>
				<li class="cate"><a>실무역량</a></li>
				<li class="cate"><a>뷰티</a></li>
				<li class="cate"><a>영상</a></li>
				<li class="cate"><a>외국어</a></li>
				<li class="cate"><a>음악</a></li>
				<li class="cate"><a>라이프스타일</a></li>
				<li class="cate"><a>재테크</a></li>
			</ul>
		</div>
		
		<c:if test="${sessionScope.member.grade eq 1 }">
			<div class="btn_style"><a href="./lessonReg">클래스 등록</a></div>
		</c:if>
		
		<div class="inner">
			<!-- Boxes -->
			<div class="thumbnails">
				<c:forEach items="${lessons}" var="les">
					<div class="box">
						<a href="./lessonSelect?class_id=${les.class_id }" class="image fit">
							<c:forEach items="${les.file }" var="file">
							<c:if test="${file.thumbnail eq 1 }">
							<img src="../resources/lessons/${file.fname }"/> 
							</c:if>
							</c:forEach>
							<div class="inner2">
								<div style="float:left; padding-top:5px"><img class="img-circle" src="../resources/images/Person-Icon.png" style="width:50px;height:50px;"></div>
								<div style="font-size: 15px; font-weight: 400; padding-top:5px">${les.title }</div>
								<div style="float:right">${les.price }</div>
							</div>
						</a>
					</div>
				</c:forEach>



			</div>



		</div>
	</div>

	<c:import url="../temp/footer.jsp" />
	
<script type="text/javascript">
	$('.loc').click(function() {
		$(this).css('background-color', '#f6755e');
		$(this).css('color', 'white');
		$(this).css('border', '1px solid white');
	});








</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>