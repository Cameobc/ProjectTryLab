<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<c:import url="../temp/header.jsp" />
<c:import url="../temp/font.jsp" />
<c:import url="../temp/boot.jsp" />
<style type="text/css">
ul {
	margin: 0;
}
body{
	color:white;
}
#main {
	margin: 0;
	border-top: 1px solid #9999;
	color:#333;
}

.cont {
	width: 65%;
	height: 100%;
	margin: 0 auto;
}

.info_img {
	float: left;
	padding-right: 10px;
	width: 58%;
	height: 550px;
}

.info_summary {
	float: right;
	width: 40%;
	height: 550px;
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

.box {
	background-color: white;
	margin-bottom: 30px;
	color:#333;
}

.inner2 {
	padding: 5px;
	font-family: 'Youth';
	color: black;
}

@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
		/* Hide the carousel text when the screen is less than 600 pixels wide */
	}
}
.title{
	font-family: 'Youth';
	font-size: 26px;
	font-weight: 500;
}
.tutor{
	color: #707070;
	font-size: 13px;
}
.info_line{
	font-family: 'Youth';
	padding-top: 20px;
	padding-bottom:15px;
	color: #666;
	font-size: 16px;
	float: right;

}
.point{
	font-weight: 600;
	font-size: 20px;
	color: #fa6348;
}
.box{
	clear:both;
	padding-top: 15px;
	border-top: 1px solid #9999;
}
.btn_style{
	display: inline-block;
    width: 45%;
    height: 50px;
    font-size: 16px;
    background-color: #f6755e;
    line-height: 50px;
    color:white;
    font-family: 'Youth';
}
.btn_style2{
	display: inline-block;
    width: 45%;
    height: 50px;
    font-size: 16px;
    background-color: white;
    line-height: 50px;
    color: #666;
    font-family: 'Youth';
    border: 1px solid #9999;
}
.menu_bar{
	width: 100%;
}
.menu_bar > li{
	
	text-decoration: none;
	float:left;
	border-bottom: 1px solid #9999;
	border-top: 1px solid #9999;
	display: inline-block;
    width: 33%;
	height:50px;
    font-family: 'Youth';
    font-size:16px;
	line-height: 50px;
    color:#777;
    text-align: center;
}
.info_contents{
	clear:both;
	color:black;
	padding-top: 10px;
	padding-right:10px;
}
.info_review{
	color:black;
	padding-top: 100px;
	font-family: 'Youth'; 
	width:100%;
}
.review_tit{
	 color:#333;
	 font-size: 22px;
	 padding-bottom:8px;
	 border-bottom: 1px solid #9999;
}
</style>
</head>
<body>

	<!-- Main -->
	<div id="main">
		<div class="cont">
			<div class="info_top">
				<div class="info_img">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<c:forEach items="${lessons.file}" begin="1"
								end="${fn:length(lessons.file) }" varStatus="idx">
								<li data-target="#myCarousel" data-slide-to="${idx.index }"></li>
							</c:forEach>

						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner">
							<div class="item active">
								<img src="../resources/lessons/${lessons.file[0].fname}"
									style="width: 100%; height: 450px">
							</div>
							<c:forEach items="${lessons.file }" begin="1"
								end="${fn:length(lessons.file) }" var="les">
								<c:forEach items="${les.fname }" var="fname" varStatus="i">
									<div class="item">
										<img src="../resources/lessons/${fname}"
											style="width: 100%; height: 450px">
									</div>
								</c:forEach>
							</c:forEach>
						</div>

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span> <span
							class="sr-only">Next</span>
						</a>
					</div>

				</div>
				<!-- end of info_img -->

				<div class="info_summary">
					<div class="tutor" title="${lessons.class_id }">
						[${lessons.tid } 선생님] <!-- 나중에 session.name -->
					</div>
					<div class="title">
						${lessons.title }
					</div>
					<div class="info_line">
						<img src="../resources/images/ic_location.png"/> ${lessons.location }&nbsp;
						<img src="../resources/images/ic_time.png"/> <span class="point">${lessons.time }</span>/분&nbsp;
						<img src="../resources/images/ic_limit.png"/> 최대 <span class="point">${lessons.limit }</span>명&nbsp;
						<img src="../resources/images/ic_price.png"/> <span class="point">${lessons.price }원</span>/1회&nbsp;
					</div>
					
					<div class="box">
						<select class="browser-default custom-select" id="selectbox">
							<option></option>
							<c:forEach items="${dates}" var="date">
								<option value="${date }">${date }</option>
							</c:forEach>
						</select>
					</div>
					<div id="newbox">
						
					</div>
					
					<div class="box">
						<span class="btn_talk btn_style">실시간 톡하기</span>
						<span class="btn_pay btn_style">수업신청</span>
					</div>
					<!-- 튜터 회원만 보이게 -->
					<c:if test="${sessionScope.member.grade eq 1 && sessionScope.member.id eq lessons.tid  }">
					<div class="box">
						<button class="btn_talk btn_style2" id="updateBtn">수정하기</button>
						<button class="btn_talk btn_style2" id="deleteBtn">삭제하기</button>
					</div>
					</c:if>
				</div>
				<!-- end of info_summary -->
			</div>
			<!-- end of info_top -->
				
			
			<div class="info_center">
				<div class="info_nav">
					<ul class="menu_bar">
						<li data-target="#intro">클래스 소개</li>
						<li data-target="#review">후기</li>
						<li date-targer="#map">위치</li>
					</ul>
				</div>
				<div class="info_contents">
					${lessons.contents }
				</div>
				<div class="info_review">
					<div class="review_tit">클래스 후기</div>
				</div>
			</div>

		</div>
		<!-- end of cont -->



	</div>
	<script type="text/javascript">
		var class_id = $(".tutor").attr("title");
		
		$("#selectbox").change(function() {
			var date = $(this).val();
			 $.ajax({
				url:"../ajax/selectDateToGetTime",
				method:"get",
				data:{
					class_id:"${lessons.class_id}",
					class_date:date
				},
				success:function(res) {
					res=res.trim();
					$("#newbox").html(res);
				}
			}); 
		});
		
		$("#updateBtn").click(function() {
			location.href="./lessonUpdate?class_id="+class_id;
		});
		$("#deleteBtn").click(function() {
			location.href="./lessonDelete?class_id="+class_id;
		});
		
	</script>
	<script>
		$(document).ready(
				function() {
					// Initialize Tooltip
					$('[data-toggle="tooltip"]').tooltip();

					// Add smooth scrolling to all links in navbar + footer link
					$(".navbar a, footer a[href='#myPage']").on('click',
							function(event) {

								// Make sure this.hash has a value before overriding default behavior
								if (this.hash !== "") {

									// Prevent default anchor click behavior
									event.preventDefault();

									// Store hash
									var hash = this.hash;

									// Using jQuery's animate() method to add smooth page scroll
									// The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
									$('html, body').animate({
										scrollTop : $(hash).offset().top
									}, 900, function() {

										// Add hash (#) to URL when done scrolling (default click behavior)
										window.location.hash = hash;
									});
								} // End if
							});
				})
	</script>
	<c:import url="../temp/footer.jsp" />

</body>
</html>