<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!--
	Full Motion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Full Motion</title>
		<meta charset="utf-8" />
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
		
<c:import url="./temp/header.jsp"  />
<c:import url="./temp/font.jsp"/>
<style type="text/css">
	
	ul {
		margin: 0;
	}
	.category_wrap {
		width: 85%; height: 100px; margin: 0 auto;
	}
	.category {
		width : 80%; list-style: none; text-align: center; height: 50px; margin: 0 auto;
	}
	.cate {
		width : 140px; height:50px; border: 1px black;
		 background: #e6e6e6; float: left; vertical-align: middle; font-family: 'Youth';
	} 
	.cate>a {
		color :black; vertical-align: middle; text-align: center; line-height: 3em; font-weight: normal; font-size: 16px;
		
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
ul {
	margin: 0;
}

</style>
	</head>
	<body id="top">
			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				<section id="banner" data-video="images/banner">
					<div class="inner">
						<header>
							<h1>TryLab</h1>

						</header>
						<a href="#main" class="more">Learn More</a>
					</div>
				</section>

			<!-- Main -->
				<div id="main">
					<div class="category_wrap">
						<ul class ="category">
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
					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails">
							<c:forEach items="${lessons}" var="les" begin="0" end="5">
								<div class="box">
									<a href="./lesson/lessonSelect?class_id=${les.class_id }" class="image fit">
										<c:forEach items="${les.file }" var="file">
											<c:if test="${file.thumbnail eq 1 }">
												<img src="./resources/lessons/${file.fname }"/> 
											</c:if>
										</c:forEach>
										<div class="inner2">
											<div style="float:left; padding-top:5px">
												<img class="img-circle" src="./resources/images/Person-Icon.png" style="width:50px;height:50px;">
											</div>
											<div style="font-size: 15px; font-weight: 400; padding-top:5px">${les.title }</div>
											<div style="float:right">${les.price }</div>
										</div>
									</a>
								</div>
							</c:forEach>
							
						</div><!-- end of thumnail -->
					</div><!-- end of inner -->
				</div><!-- end of main -->

<c:import url="./temp/footer.jsp" />

	</body>
</html>